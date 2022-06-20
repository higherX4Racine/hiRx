# Copyright (C) 2022 by Higher Expectations for Racine

#' Wrangle Census Table JSON
#'
#' @param .l a list of lists from fetching Census data in JSON format
#'
#' @return a tibble in which rows are geometries and columns are variables.
#' @export
census_json_to_tibble <- function(.l) {
    .l %>%
        tail(-1) %>%
        purrr::transpose(.) %>%
        tibble::as_tibble(.name_repair = ~ as.character(.l[[1]])) %>%
        dplyr::mutate(dplyr::across(.fns = as.character))
}
