## Copyright (C) 2025 by Higher Expectations for Racine County

#' Convert  strings to CamelCase strings
#'
#' @param .strings *&lt;chr&gt;* strings with word breaks instead of spaces.
#'
#' @returns *&lt;chr&gt;* the same strings without spaces and capitalized letters at the starts of words.
#' @export
to_camel_case <- function(.strings) {
    .strings |>
        stringr::str_to_lower() |>
        stringr::str_replace_all("[_\\W]+", " ") |>
        stringr::str_to_title() |>
        stringr::str_remove_all(" ")
}
