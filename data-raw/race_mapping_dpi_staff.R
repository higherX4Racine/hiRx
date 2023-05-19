# Copyright (C) 2022 by Higher Expectations for Racine County

RACE_MAPPING_DPI_STAFF <- system.file(
    "extdata",
    "race_mapping_dpi_staff.csv",
    package = "hiRx"
) |>
    read_race_mapping()

usethis::use_data(RACE_MAPPING_DPI_STAFF,
                  overwrite = TRUE)
