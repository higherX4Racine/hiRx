areas <- c(
    `00000000000` = "Wisconsin",
    `37600000000` = "Milwaukee Metro",
    `10100000000` = "Racine County",
    `66000000000` = "Racine City"
)

measures <- c(
    `03` = "Unemployment Rate",
    `04` = "Unemployed",
    `05` = "Employed",
    `06` = "Labor Force"
)

racine_laus <- all_laus %>%
    dplyr::filter(
        .data$State == "55"
    ) %>%
    dplyr::filter(
        stringr::str_detect(.data$Area,
                            stringr::str_c(names(areas), collapse = "|"))
    ) %>%
    dplyr::mutate(
        Measure = measures[.data$Measure],
        Area = areas[.data$Area]
    ) %>%
    dplyr::filter(
        !is.na(.data$Measure),
        !is.na(.data$Area)
    )
