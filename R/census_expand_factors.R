# Copyright (C) 2022 by Higher Expectations for Racine County

#' Create a table of census variables from factors and row offsets
#'
#' @param .x the table of factors and row offsets
#' @param .level_field the variable that names factor levels
#' @param .offset_field the variable that gives row offsets
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]> other factors without offsets
#'
#' @return a table of census variables with their associated factors and rows
#' @export
census_expand_factors <- function(.x,
                                  .level_field = "Level",
                                  .offset_field = "Offset",
                                  ...) {
    .x %>%
        tidyr::nest(
            data = tidyselect::any_of(c(.level_field,
                                        .offset_field))
        ) %>%
        purrr::pmap(
            ~ tibble::tibble("{..1}" := ..2[[.level_field]],
                             "{..1}{.offset_field}" := ..2[[.offset_field]])
        ) %>%
        tidyr::expand_grid(
            !!!.,
            ...
        ) %>%
        dplyr::mutate(
            Index = rowSums(
                dplyr::across(tidyselect::ends_with(.offset_field))
            ),
            .keep = "unused"
        ) %>%
        dplyr::arrange(
            .data$Index
        )
}
