# Copyright (C) 2022 by Higher Expectations for Racine County

#' Convert lists of JSON-formatted census data to tidy tables.
#'
#' @param .x a list of lists of json output from a query to the Census API
#' @param variable_tibble a tibble that connects census variables to factor information and row indices
#' @param .varname the name of the field that holds Census variable codes
#' @param .indexname the name of the field that holds row indices
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]> other inputs to \code{\link[hiRx]{census_tibble_to_json}}
#'
#' @return a tibble with factor variables and observed values
#'
#' @seealso
#' \code{\link[hiRx]{census_expand_factors}}
#' \code{\link[hiRx]{census_tibble_to_json}}
#' @export
census_wrangle_lists_of_raw_json <- function(.x,
                                             variable_tibble,
                                             .varname = "Variable",
                                             .indexname = "Index",
                                             ...) {
    .x %>%
        purrr::map(
            hiRx::census_json_to_tibble,
            variable_names = variable_tibble[[.varname]],
            ...
        ) %>%
        dplyr::bind_rows() %>%
        dplyr::inner_join(
            variable_tibble,
            by = .varname
        ) %>%
        dplyr::select(!tidyselect::all_of(c(.varname,
                                            .indexname))
        )
}
