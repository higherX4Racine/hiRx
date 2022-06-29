# Copyright (C) 2022 by Higher Expectations for Racine

#' Wrangle Census Table JSON
#'
#' @param jsonlist a list of lists from fetching Census data in JSON format
#' @param variable_names the census API codes for variables
#' @param .val_trans_f a function for converting variable values to numbers
#' @param .value_column the name of the numeric column in the new table
#'
#' @return a tibble with fields for geographies, variable name, and value
#' @export
census_json_to_tibble <- function(jsonlist,
                                  variable_names,
                                  .val_trans_f = readr::parse_integer,
                                  .value_column = "Population") {
    jsonlist %>%
        tail(-1) %>%
        purrr::transpose(.) %>%
        tibble::as_tibble(.name_repair = ~ as.character(jsonlist[[1]])) %>%
        dplyr::mutate(dplyr::across(.fns = as.character)) %>%
        tidyr::pivot_longer(
            cols = tidyselect::any_of(variable_names),
            names_to = "Variable",
            values_to = .value_column,
            values_transform = .val_trans_f,
            values_drop_na = TRUE
        )
}
