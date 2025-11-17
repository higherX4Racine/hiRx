## Copyright (C) 2025 by Higher Expectations for Racine County

GENDER_MAPPING_IPEDS <- tibble::tribble(
    ~ Gender,              ~ Sex,
    "All",                 "All",
    "Female",              "Female",
    "Male",                "Non-female",
    "Another",             "Non-female",
    "Binary",              "Non-female",
    "Unknown",             "Non-female",
    "Unknown and Another", "Non-female"
)

usethis::use_data(GENDER_MAPPING_IPEDS, overwrite = TRUE)
