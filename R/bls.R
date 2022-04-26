# Copyright (C) 2022 by Higher Expectations for Racine County




#' Break up a BLS series id into its spatial and contextual components
#'
#' @param .x a data frame with at least one column of BLS series codes.
#' @param .series a character vector of 20-digit BLS series codes
#'
#' @return a tibble with 5 columns
#' @export
#'
#' @examples
#' library(magrittr)
#' racine_laus %>%
#'     dplyr::bind_rows() %>%
#'     dplyr::select(Series) %>%
#'     dplyr::distinct() %>%
#'     unlump_series(Series)
unlump_series <- function(.x, .series) {
    tidyr::separate(.x,
                    col = {{ .series }},
                    sep = c(3, 5, 7, 18),
                    into = c("Series Type", #  1 -  3
                             "Area Type",   #  4 -  5
                             "State",       #  6 -  7
                             "Area",        #  8 - 18
                             "Measure Code" # 19 - 20
                    )
    )
}

.LAUS_AREA_URL <- "https://download.bls.gov/pub/time.series/la/la.area"
.LAUS_AREA_TYPES_URL <- "https://download.bls.gov/pub/time.series/la/la.area_type"

.LAUS_AREAS <- NULL

#' Find the FIPS
#'
#' @return
#' @export
#' @importFrom magrittr %>%
#' @importFrom rlang .data
#'
#' @examples
bls_areas <- function() {

    if (is.null(.LAUS_AREAS)) {
        .LAUS_AREAS <- readr::read_delim(
            .LAUS_AREA_URL,
            delim = "\t",
            show_col_types = FALSE
        )
    }

    .LAUS_AREAS %>%
        get_prefix(.data$area_code, 2) %>%
        invisible()
}

.GEO_AREAS <- NULL

#' Title
#'
#' @param .areas
#'
#' @return
#' @export
#' @importFrom magrittr %>%
#' @importFrom rlang .data
#'
#' @examples
bls_geo_info <- function(.areas) {

    if (is.null(.GEO_AREAS)) {
        .GEO_AREAS <- readr::read_delim(.LAUS_AREA_TYPES_URL,
                                        delim = "\t",
                                        show_col_types = FALSE)
    }

    .areas %>%
        dplyr::count(
            .data$area_type_code,
            .data$prefix
        ) %>%
        dplyr::left_join(
            count_used_digits(.areas),
            by = "prefix"
        ) %>%
        dplyr::left_join(
            .GEO_AREAS,
            by = "area_type_code"
        ) %>%
        dplyr::select(
            Prefix = .data$prefix,
            .data$Digits,
            `Area Type` = .data$areatype_text,
        ) %>%
        dplyr::distinct() %>%
        invisible()
}
