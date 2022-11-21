# Copyright (C) 2022 by Higher Expectations for Racine County

RACE_MAPPING_WISEDASH <- system.file("extdata",
                                     "race_mapping_wisedash.csv",
                                     package = "hiRx"
) %>%
    readr::read_csv(
        file = .,
        col_names = TRUE,
        col_types = readr::cols(.default = readr::col_character()),
        show_col_types = FALSE
    )


usethis::use_data(RACE_MAPPING_WISEDASH,
                  overwrite = TRUE)
