## code to prepare `data-raw/college reportcard api fields.csv` dataset goes here

COLLEGE_REPORTCARD_API_FIELDS <- "extdata" |>
    system.file(
        "college_reportcard_api_fields.csv",
        package = "hiRx"
    ) |>
    readr::read_csv(
        col_types = "c"
    )

usethis::use_data(COLLEGE_REPORTCARD_API_FIELDS, overwrite = TRUE)
