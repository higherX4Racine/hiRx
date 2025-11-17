## Copyright (C) 2025 by Higher Expectations for Racine County

RACE_MAPPING_IPEDS <- tibble::tribble(
    ~ `Race/Ethnicity`,      ~ Population,
    "All",                   "All",
    "White and Other Races", "American Indian or Alaska Native",
    "White and Other Races", "Asian",
    "Black",                 "Black or African American",
    "Hispanic or Latin@",    "Hispanic or Latino",
    "White and Other Races", "Native Hawaiian or Other Pacific Islander",
    "White and Other Races", "Nonresident",
    "Multiracial",           "Two or more races",
    "White and Other Races", "Unknown",
    "White and Other Races", "White",
    "White and Other Races", "Race/ethnicity unknown"
)


usethis::use_data(RACE_MAPPING_IPEDS, overwrite = TRUE)
