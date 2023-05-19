# Copyright (C) 2022 by Higher Expectations for Racine County

RACE_MAPPING_TSG <- system.file(
    "extdata",
    "race_mapping_tsg.csv",
    package = "hiRx"
) |>
    read_race_mapping()



usethis::use_data(RACE_MAPPING_TSG, overwrite = TRUE)
