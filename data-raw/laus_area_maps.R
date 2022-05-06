## code to prepare `laus_area_maps` dataset goes here

laus_area_maps <- laus_fetch_table(
    "la.areamaps",
    readr::cols(
        area_type_code = readr::col_character(),
        area_code = readr::col_character(),
        area_text = readr::col_character(),
        display_level = readr::col_integer(),
        selectable = readr::col_logical(),
        sort_sequence = readr::col_integer()
    )
)

usethis::use_data(laus_area_maps, overwrite = TRUE)
