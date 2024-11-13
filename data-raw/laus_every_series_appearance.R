## code to prepare `every_laus_series_appearance` dataset goes here

laus_every_series_appearance <- bls_index_table(LAUS_PATH) |>
    dplyr::select(
        .data$Table
    ) |>
    dplyr::filter(
        stringr::str_detect(.data$Table,
                            "data")
    ) |>
    dplyr::mutate(
        Data = purrr::map(.data$Table,
                          ~ dplyr::distinct(fetch_laus_table(.,
                                                             .data_columns),
                                            .data$series_id))
    ) |>
    tidyr::unnest(
        cols = "Data"
    )

usethis::use_data(laus_series_appearance, overwrite = TRUE)
