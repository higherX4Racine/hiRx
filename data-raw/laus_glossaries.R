## code to prepare `laus_glossaries` dataset goes here

laus_glossaries <- c(
    "area_type",
    "footnote",
    "measure",
    "period",
    "seasonal",
    "state_region_division"
) %>%
    rlang::set_names() %>%
    purrr::map(
        ~ laus_fetch_table(paste0("la.", .),
                           readr::cols(
                               .default = readr::col_character()
                           ))
    ) %>%
    purrr::imap(
        ~ .x %>%
            tidyr::pivot_longer(
                cols = 2:last_col()
            ) %>%
            dplyr::rename(
                key = 1
            ) %>%
            dplyr::mutate(
                table = .y,
                .before = .data$key
            )
    ) %>%
    dplyr::bind_rows()

usethis::use_data(laus_glossaries, overwrite = TRUE)
