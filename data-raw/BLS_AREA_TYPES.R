## code to prepare `BLS_AREA_TYPES` dataset goes here

BLS_AREA_TYPES <- "extdata" |>
    system.file(
        "bls_area_types.csv",
        package = "hiRx"
    ) |>
    readr::read_csv(
        col_types = "cic"
    )

usethis::use_data(BLS_AREA_TYPES, overwrite = TRUE)
