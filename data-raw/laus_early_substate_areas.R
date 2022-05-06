## code to prepare `laus_early_substate_areas` dataset goes here

laus_early_substate_areas <- laus_series_definitions %>%
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
        dplyr::filter(every_laus_series_appearance,
                      !stringr::str_detect(.data$Table,
                                           "Current")),
        by = "series_id"
    ) %>%
    dplyr::distinct(
        .data$Table,
        .data$area_code,
        .data$area_type_code
    )

usethis::use_data(laus_early_substate_areas, overwrite = TRUE)
