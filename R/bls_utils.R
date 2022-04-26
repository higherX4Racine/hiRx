#' Strip out the first several characters from a column
#'
#' @param .x the input data frame
#' @param .col the character column to extract the prefix from
#' @param .len the length of the prefix
#'
#' @return a new data frame with a column, ``prefix`` inserted before ``.col``
#' @importFrom magrittr %>%
#'
#' @examples
#' get_prefix(
#'     tibble::tribble(~Text, "hello", "world"),
#'     Text,
#'     3
#' )
get_prefix <- function(.x, .col, .len) {
    .x %>%
        dplyr::mutate(
            prefix = stringr::str_sub({{ .col }},
                                      1,
                                      .len),
            .before = {{ .col }}
        ) %>%
        invisible()
}

#' Count the number of digits that FIPS uses to track a type of area
#'
#' @param .areas The table of area information
#'
#' @return a table of digit counts for each type of area
#' @importFrom magrittr %>%
#' @importFrom rlang .data
#'
count_used_digits <- function(.areas) {

    .areas <- .areas %>%
        dplyr::transmute(
            prefix = .data$prefix,
            suffix = stringr::str_sub(.data$area_code,
                                      5)
        ) %>%
        dplyr::distinct()

    for (i in 1:11) {
        .areas[[paste0("Char", i)]] <- stringr::str_sub(.areas$suffix, i, i)
    }

    .areas %>%
        dplyr::mutate(
            dplyr::across(.data$Char1:.data$Char11,
                          ~ . != "0")
        ) %>%
        dplyr::group_by(
            .data$prefix
        ) %>%
        dplyr::summarize(
            dplyr::across(.data$Char1:.data$Char11,
                          sum)
        ) %>%
        tidyr::pivot_longer(
            .data$Char1:.data$Char11,
            names_to = "Char",
            values_to = "Count"
        ) %>%
        dplyr::group_by(
            .data$prefix
        ) %>%
        dplyr::summarize(
            Digits = sum(.data$Count > 0)
        ) %>%
        invisible()
}
