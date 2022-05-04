#' Look up the root item that corresponds to each item's synonym
#'
#' @param .x a data frame with primary keys and self-referential synonyms
#' @param key_col the column that contains the primary keys
#' @param syn_col the column that contains self-referential keys
#'
#' @return a vector of primary keys
#' @export
#'
#' @examples
#' discrete_example <- tibble::tribble(
#' ~ PrimaryKey, ~ Dimension, ~ Order, ~ Label, ~ Synonym,
#' 1L, 1L, 1L, "A", NA,
#' 2L, 1L, 2L, "B", NA,
#' 3L, 1L, 3L, "C", NA,
#' 4L, 1L, NA, "Alpha", 1L,
#' 5L, 1L, NA, "Beta", 2L,
#' 6L, 1L, NA, "Gamma", 3L,
#' 7L, 1L, NA, "\u03B1", 4L
#' )
#' synonyms <- find_synonyms(discrete_example)
#' dplyr::slice(discrete_example, synonyms)
find_synonyms <- function(.x, key_col = "PrimaryKey", syn_col = "Synonym") {

    .keys <- dplyr::pull(.x, {{ key_col }})
    .syns <- dplyr::pull(.x, {{ syn_col }})
    f <- !is.na(.syns)

    while (any(f)) {
        .keys[f] <- .syns[f]
        .syns <- dplyr::pull(.x[.keys,], {{syn_col}})
        f <- !is.na(.syns)
    }

    .keys
}
