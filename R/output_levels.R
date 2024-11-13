#' Print out quoted, comma-trailed terms, one per line
#'
#' @param x the first argument
#' @param ... additional arguments to be quoted and printed
#'
#' @return nothing, it just prints things
#' @export
#'
output_levels <- function(x, ...){
    .tmp <- c(x, rlang::list2(...))
    '"{.tmp}"' |>
        glue::glue() |>
        paste0(
            collapse = ",\n"
        ) |>
        cat()
}
