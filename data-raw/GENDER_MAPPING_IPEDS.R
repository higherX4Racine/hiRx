## Copyright (C) 2025 by Higher Expectations for Racine County

GENDER_MAPPING_IPEDS <- tibble::tribble(
    ~ Gender,              ~ Sex,
    "All",                 "All",
    "Female",              "Female",
    "Male",                "Non-female",
    "Another",             "Non-female",
    "Binary",              NA,
    "Unknown",             "Non-female",
    "Unknown and Another", NA
)

usethis::use_data(GENDER_MAPPING_IPEDS, overwrite = TRUE)
