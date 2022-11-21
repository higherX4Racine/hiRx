# Copyright (C) 2022 by Higher Expectations for Racine County

.dots_to_by <- function(...) {
    .by = purrr::map_chr(list(...), I);
    if (length(.by) == 1 && is.null(names(.by))) {
        names(.by) <- .by
        .by[1] <- "SOURCE RACE"
    }
    return(.by)
}

#' Convert the race labels from a data source to Racine race labels
#'
#' @param .x a data frame with a column of race labels
#' @param mapping a data frame that relates the source's labels to Racine's
#' @param ... values for the `by` argument of an `inner_join` between `.x` and `mapping`
#' @param target_name optional, defaults to "Race/Ethnicity".
#'
#' @return a new data frame with a factor, `Race/Ethnicity`, of Racine races.
#' @export
assign_race_labels <- function(.x,
                               mapping,
                               ...,
                               target_name = "Race/Ethnicity"){
    .by <- .dots_to_by(...)
    .x %>%
        dplyr::inner_join(
            mapping,
            by = .by
        ) %>%
        dplyr::select(
            !tidyselect::any_of(.by)
        ) %>%
        dplyr::mutate(
            "{target_name}" := factor(.data[[target_name]],
                                      levels = hiRx::RACE_LABELS_RACINE)
        )
}
