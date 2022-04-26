#' The number of jobs that would make the two areas' unemployment rates equal.
#'
#' @param .x the tibble with LAUS data
#' @param .focal_geo the area whose number of jobs would be changed.
#' @param .comp_geo the area whose employment rate is the baseline.
#'
#' @return a tibble with a new category of Measure, "Additional Jobs"
#' @export
#' @importFrom magrittr %>%
#'
#' @examples
laus_extra_jobs <- function(.x,
                            .focal_geo,
                            .comp_geo,
                            .result_name = "Additional Jobs") {

    .measures <- unique(.x$Measure)

    .comp <- calculate_geo_diff(.x,
                                .focal_geo,
                                .comp_geo,
                                "Unemployment Rate")

    .x %>%
        dplyr::filter(
            .data$Geography == .focal_geo
        ) %>%
        dplyr::full_join(
            .comp
        ) %>%
        tidyr::pivot_wider(
            names_from = "Measure",
            values_from = "Value"
        ) %>%
        dplyr::mutate(
            "{.result_name}" :=
                .data$`Labor Force` * .data$`Unemployment Rate Difference`
        ) %>%
        tidyr::pivot_longer(
            cols = tidyselect::all_of(c(.measures,
                                        .result_name)),
            names_to = "Measure",
            values_to = "Value"
        ) %>%
        invisible()
}


#' Calculate differences across times between two areas for one measure
#'
#' @param .x a tibble of LAUS data
#' @param .focal_geo the area whose value is on the left side of the subtraction
#' @param .comp_geo the area whose value is on the right side
#' @param .measure the measure to compare between areas
#'
#' @return a tibble with a new Measure, ``"{.measure} Difference"``
#' @export
#' @importFrom magrittr %>%
#'
#' @examples
calculate_geo_diff <- function(.x, .focal_geo, .comp_geo, .measure) {

    .time_fields <- c("Year", "Month")
    .time_fields <- .time_fields[.time_fields %in% colnames(.x)]

    .p <- .x %>%
        dplyr::filter(.data$Measure == .measure) %>%
        dplyr::select(!.data$Measure)

    dplyr::left_join(
        dplyr::filter(.p,
                      .data$Geography == .focal_geo),
        .p %>%
            dplyr::filter(
                .data$Geography == .comp_geo
            ) %>%
            dplyr::select(!.data$Geography),
        by = .time_fields,
        suffix = c("_focal", "_comp")
    ) %>%
        dplyr::mutate(
            Value = .data$Value_focal - .data$Value_comp,
            Measure = paste(.measure, "Difference")
        ) %>%
        dplyr::select(tidyselect::all_of(
            c(.time_fields, "Geography", "Measure", "Value")
        )) %>%
        invisible()
}
