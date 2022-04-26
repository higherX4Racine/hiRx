# Copyright (C) 2022 by Higher Expectations for Racine County

#' Get the BLS string for a specific geographical area
#'
#' @param area_type one of several types of area, see notes.
#' @param state_or_region the FIPS code of a state or region
#' @param area the FIPS code of the sub-region, NULL if unnecessary.
#'
#' @return a 15-digit geocode
#' @export
#'
#' @examples
bls_geography <- function(area_type,
                          state_or_region,
                          area = NULL) {
    .bls <- reticulate::import("herc.bls")
    .area_types <- .bls$AREA_TYPES
    if (!area_type %in% names(.area_types)) {
        rlang::abort(glue::glue(
            "Error: '{area_type}' is not a valid Area Type."
        ))
    }
    if (!is.null(area)) {
        area <- as.integer(area)
    }
    .bls$AREA_TYPES[[area_type]]$id_for(as.integer(state_or_region),
                                        area)
}
