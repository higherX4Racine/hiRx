# Copyright (C) 2022 by Higher Expectations for Racine County

#' Condense and relabel racial and ethnic factors
#'
#' @param .x a tibble with Census data that is organized by race
#' @param race_tibble a tibble that defines condensed racial/ethnic factors
#' @param .code_field defaults to "Code"
#' @param .name_field defaults to "Name"
#' @param .val_field defaults to "Population"
#'
#' @return a tibble with better factor values
#'
#' @seealso \code{\link[hiRx]{census_race_labels}}
#'
#' @export
census_wrangle_race <- function(.x,
                                race_tibble,
                                .code_field = "Code",
                                .name_field = "Name",
                                .val_field = "Population") {
    .x %>% dplyr::inner_join(
        race_tibble,
        by = .code_field
    ) %>%
        dplyr::group_by(
            dplyr::across(!tidyselect::all_of(c(
                .code_field,
                .name_field,
                .val_field
            )))
        ) %>%
        dplyr::summarize(
            "{.val_field}" := sum(.data[[.val_field]]),
            .groups = "keep"
        ) %>%
        dplyr::ungroup()
}


#' Aggregate variables over all races/ethnicities
#'
#' @param .x a tibble with variables by race but no all-race totals
#' @param ... <[`dynamic dots`][rlang::dyn-dots]> The variables to aggregate.
#' @param .f the function to aggregate with, defaults to \code{sum}.
#' @param .all_races_label the level for all races. defaults to "All"
#'
#' @return a tibble with values aggregated over all races
#'
#' @export
aggregate_over_races <- function(.x,
                                 ...,
                                 .f = sum,
                                 .all_races_label = "All") {
    .x %>%
        dplyr::group_by(
        dplyr::across(!c(
            .data$`Race/Ethnicity`,
            ...
        ))
    ) %>%
        dplyr::summarize(
            dplyr::across(c(...),
                          .f),
            .groups = "keep"
        ) %>%
        dplyr::ungroup() %>%
        dplyr::mutate(
            `Race/Ethnicity` = .all_races_label
        )
}
