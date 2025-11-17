#' Compute the percentage of some total found in two margins
#'
#' @param .df a data frame with counts and categories
#' @param .by the category that will stay as a factor column
#' @param .across the category that will become columns
#' @param .weights the column that counts individuals
#'
#' @returns a table with rows determined by .by and columns by .across
#' @export
two_way_percentages <- function(.df, .by, .across, .weights) {

    .df <- dplyr::filter(.df,
                         !is.na(.df[[.by]]),
                         !is.na(.df[[.across]]))

    .lvls = sort(unique(.df[[.across]]))

    .df |>
        dplyr::count(
            dplyr::across(tidyselect::all_of(c(.by, .across))),
            wt = .data[[.weights]]
        ) |>
        dplyr::bind_rows(
            dplyr::count(
                .df,
                "{.across}" := "All",
                .data[[.by]],
                wt = .data[[.weights]]
            )
        ) |>
        tidyr::pivot_wider(
            names_from = .across,
            values_from = "n",
            values_fill = 0
        ) |>
        dplyr::mutate(
            dplyr::across(tidyselect::all_of(.lvls),
                          \(.x) .x / .data$All)
        )
}
