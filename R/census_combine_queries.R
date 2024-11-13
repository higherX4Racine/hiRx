#' Title
#'
#' @param .l a list of JSON-formatted API query responses
#' @param metadata a tibble with details about each field in the query
#' @param .field_name the column that identifies fields. Defaults to "Variable".
#' @param .value_name the column that reports measures. Defaults to "Population".
#' @param .index_name the column that indicates a fields' place in a table. Defaults to "Index".
#'
#' @return a tibble of Census data with Higher Expectations factor names.
#' @export
census_combine_queries <- function(.l,
                                   metadata,
                                   .field_name = "Variable",
                                   .value_name = "Population",
                                   .index_name = "Index") {
    .l |>
        purrr::map(
            hiRx::census_json_to_tibble,
            variable_names = metadata[[.field_name]]
        ) |>
        dplyr::bind_rows() |>
        dplyr::inner_join(
            metadata,
            by = .field_name
        ) |>
        dplyr::select(
            !c({{.field_name}},
               {{.index_name}})
        )
}
