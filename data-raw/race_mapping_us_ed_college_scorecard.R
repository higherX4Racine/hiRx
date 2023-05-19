# Copyright (C) 2022 by Higher Expectations for Racine County

RACE_MAPPING_US_ED_COLLEGE_SCORECARD <- system.file(
    "extdata",
    "race_mapping_us_ed_college_scorecard.csv",
    package = "hiRx"
) |>
    read_race_mapping()

usethis::use_data(RACE_MAPPING_US_ED_COLLEGE_SCORECARD, overwrite = TRUE)
