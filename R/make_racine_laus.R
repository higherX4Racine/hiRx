RACINE_LOCAL_AREAS <- c(
    `00000000000` = "Wisconsin",
    `37600000000` = "Milwaukee Metro",
    `10100000000` = "Racine County",
    `66000000000` = "Racine City"
)

RACINE_MEASURES <- c(
    `03` = "Unemployment Rate",
    `04` = "Unemployed",
    `05` = "Employed",
    `06` = "Labor Force"
)

racine_laus <- function(.x) {
    .x |>
        dplyr::filter(
            .data$State == "55"
        ) |>
        dplyr::filter(
            stringr::str_detect(.data$Area,
                                stringr::str_c(names(RACINE_LOCAL_AREAS),
                                               collapse = "|"))
        ) |>
        dplyr::mutate(
            Measure = RACINE_MEASURES[.data$Measure],
            Area = RACINE_LOCAL_AREAS[.data$Area]
        ) |>
        dplyr::filter(
            !is.na(.data$Measure),
            !is.na(.data$Area)
        ) |>
        invisible()
}
