#' Remove all singleton columns
#'
#' @param .x a tibble or data table with more than one row
#'
#' @return a tibble that may have fewer columns
#' @export
only_informative_columns <- function(.x) {
    dplyr::select(.x, where(~dplyr::n_distinct(.) > 1))
}
