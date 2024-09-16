#' Extract street address and apartment information from a string with both
#'
#' @param .addresses <str> - parts of addresses, like "123 Sesame St. #A"
#'
#' @return a tibble with two columns "Street Address" and "Apartment"
#' @export
parse_street_address <- function(.addresses) {
    .tmp <- stringr::str_match(
        .addresses,
        pattern =
            "(?<streetAddress>[^#]+[^#0-9]+)(?: ?#?)(?<Apartment>[^#]*)"
    )[,-1]
    colnames(.tmp) <- c("Street Address", "Apartment")
    .tmp |>
        tibble::as_tibble() |>
        dplyr::mutate(
            dplyr::across(tidyselect::everything(),
                          stringr::str_squish)
        )
}
