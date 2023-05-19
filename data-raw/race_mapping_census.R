RACE_MAPPING_CENSUS <- system.file("extdata",
                                   "race_mapping_census.csv",
                                   package = "hiRx") |>
    read_race_mapping()

usethis::use_data(RACE_MAPPING_CENSUS,
                  overwrite = TRUE)
