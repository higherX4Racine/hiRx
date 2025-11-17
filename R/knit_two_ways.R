#' Print a nicely-formatted table of percentages
#'
#' @param .df a table with counts
#' @param .by the column that will label each row
#' @param .across the column that will be pivoted to columns
#' @param .weights the column with in-group counts
#'
#' @returns nothing
#' @export
#' @seealso [two_way_percentages()]
#' @seealso [knit_percentage_table()]
knit_two_ways <- function(.df, .by, .across, .weights) {
    .df |>
        two_way_percentages(.by, .across, .weights) |>
        knit_percentage_table(.by)
}
