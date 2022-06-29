# Copyright (C) 2022 by Higher Expectations for Racine County

#' collect shapefiles from TIGER/Line that are from different years.
#'
#' @param file_names A named vector or list of shapefiles
#' @param shapefile_path The full path to the folder that contains the files
#' @param ... Arguments that `dplyr::filter` will use on the files' features.
#'
#' @return an `sf::sf` object, a data frame of features with a geometry column
#' @export
census_tigershapes_combine <- function(file_names,
                                       shapefile_path,
                                       ...) {
    .filter_commands <- rlang::enquos(...)
    file_names %>%
        purrr::imap(
            ~ file.path(shapefile_path,
                        .y,
                        .x) %>%
                sf::st_read(quiet = TRUE) %>%
                dplyr::rename_with(
                    stringr::str_remove,
                    pattern = paste0(stringr::str_extract(.y,
                                                          "\\d{2}$"),
                                     "$")
                ) %>%
                dplyr::filter(
                    !!! .filter_commands
                )
        ) %>%
        dplyr::bind_rows(
            .id = "Year"
        ) %>%
        dplyr::mutate(
            Year = as.integer(.data$Year),
            dplyr::across(
                tidyselect::starts_with("INTPT"),
                as.numeric
            )
        )
}
