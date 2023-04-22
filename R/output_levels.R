#' Print out quoted, comma-trailed terms, one per line
#'
#' @param ... arguments to be quoted and printed
#'
#' @return
#' @export
#'
#' @importFrom magrittr %>%
output_levels <- function(x, ...){
    .tmp <- c(x, rlang::list2(...))
        glue::glue(
            '"{.tmp}"'
        ) %>%
        paste0(
            collapse = ",\n"
        ) %>%
        cat()
}
