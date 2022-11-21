RACE_MAPPING_CENSUS <- system.file("extdata",
                                   "race_mapping_census.csv",
                                   package = "hiRx") %>%
    readr::read_csv(
        file = .,
        col_names = TRUE,
        col_types = readr::cols(
            .default = readr::col_character()
        ),
        show_col_types = FALSE
    )

usethis::use_data(RACE_MAPPING_CENSUS,
                  overwrite = TRUE)