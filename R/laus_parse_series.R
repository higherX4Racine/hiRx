# Copyright (C) 2022 by Higher Expectations for Racine County

FIELD_SIZES <- c(
    LAUS = 2,
    SEASONALITY = 1,
    AREA_TYPE = 2,
    STATE_OR_REGION = 2,
    AREA_CODE = 11,
    MEASURE_CODE = 2
)

SERIES_BREAKS <- cumsum(FIELD_SIZES)
SERIES_NAMES <- c(
    NA,
    "seasonal",
    "area_prefix",
    "srd_code",
    "area_fips",
    "measure_code"
)

N_PARTS <- length(SERIES_NAMES)

#' Separate a LAUS series code into its components
#'
#' @param .x a data frame or character vector with series codes
#' @param .col optional. If \code{.x} is a data frame, this is the name of the
#'     column that holds the series codes. It defaults to "series".
#'
#' @return a data frame with the following fields
#'     \describe{
#'         \item{seasonal}{'S' for seasonally-transformed data, 'U' otherwise}
#'         \item{area_prefix}{a 2-character code describing a level of geographic organization}
#'         \item{srd_code}{an integer holding a 2-digit FIPS code for a state, census region, or census division}
#'         \item{area_fips}{an 11-character FIPS code for an intrastate area}
#'         \item{measure_code}{an integer code for what the series measures.}
#'     }
#' @export
#' @importFrom magrittr %>%
#'
#' @examples
#' tibble::tribble(
#'     ~ series,
#'     "LAUST290000000000009",
#'     "LAUCS233569500000005",
#'     "LAUMT542658000000003",
#'     "LAUCN170630000000005",
#'     "LAUCA392120000000004",
#'     "LAUCN210230000000003",
#'     "LAUCN190410000000006",
#'     "LAUCT134319200000005",
#'     "LAUMC554802000000004",
#'     "LAURD840000000000006"
#' )
laus_parse_series <- function(.x, .col = "series") {
    if (rlang::inherits_any(.x,
                            c("tbl_df", "tbl", "data.fram"))) {
        .result <- tidyr::separate(data = .x,
                                   col = {{ .col }},
                                   into = SERIES_NAMES,
                                   sep = SERIES_BREAKS)
    }
    else if (rlang::inherits_any(.x, "character")) {
        # note the inversion of the normal pipe argument!
        .result <- purrr::map2(
                SERIES_BREAKS[-N_PARTS] + 1,
                SERIES_BREAKS[-1],
                stringr::str_sub,
                string = .x
            ) %>%
            rlang::set_names(
                SERIES_NAMES[-1]
            ) %>%
            tibble::as_tibble()
    }
    else {
        stop(".x must be a data frame or a character vector")
    }
    .result %>%
        convert_code_columns() %>%
        invisible()
}
