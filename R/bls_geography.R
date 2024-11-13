# Copyright (C) 2022 by Higher Expectations for Racine County

#' Get the BLS string for a specific geographical area
#'
#' @param area_type one of several types of area, see notes.
#' @param state_or_region the FIPS code of a state or region
#' @param area the FIPS code of the sub-region, NULL if unnecessary.
#'
#' @return a 15-digit geocode
#' @export
bls_geography <- function(area_type,
                          state_or_region,
                          area = NULL) {
    if (!area_type %in% hiRx::BLS_AREA_TYPES$prefix) {
        rlang::abort(glue::glue(
            "Error: '{area_type}' is not a valid Area Type."
        ))
    }
    if (is.null(area)) {
        area <- 0L
    }
    area <- as.integer(area)

    .index <- stringr::str_which(hiRx::BLS_AREA_TYPES$prefix,
                                 area_type)

    .digits <- hiRx::BLS_AREA_TYPES$digits[.index]

    .suffix <- area |>
        stringr::str_pad(.digits, "left", 0) |>
        stringr::str_pad(11, "right", 0)

    sprintf("%s%02d%s", area_type, as.integer(state_or_region), .suffix)
}
