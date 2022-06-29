# Copyright (C) 2022 by Higher Expectations for Racine County

#' Fetch JSON-formatted data from the US Census API
#'
#' @param url a fully-formed API call in URL form
#' @param .api_key an API key
#'
#' @return a list of lists, one row per geo, one entry per variable
#' @export
census_do_api_query <- function(url, .api_key = NULL) {
    if (is.null(.api_key)) {
        .api_key <- Sys.getenv("CENSUS_API_KEY")
    }
    jsonlite::read_json(paste0(url, "&key=", .api_key))
}
