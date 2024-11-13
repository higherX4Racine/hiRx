# Copyright (C) 2022 by Higher Expectations for Racine County

#' Create a table of census variables from factors and row offsets
#'
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]> data frames with factors and offsets
#' @param .offset_field the variable that gives row offsets, defaults to "offset"
#'
#' @return a table of census variables with their associated factors and rows
#' @export
census_expand_factors <- function(..., .offset_field = "offset"){
    tidyr::expand_grid(...,
                       .name_repair = ~ vctrs::vec_as_names(.,
                                                            repair = "unique",
                                                            quiet = TRUE)
    ) |>
        dplyr::rowwise() |>
        dplyr::mutate(
            Index = sum(dplyr::c_across(tidyselect::contains(.offset_field))),
            .keep = "unused"
        ) |>
        dplyr::arrange(
            .data$Index
        )
}
