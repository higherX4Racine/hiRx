# Copyright (C) 2026 by Higher Expectations for Racine County

#' Find edit distances between pairwise combinations of two sets of text
#'
#' The specific kind of edit distance depends upon the extra arguments, which
#' get passed on to [utils::adist()].
#' This is really syntactic sugar for converting the matrix that [utils::adist()]
#' creates into a long tibble.
#'
#' @param .lhs `<chr>` the first set of text values to fuzzy match
#' @param .rhs `<chr>` the second set
#' @inheritDotParams utils::adist -x -y
#'
#' @returns an object of class `tbl_df/tbl/data.frame`
#' with `length(.lhs)` \eqn{\times} `length(.rhs)` rows and 3 columns:
#' \describe{
#'  \item{LHS}{`<chr>` each value of `.lhs`, repeated `len(.rhs)` times}
#'  \item{RHS}{`<chr>` each value of `.rhs`, repeated `len(.lhs)` times}
#'  \item{Distance}{`<dbl>` the edit distance between the strings.}
#' }
#' @export
#'
#' @examples
#' fuzzy_matches(c("Foo", "Bar", "Baz"),
#'               c("Aleph", "Bab", "Jeen", "Dal"))
#' fuzzy_matches(c("Foo", "Bar", "Baz"),
#'               c("Aleph", "Bab", "Jeen", "Dal"),
#'               fixed = FALSE, ignore.case = TRUE)
fuzzy_matches <- function(.lhs, .rhs, ...) {
    .lhs |>
        utils::adist(
            .rhs, ...
        ) |>
        tibble::as_tibble(
            .name_repair = \(.) .rhs
        ) |>
        dplyr::mutate(
            LHS = .lhs
        ) |>
        tidyr::pivot_longer(
            cols = tidyselect::all_of(.rhs),
            names_to = "RHS",
            values_to = "Distance"
        )
}
