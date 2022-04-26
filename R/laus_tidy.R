# Copyright (C) 2022 by Higher Expectations for Racine County

.measure_labels <- tibble::tribble(
    ~ `Measure Code`, ~ Measure,
    "03", "Unemployment Rate",
    "04", "Unemployed",
    "05", "Employed",
    "06", "Labor Force",
    "07", "Employment:Population Ratio",
    "08", "Labor Force Participation Rate",
    "09", "Civilian Non-Institutional Population"
)

#' Wrangle data downloaded by ``laus_fetch`` into a tidy tibble
#'
#' @param .laus_table The data from ``laus_fetch``
#' @param geo_labels A tibble of human-readable "Geography" values for FIPS codes.
#' @param measure_labels A tibble of human-readable names for BLS series IDs.
#' @param .rate_key A string to search for to identify percentages.
#'
#' @return a tibble with columns: ``Geography``, ``Measure``, ``Date``, and ``Value``.
#' @export
#' @importFrom magrittr %>%
#' @importFrom rlang .data
#'
#' @examples
#' laus_table <- tibble::tribble(
#'     ~ Series,                ~ Year, ~ Month,   ~ Value,
#'     "LAUCT556600000000005",    2020,       1,   32436.0,
#'     "LAUCT556600000000006",    1998,       6,   39679.0,
#'     "LAUCT556600000000004",    1995,       6,    2760.0,
#'     "LAUCT556600000000003",    2002,       9,       8.6,
#'     "LAUCN551010000000005",    1997,      10,   90356.0,
#'     "LAUCN551010000000006",    2005,       2,   98696.0,
#'     "LAUCN551010000000004",    2015,      12,    4609.0,
#'     "LAUCN551010000000003",    2009,      11,      10.0,
#'     "LAUST550000000000005",    2018,      10, 3040579.0,
#'     "LAUST550000000000004",    1997,      10,   79483.0,
#'     "LAUST550000000000003",    2005,       7,       4.7
#' )
#' geo_labels <- tibble::tribble(
#'     ~ State,        ~ Area,     ~ Geography,
#'        "55", "00000000000",     "Wisconsin",
#'        "55", "66000000000",   "Racine City",
#'        "55", "10100000000", "Racine County"
#' )
#' print(laus_tidy(laus_table, geo_labels))
laus_tidy <- function(.laus_table,
                      geo_labels,
                      measure_labels = .measure_labels,
                      .rate_key = "Rate|Percent") {
    .laus_table %>%
        dplyr::transmute(
            Series = .data$Series,
            Date = lubridate::make_date(
                year = .data$Year,
                month = as.numeric(.data$Month)
            ),
            Value = .data$Value
        ) %>%
        unlump_series(.data$Series) %>%
        dplyr::left_join(geo_labels) %>%
        dplyr::left_join(measure_labels) %>%
        dplyr::mutate(
            Value = purrr::modify_if(.data$Value,
                                     stringr::str_detect(.data$Measure,
                                                         .rate_key),
                                     ~ . / 100.0)
        ) %>%
        dplyr::select(
            .data$Geography,
            .data$Measure,
            .data$Date,
            .data$Value
        ) %>%
        invisible()
}
