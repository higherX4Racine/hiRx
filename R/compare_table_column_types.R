## Copyright (C) 2026 by Higher Expectations for Racine County

#' Align the columns of data frames to see where their names and types synch up
#'
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]> named data frames to compare
#'
#' @returns a data frame with column names in "Column" and a column of types for each argument
#' @export
compare_table_column_types <- function(...) {
    list(...) |>
        purrr::imap(
            \(.x, .n) {
                .x |>
                    names() |>
                    rlang::set_names() |>
                    purrr::map_chr(
                        \(.) class(.x[[.]])
                    ) |>
                    tibble::enframe(
                        name = "Column",
                        value = paste(.n, "Type")
                    )
            }
        ) |>
        purrr::reduce(
            \(.lhs, .rhs) {
                dplyr::full_join(.lhs, .rhs, by = "Column")
            }
        )

}
