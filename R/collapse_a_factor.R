#' Summarize all of the values of a category
#'
#' @param .x a tibble
#' @param group_to_collapse the name of the field whose categories will be collapsed
#' @param values_to_summarize the name(s) of the fields with values to summarize
#' @param collapsed_label the name of the new, collapsed category
#' @param .summary_f the summary function, defaults to `sum`
#' @param ... further arguments for `.summary_f`, e.g. `na.rm = TRUE`.
#'
#' @return a new summary tibble
#' @export
collapse_a_factor <- function(.x,
                              group_to_collapse,
                              values_to_summarize,
                              collapsed_label,
                              .summary_f = sum,
                              ...) {
    if (!is.factor(.x[[group_to_collapse]])) {
        cli::cli_abort(c("!" = "`group_to_collapse` must be a factor"))
    }
    .x |>
        dplyr::group_by(
            dplyr::across(!tidyselect::any_of(c(
                group_to_collapse,
                values_to_summarize
            ))
            )
        ) |>
        dplyr::summarize(
            dplyr::across(tidyselect::all_of(values_to_summarize),
                          sum,
                          ...),
            .groups = "keep"
        ) |>
        dplyr::ungroup() |>
        dplyr::mutate(
            "{group_to_collapse}" := factor(
                collapsed_label,
                levels = levels(.x[[group_to_collapse]])
            )
        ) |>
        dplyr::relocate(
            tidyselect::all_of(names(.x))
        )
}
