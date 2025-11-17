#' Print out a table of percentages with nice formatting
#'
#' @param .xtable a data frame produced by [two_way_percentages()]
#' @param .groups the column(s) with grouping variables
#' @param .all_field the name of the field that holds denominator values
#'
#' @returns nothing
#' @export
#' @seealso [two_way_percentages()]
knit_percentage_table <- function(.xtable, .groups, .all_field = "All") {
    n = ncol(.xtable)
    nl = length(.groups)
    .align_string = paste(
        c(rep("l", nl), rep("r", n - nl)),
        collapse = ""
    )
    .xtable |>
        dplyr::mutate(
            dplyr::across(
                !tidyselect::any_of(c(.groups, .all_field)),
                scales::label_percent(accuracy = 1)
            ),
            "{.all_field}" := scales::label_comma(accuracy = 1)(
                .data[[.all_field]]
            )
        ) |>
        knitr::kable(
            align = .align_string
        )
}
