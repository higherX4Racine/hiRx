#' Consolidate racial categories from the Census's to Higher Expectations'
#'
#' @param .x a tibble with information grouped by Census race categories.
#' @param .census_label_field the name of the field with Census race in it. Defaults to "Census Race"
#' @param .value_field the name of the field with numeric data. Defaults to "Population"
#' @param .summary_f the function to consolidate values with. Defaults to `sum`.
#'
#' @return a tibble with Higher Expectations' race groups instead of the Census's.
#' @export
census_collapse_races <- function(.x,
                                .census_label_field = "Census Race",
                                .value_field = "Population",
                                .summary_f = sum){
    .x |>
        dplyr::group_by(
            dplyr::across(
                !tidyselect::any_of(c(
                    .census_label_field,
                    .value_field)
                )
            )
        ) |>
        dplyr::summarize(
            "{.value_field}" := .summary_f(.data[[.value_field]])
        ) |>
        dplyr::ungroup()
}
