# Copyright (C) 2022 by Higher Expectations for Racine County

RACE_MAPPING_WISEDASH <- system.file(
    "extdata",
    "race_mapping_wisedash.csv",
    package = "hiRx"
) |>
    read_race_mapping()


usethis::use_data(RACE_MAPPING_WISEDASH,
                  overwrite = TRUE)
