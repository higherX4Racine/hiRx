## Copyright (C) 2026 by Higher Expectations for Racine County

#' Search a folder for R scripts and list every namespace used in those files
#'
#' @param .path `<chr>` the directory to search in
#'
#' @returns `<chr>` a sorted vector of each namespace
#' @export
detect_namespaces <- function(.directory) {
    .directory |>
        dir(
            pattern = "\\.R$",
            full.names = TRUE
        ) |>
        purrr::map(
            \(.file) withr::with_connection(
                list(fh = file(.file, "r")),
                fh |>
                    readLines() |>
                    stringr::str_extract_all("\\w+::") |>
                    purrr::flatten_chr() |>
                    stringr::str_remove_all("::") |>
                    unique() |>
                    sort())
        ) |>
        purrr::flatten_chr() |>
        unique() |>
        sort()
}
