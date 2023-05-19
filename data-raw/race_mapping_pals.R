# Copyright (C) 2022 by Higher Expectations for Racine County

RACE_MAPPING_PALS <- system.file("extdata",
                                 "race_mapping_pals.csv",
                                 package = "hiRx"
) |>
    read_race_mapping()


usethis::use_data(RACE_MAPPING_PALS,
                  overwrite = TRUE)
