# Copyright (C) 2022 by Higher Expectations for Racine County

reticulate::use_virtualenv("user_venv")

.API_KEY = Sys.getenv("BLS_API_KEY") # change this as necessary.

.pd <- reticulate::import("pandas")

.bls <- reticulate::import("herc.bls")

.laus <- reticulate::import("herc.bls.laus")

.laus_measures <- list(
    Employed = .laus$Measure$EMPLOYMENT,
    `Labor Force` = .laus$Measure$LABOR_FORCE,
    Unemployed = .laus$Measure$UNEMPLOYMENT,
    `Unemployment Rate` = .laus$Measure$UNEMPLOYMENT_RATE
)

.build_series_ids <- function(.geographies,
                              .measures) {
    purrr::pmap_chr(
        tidyr::expand_grid(Geography = .geographies,
                           Measure = .measures),
        ~ .laus$series_id(..1,
                          ..2)
    )
}

.response_status <- function(.response) {
    .response$json()$status
}

.validate_response <- function(.response, .ok_string = "REQUEST_SUCCEEDED") {
    .response_status(.response) == .ok_string
}

#' Grab data from the BLS API
#'
#' @param geographies one or more 15-character geocodes
#' @param measures one or more members of the measure types enum
#' @param start_year the first year of the time series
#' @param final_year the last year of the time series, defaults to the current year
#' @param api_key a unique id with access to the BLS API
#'
#' @return a data frame
#' @export
#' @importFrom magrittr %>%
#' @importFrom rlang .data
#'
#' @examples
laus_fetch <- function(geographies,
                       measures = .laus_measures,
                       start_year = 1990L,
                       final_year = NULL,
                       api_key = NULL) {

    start_year <- as.integer(start_year)

    if (!is.null(final_year)) {
        final_year <- as.integer(final_year)
    }

    .series_ids <- .build_series_ids(geographies,
                                     measures)

    rlang::inform(
        glue::glue("Fetching BLS data from {start_year} - {final_year} for"),
        .series_ids
    )

    tidyr::expand_grid(
        Geography = geographies,
        Measure = measures
    ) %>%
        dplyr::mutate(
            Series = purrr::map2_chr(.data$Geography,
                                     .data$Measure,
                                     .laus$series_id),
            Responses = purrr::map(.data$Series,
                                   ~ .laus$get(list(.),
                                               start_year,
                                               final_year,
                                               api_key)),
            Wrangled = purrr::map(.data$Responses,
                                  .laus$wrangle)
        ) %>%
        dplyr::select(
            !c(.data$Series,
               .data$Responses)
        ) %>%
        tidyr::unnest(
            cols = .data$Wrangled
        ) %>%
        invisible()
}

# annual <- laus %>%
#     dplyr::group_by(
#         .data$Year,
#         .data$Geography,
#         .data$Measure
#     ) %>%
#     dplyr::summarize(
#         Value = mean(Value)
#     ) %>%
#     dplyr::ungroup()
#
# compared <- annual %>%
#     dplyr::filter(
#         .data$Geography == .focal_geo
#     ) %>%
#     dplyr::full_join(
#         calculate_geo_diff(annual,
#                            .focal_geo,
#                            .comp_geo,
#                            "Unemployment Rate")
#     ) %>%
#     compute_job_difference()
