# Copyright (C) 2022 by Higher Expectations for Racine County

.scorecard_spec <- readr::cols_only(
    UNITID = readr::col_double(),
    OPEID6 = readr::col_integer(),
    HIGHDEG = readr::col_integer(),
    UG = readr::col_integer(),
    UGDS = readr::col_integer(),
    C150_4 = readr::col_double(),
    C150_L4 = readr::col_double(),
    D150_4 = readr::col_integer(),
    D150_L4 = readr::col_integer(),
    SCUGFFN = readr::col_integer(),
    ST_FIPS = readr::col_integer(),
)

#' Import data downloaded from the National College Scorecard
#'
#' The U.S. Department of Education maintains a database of information about
#' institutions of higher education. You can download big Excel files from
#' \url{https://collegescorecard.ed.gov/data/}.
#'
#' @param .path the full path to the file
#'
#' @return a data frame / tibble with a lot of juicy detail about enrollment
#' @export
read_college_scorecard <- function(.path){
    .school_year <- as.integer(
        stringr::str_match(.path,
                           "MERGED(\\d{4})_")[1, 2]
    )

    .path %>%
        readr::read_csv(
            file = .,
            na = c("", "NA", "NULL"),
            col_types = .scorecard_spec,
            show_col_types = FALSE
        ) %>%
        dplyr::mutate(
            `School Year` = .school_year,
            Students = dplyr::coalesce(.data$UGDS,
                                       .data$UG),
            `Graduation Rate` = dplyr::coalesce(.data$C150_4,
                                                .data$C150_L4),
            `Class Size` = dplyr::coalesce(.data$D150_4,
                                           .data$D150_L4),
            Graduates = .data$`Class Size` * .data$`Graduation Rate`
        ) %>%
        dplyr::rename(
            `New Students` = .data$SCUGFFN
        ) %>%
        dplyr::group_by(
            .data$OPEID6,
            .data$`School Year`
        ) %>%
        dplyr::summarize(
            dplyr::across(c(.data$Graduates,
                            .data$`Class Size`,
                            .data$Students,
                            .data$`New Students`),
                          ~ sum(., na.rm = TRUE)
            ),
            .groups = "keep"
        ) %>%
        dplyr::ungroup() %>%
        dplyr::mutate(
            `Graduation Rate` = .data$Graduates / .data$`Class Size`
        ) %>%
        invisible()
}
