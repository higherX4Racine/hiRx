# Copyright (C) 2022 by Higher Expectations for Racine County
## code to prepare `racine_race_pop_weights_by_tract` dataset goes here

PLACE_FILES <- c(
    `2000` = "tl_2010_55101_cousub00.shp",
    `2010` = "tl_2010_55101_cousub10.shp",
    `2020` = "tl_2020_55_cousub.shp"
)

PLACES <- hiRx::census_tigershapes_combine(PLACE_FILES,
                                           Sys.getenv("SHAPEFILE_PATH"),
                                           .data$COUNTYFP == "101") |>
    dplyr::filter(
        .data$INTPTLON < -87.7,
        .data$INTPTLON > -87.96
    ) |>
    dplyr::rename(
        Municipality = "NAME"
    )

BLOCK_FILES <- c(
    `2000` = "tl_2010_55101_tabblock00.shp",
    `2010` = "tl_2010_55101_tabblock10.shp",
    `2020` = "tl_2020_55_tabblock20.shp"
)

BLOCKS <- hiRx::census_tigershapes_combine(BLOCK_FILES,
                                           Sys.getenv("SHAPEFILE_PATH"),
                                           .data$COUNTYFP == "101") |>
    dplyr::filter(
        .data$INTPTLON < -87.7,
        .data$INTPTLON > -87.96
    )

UTM_ZONE <- sf::st_crs(32616)

PLACE_BLOCKS <- PLACES |>
        sf::st_transform(UTM_ZONE) |>
        tidyr::nest(
            locale = !c(.data$Municipality, .data$Year)
        ) |>
        dplyr::mutate(
            blocks = purrr::map2(
                .data$locale,
                .data$Year,
                ~ dplyr::filter(BLOCKS,
                                .data$Year == .y) |>
                    sf::st_transform(UTM_ZONE) |>
                    hiRx::geom_filter_by_interior_intersection(.x) |>
                    dplyr::select(tidyselect::all_of(c("TRACTCE",
                                                       "BLOCKCE"))) |>
                    sf::st_drop_geometry()
            )
        ) |>
        dplyr::select(
            !.data$locale
        ) |>
        tidyr::unnest(
            cols = .data$blocks
        )

TRACTS <- BLOCKS |>
    dplyr::group_by(
        .data$Year,
        .data$TRACTCE
    ) |>
    dplyr::summarize(
        Area = sum(.data$ALAND + .data$AWATER) / 1e6,
        geometry = sf::st_union(.data$geometry),
        .groups = "keep"
    ) |>
    dplyr::ungroup()

.DECENNIAL_POPULATION_VARIABLES <- tibble::tribble(
    ~ year, ~ Variable, ~ Race, ~ Latinx,

    2000L, "PL001001", "Everybody", NA,
    2000L, "PL001003", "White", NA,
    2000L, "PL001004", "Black", NA,
    2000L, "PL002003", "Everybody", FALSE,
    2000L, "PL002005", "White", FALSE,
    2000L, "PL002006", "Black", FALSE,

    2010L, "P001001", "Everybody", NA,
    2010L, "P001003", "White", NA,
    2010L, "P001004", "Black", NA,
    2010L, "P002003", "Everybody", FALSE,
    2010L, "P002005", "White", FALSE,
    2010L, "P002006", "Black", FALSE,

    2020L, "P1_001N", "Everybody", NA,
    2020L, "P1_003N", "White", NA,
    2020L, "P1_004N", "Black", NA,
    2020L, "P2_003N", "Everybody", FALSE,
    2020L, "P2_005N", "White", FALSE,
    2020L, "P2_006N", "Black", FALSE,
)

.DECENNIAL_POPULATION_SETTINGS <- .DECENNIAL_POPULATION_VARIABLES |>
    dplyr::select(
        .data$year,
        .data$Variable
        ) |>
    tidyr::nest(
        data = .data$Variable
        ) |>
    dplyr::mutate(
        variables = purrr::map_chr(data,
                                   ~ paste0(.$Variable, collapse = ",")),
        .keep = "unused")


RAW_POPS <- .DECENNIAL_POPULATION_SETTINGS |>
    purrr::pmap_chr(hiRx::decennial_query_url,
                    summary_table = "pl",
                    for_geo = "block",
                    for_items = "*",
                    state = 55,
                    county = 101
    ) |>
    rlang::set_names(., .DECENNIAL_POPULATION_SETTINGS$year) |>
    purrr::map(hiRx::census_do_api_query)

POPS <- RAW_POPS |>
    purrr::map(
        census_json_to_tibble,
        variable_names = .DECENNIAL_POPULATION_VARIABLES$Variable
    ) |>
    dplyr::bind_rows(
        .id = "Year"
    ) |>
    dplyr::mutate(
        Year = as.integer(.data$Year),
        tract = stringr::str_pad(
            .data$tract,
            width = 6,
            side = "right",
            pad = "0"
        )
    ) |>
    dplyr::left_join(
        .DECENNIAL_POPULATION_VARIABLES,
        by = c(Year = "year", "Variable")
    ) |>
    dplyr::select(
        !.data$Variable
    ) |>
    tidyr::pivot_wider(
        names_from = .data$Latinx,
        values_from = .data$Population
    ) |>
    dplyr::mutate(
        Latinx = .data$`NA` - .data$`FALSE`,
        `Not Latinx` = .data$`FALSE`,
        .keep = "unused"
    )

.group_names <- setdiff(names(POPS),
                        c("Race", "Latinx", "Not Latinx")
)

.CASTE_NAMES <- tibble::tribble(
    ~ Race, ~ Latinx, ~ `Race/Ethnicity`,
    "All Other Races", TRUE, "Latin@",
    "All Other Races", FALSE, "All Other Races",
    "Black", TRUE, "Black",
    "Black", FALSE, "Black",
    "White", TRUE, "Latin@",
    "White", FALSE, "White"
)

RACES <- POPS |>
    dplyr::filter(
        .data$Race != "Everybody"
    ) |>
    dplyr::group_by(
        dplyr::across(tidyselect::all_of(.group_names))
    ) |>
    dplyr::summarize(
        dplyr::across(tidyselect::contains("Latinx"),
                      sum),
        .groups = 'keep') |>
    dplyr::left_join(
        POPS |>
            dplyr::filter(
                .data$Race == "Everybody"
            ),
        by = .group_names
    ) |>
    dplyr::mutate(
        Race = "All Other Races",
        Latinx = .data$Latinx.y - .data$Latinx.x,
        `Not Latinx` = .data$`Not Latinx.y` - .data$`Not Latinx.x`,
        .keep = "unused"
    ) |>
    dplyr::bind_rows(
        POPS |> dplyr::filter(.data$Race != "Everybody")
    ) |>
    tidyr::pivot_longer(
        cols = c("Latinx", "Not Latinx"),
        names_to = "Latinx",
        names_transform = ~ stringr::str_detect(., "Not", negate = TRUE)
    ) |>
    dplyr::inner_join(
        .CASTE_NAMES,
        by = c("Race", "Latinx")
    ) |>
    dplyr::group_by(
        dplyr::across(tidyselect::all_of(c(.group_names, "Race/Ethnicity")))
    ) |>
    dplyr::summarize(
        Population = sum(.data$value),
        .groups = "keep"
    ) |>
    dplyr::ungroup() |>
    dplyr::mutate(
        `Race/Ethnicity` = forcats::fct_relevel(.data$`Race/Ethnicity`,
                                                "Black",
                                                "Latin@",
                                                "White",
                                                "All Other Races")
    )

TRACT_RACES <- RACES |>
    dplyr::group_by(
        .data$Year,
        .data$state,
        .data$county,
        .data$tract,
        .data$`Race/Ethnicity`
    ) |>
    dplyr::summarize(
        `Tract Population` = sum(.data$Population),
        .groups = "keep"
    ) |>
    dplyr::ungroup()

racine_race_pop_weights_by_tract <- RACES |>
    dplyr::inner_join(
        PLACE_BLOCKS,
        by = c("Year", tract = "TRACTCE", block = "BLOCKCE")
    ) |>
    dplyr::group_by(
        .data$Year,
        .data$Municipality,
        .data$tract,
        .data$`Race/Ethnicity`,
    ) |>
    dplyr::summarize(
        `Municipal Population` = sum(.data$Population),
        .groups = "keep"
    ) |>
    dplyr::ungroup() |>
    dplyr::inner_join(
        TRACT_RACES,
        by = c("Year", "tract", "Race/Ethnicity")
    ) |>
    dplyr::bind_rows(
        hiRx::aggregate_over_races(.,
                                   tidyselect::ends_with("Population"))
    ) |>
    dplyr::mutate(
        `Race/Ethnicity` = factor(.data$`Race/Ethnicity`,
                                  levels = c("Black",
                                             "Latin@",
                                             "White",
                                             "All Other Races",
                                             "All"))
    )

usethis::use_data(racine_race_pop_weights_by_tract, overwrite = TRUE)
