#' Extract location address and apartment information from a string with both
#'
#' @param .addresses <str> - parts of addresses, like "New York, NY 10026"
#'
#' @return a tibble with three columns "City", "State", and "ZIP Code"
#' @export
parse_location_address <- function(.addresses) {
    .tmp <- stringr::str_match(
        .addresses,
        pattern = "(?<City>[^,]+)(?:,\\s+)(?<State>\\S+)(?:\\s+)(?<zipCode>.*)"
    )[,-1]
    colnames(.tmp) <- c("City", "State", "ZIP Code")
    .tmp |>
        tibble::as_tibble() |>
        dplyr::mutate(
            dplyr::across(tidyselect::everything(),
                          stringr::str_squish)
        )
}
