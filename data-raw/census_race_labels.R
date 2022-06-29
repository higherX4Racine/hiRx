# Copyright (C) 2022 by Higher Expectations for Racine County

#' Codes that flag which race/ethnicity a census table refers to
#'
#' The census defines several racial and ethnic groups. These arbitrary
#' categories are somewhat consistent across different census years and
#' different types of surveys.
#' https://www.census.gov/programs-surveys/acs/guidance/which-data-tool/table-ids-explained.html
#'
census_race_labels <- system.file("extdata",
                                  "census_race_labels.csv",
                                  package = "hiRx") %>%
    readr::read_csv(
        file = .,
        col_types = readr::cols(
            `Race or Ethnic Group` = readr::col_character(),
            Code = readr::col_character(),
            Name = readr::col_character(),
            `Race/Ethnicity` = readr::col_character()
        )
    ) %>%
    tidyr::replace_na(
        replace = list(Code = "",
                       Name = "")
    )


usethis::use_data(census_race_labels, overwrite = TRUE)
