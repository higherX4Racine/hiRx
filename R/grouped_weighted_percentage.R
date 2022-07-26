# Copyright (C) 2022 by Higher Expectations for Racine County

#' Percentages within groups where different inputs have different weights
#'
#' This definitely requires explanation, but an example should make it clear.
#' The motivation of this function is to compute the percentage of people
#' within a municipality that have a certain demographic characteristic. The
#' catch is that the data are not reported by municipality, but by census tract,
#' and census tract boundaries don't match the boundaries of the municipalities.
#' So, to compute the percentage of people who have health insurance in Racine,
#' WI, we need to count the number of people in each census tract that overlaps
#' with Racine, weight the tracts by how much of their populations are actually
#' within the city's borders, and then find the weighted percent with insurance
#' by dividing the weighted sum of people with insurance by the weighted sum of
#' all people.
#'
#' @param .x a tibble of data
#' @param groups a vector of strings that name grouping variables
#' @param in_value_field the field with counts of in-group members
#' @param all_value_field the field with counts of all items
#' @param in_weight_field the field with weights for in-group members
#' @param all_weight_field the field with weights for all items
#'
#' @return  a tibble with weighted percents per group
#' @export
#' @examples
#' toy_data <- tibble::tribble(
#'     ~ City, ~ Tract, ~ Insured, ~ All, ~ `City Pop`, ~ `Tract Pop`,
#'     "Foo",  "A",     10L,       10L,      0L,          99L,
#'     "Bar",  "A",     10L,       10L,     22L,          99L,
#'     "Foo",  "B",     25L,       42L,   1200L,        1900L,
#'     "Bar",  "B",     25L,       42L,    700L,        1900L
#' )
#' grouped_weighted_percentage(toy_data,
#'                             groups = "City",
#'                             in_value_field = "Insured",
#'                             all_value_field = "All",
#'                             in_weight_field = "City Pop",
#'                             all_weight_field = "Tract Pop")
grouped_weighted_percentage <- function(.x,
                                        groups,
                                        in_value_field,
                                        all_value_field,
                                        in_weight_field,
                                        all_weight_field){
    .x %>%
        dplyr::group_by(
            dplyr::across(
                .cols = tidyselect::all_of(groups)
            )
        ) %>%
        dplyr::summarize(
            dplyr::across(
                .cols = tidyselect::all_of(
                    c(in_value_field,
                      all_value_field)
                ),
                ~ sum(. * .data[[in_weight_field]] /
                          .data[[all_weight_field]])
            ),
            .groups = "keep"
        ) %>%
        dplyr::ungroup() %>%
        dplyr::mutate(
            "Percent {in_value_field}" :=
                .data[[in_value_field]] /
                .data[[all_value_field]]
        )
}
