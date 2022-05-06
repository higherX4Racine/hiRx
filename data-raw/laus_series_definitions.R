## code to prepare `laus_series_definitions` dataset goes here

laus_series_definitions <- laus_fetch_table(
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

usethis::use_data(laus_series_definitions, overwrite = TRUE)
