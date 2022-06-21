# Copyright (C) 2022 by Higher Expectations for Racine County

# these are constants that match the current structure of the LAUS files.
# check these first if the package stops working.

OBSERVATION_COLUMNS <- readr::cols(
    series_id = readr::col_character(),
    year = readr::col_integer(),
    period = readr::col_character(),
    value = readr::col_double(),
    footnote_codes = readr::col_character()
)

PATTERN_FOR_LEGACY_OBSERVATIONS <- "Region|AllStates|California|NewYork"
PATTERN_FOR_CURRENT_OBSERVATIONS <- "Current"
FIRST_YEAR_OF_CURRENT_OBSERVATIONS <- 1990
PERIOD_TO_EXCLUDE <- "M13"
PERIOD_PATTERN <- "\\d+$"

laus_fetch_observations <- function(index_table,
                                    pattern) {
    index_table %>%
        dplyr::select(
            .data$Table
        ) %>%
        dplyr::filter(
            stringr::str_detect(.data$Table,
                                pattern)
        ) %>%
        dplyr::mutate(
            Data = purrr::map(.data$Table,
                              laus_fetch_table,
                              OBSERVATION_COLUMNS),
            .keep = "unused"
        ) %>%
        tidyr::unnest("Data") %>%
        invisible()
}


.as_integer_month <- function(strings) {
    as.integer(stringr::str_extract(strings,
                                    PERIOD_PATTERN))
}



laus_current <- function(.laus_tables) {
    .laus_tables %>%
        laus_fetch_observations(PATTERN_FOR_CURRENT_OBSERVATIONS) %>%
        invisible()
}


laus_legacy <- function(.laus_tables) {
    .laus_tables %>%
        laus_fetch_observations(
            PATTERN_FOR_LEGACY_OBSERVATIONS
        ) %>%
        dplyr::filter(
            .data$year < FIRST_YEAR_OF_CURRENT_OBSERVATIONS
        ) %>%
        invisible()
}


#' Download a huge table of LAUS observations
#'
#' @param .laus_tables a table from calling \code{\link{laus_fetch_table}}.
#'
#' @return A tibble that will have more than a million observations.
#'    Its columns are:
#'    \describe{
#'        \item{series}{a 20-character code, e.g. "LAUCT556600000000003"}
#'        \item{date}{always the first day of the observation's month}
#'        \item{value}{a double-precision numeric value}
#'        \item{footnote_codes}{a one-character code indicating caveats}
#'    }
#'    The \code{series} field contains tese
#' @export
#' @importFrom magrittr %>%
laus_all <- function(.laus_tables) {
    dplyr::bind_rows(laus_current(.laus_tables),
                     laus_legacy(.laus_tables)) %>%
        dplyr::filter(
            stringr::str_detect(.data$period,
                                PERIOD_TO_EXCLUDE)
        ) %>%
        dplyr::mutate(
            date = lubridate::make_date(
                year = .data$year,
                month = .as_integer_month(.data$period),
                day = 1
            ),
            .keep = "unused",
            .after = .data$series_id
        ) %>%
        invisible()
}
