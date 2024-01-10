# Copyright (C) 2023 by Higher Expectations for Racine County

#' Print each element of a vector on a new line, with commas
#'
#' @param .array <any>, a vector of values, probably string, but could be anything.
#' @param .sep <chr>, optional, Delimiter to print before each new line. The default is a comma.
#' @param .quote <chr>, optional, Character to wrap each item in. The default is a double quote.
#'
#' @return Nothing, this function is side-effect only.
#' @export
#'
#' @examples
#' library(hiRx)
#' print_array_as_column(c("foo", "bar", "baz"))
print_array_as_column <- function(.array, .sep = ",", .quote = '"'){
    if (length(.quote) == 1) {
        .array <- paste0(.quote, .array, .quote)
    }
    .array |>
        paste(
            collapse = paste0(.sep, "\n")
        ) |>
        cat()
}
