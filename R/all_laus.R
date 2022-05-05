LAUS_PATH <- "pub/time.series/la"

separate_laus_table <- function(.x) {
    .x %>%
        tidyr::separate(
            .data$Table,
            into = c(NA, NA, "Index", "Place"),
            sep = "\\.",
            remove = FALSE,
            convert = TRUE,
            fill = "right",
        ) %>%
        invisible()
}


fetch_laus_table <- function(table_name,
                             column_specification) {
    readr::read_delim(file.path(BLS_DOMAIN,
                                LAUS_PATH,
                                table_name),
                      col_types = column_specification,
                      delim = "\t",
                      trim_ws = TRUE,
                      show_col_types = FALSE,
                      na = c("", NA, "-")
    )
}


laus_tables <- xml2::read_html(
    file.path(BLS_DOMAIN,
              LAUS_PATH)
) %>%
    rvest::html_element(css = "pre") %>%
    rvest::html_text2() %>%
    readr::read_fwf(
        col_positions = readr::fwf_widths(
            c(19, 13, NA),
            col_names = c("Upload", "Bytes", "Table")
        ),
        col_types = readr::cols(
            Upload = readr::col_datetime(format = "%m/%d/%Y %I:%M %p"),
            Bytes = readr::col_integer(),
            .default = readr::col_character()
        ),
        skip = 2,
        trim_ws = TRUE,
        na = c("", NA, "<dir>")
    ) %>%
    separate_laus_table()

laus_glossaries <- c(
    "area_type",
    "footnote",
    "measure",
    "period",
    "seasonal",
    "state_region_division"
) %>%
    rlang::set_names() %>%
    purrr::map(
        ~ fetch_laus_table(paste0("la.", .),
                           readr::cols(
                               .default = readr::col_character()
                           ))
    ) %>%
    purrr::imap(
        ~ .x %>%
            tidyr::pivot_longer(
                cols = 2:last_col()
            ) %>%
            dplyr::rename(
                key = 1
            ) %>%
            dplyr::mutate(
                table = .y,
                .before = .data$key
            )
    ) %>%
    dplyr::bind_rows()

laus_maps <- fetch_laus_table(
    "la.areamaps",
    readr::cols(
        area_type_code = readr::col_character(),
        area_code = readr::col_character(),
        area_text = readr::col_character(),
        display_level = readr::col_integer(),
        selectable = readr::col_logical(),
        sort_sequence = readr::col_integer()
    )
)

laus_series_definitions <- fetch_laus_table(
    "la.series",
    readr::cols(
        series_id = readr::col_character(),
        area_type_code = readr::col_character(),
        area_code = readr::col_character(),
        measure_code = readr::col_integer(),
        seasonal = readr::col_character(),
        srd_code = readr::col_integer(),
        series_title = readr::col_character(),
        footnote_codes = readr::col_character(),
        begin_year = readr::col_integer(),
        begin_period = readr::col_character(),
        end_year = readr::col_integer(),
        end_period = readr::col_character()
    )
)

every_series_appearance <- laus_tables %>%
    dplyr::select(
        .data$Table
    ) %>%
    dplyr::filter(
        stringr::str_detect(.data$Table,
                            "data")
        ) %>%
    dplyr::mutate(
        Data = purrr::map(.data$Table,
                          ~ dplyr::distinct(fetch_laus_table(.,
                                                             .data_columns),
                                            .data$series_id))
    ) %>%
    tidyr::unnest(
        cols = "Data"
    )

early_substate_areas <- laus_series_definitions %>%
    dplyr::filter(
        .data$begin_year < 1990,
        !stringr::str_detect(.data$area_type_code,
                             "A|M|N")
    ) %>%
    dplyr::distinct(
        .data$series_id,
        .data$area_type_code,
        .data$area_code
    ) %>%
    dplyr::inner_join(
        dplyr::filter(every_series_appearance,
                      !stringr::str_detect(.data$Table,
                                           "Current")),
        by = "series_id"
    ) %>%
    dplyr::distinct(
        .data$Table,
        .data$area_code,
        .data$area_type_code
)
