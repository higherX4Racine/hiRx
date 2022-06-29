# Copyright (C) 2022 by Higher Expectations for Racine County

#' Identify the indices of rows that will be labelled in a graph
#'
#' @param .x the data frame to summarize
#' @param .col the column to find indices in.
#' @param .focal_value a value to focus on (e.g. the year 2020)
#' @param .peak_col a column to search for its max. defaults to "Value"
#'
#' @return a tibble with ``Name``, ``Index``, ``X Offset``, and ``Y Offset``
#' @export
#'
#' @examples
#' racine_laus %>%
#'     purrr::pluck("wisconsin") %>%
#'     hiRx::unlump_series(Series) %>%
#'     dplyr::filter(`Measure Code` == "06", Month == "January") %>%
#'     identify_indices(Year, 2020)
identify_indices <- function(.x, .col, .focal_value, .peak_col = "Value") {
    .values <- dplyr::pull(.x, {{ .col }})
    .to_max <- dplyr::pull(.x, {{ .peak_col }})
    tibble::tribble(
        ~ Name, ~ Index, ~ `X Offset`, ~ `Y Offset`,
        "first", which.min(.values), -1, -1,
        "peak value", which.max(.to_max), 0, 1,
        paste(.focal_value, "index"), which(.values == .focal_value), 0, 0,
        "final", which.max(.values), 1, -1
    )
}

#' Create a data frame for putting labels on a graph.
#'
#' @param .x the data frame to summarize
#' @param .col the column to find indices in.
#' @param .focal_value a value to focus on (e.g. the year 2020)
#' @param .group_col designates the category to find indices within
#'
#' @return a data frame with fields ``Name``, ``Measure``, ``Value``, and ``Label``
#' @export
#' @importFrom magrittr %>%
#' @importFrom rlang .data
#'
#' @examples
#' racine_laus %>%
#'     purrr::pluck("wisconsin") %>%
#'     hiRx::unlump_series(Series) %>%
#'     dplyr::select(`Measure Code`, Year, Month, Value) %>%
#'     dplyr::filter(`Measure Code` == "06", Month == "January") %>%
#'     annotation_table(Year, 2020, `Measure Code`)
annotation_table <- function(.x,
                             .col,
                             .focal_value,
                             .group_col) {
    .x %>%
        dplyr::group_by({{ .group_col }}) %>%
        tidyr::nest() %>%
        dplyr::mutate(
            Indices = purrr::map(.data$data,
                                 ~ identify_indices(.,
                                                    {{ .col }},
                                                    .focal_value)),
            Sliced = purrr::map2(data,
                                 .data$Indices,
                                 ~ .x[.y$Index,])
        ) %>%
        tidyr::unnest(
            cols = c(.data$Indices,
                     .data$Sliced)
        ) %>%
        dplyr::select(-.data$data) %>%
        dplyr::ungroup()
}


#' Create a column of formatted labels from one of disparate numeric values.
#'
#' This function looks in a character column for a regex that indicates whether
#' a row is a percentage or a whole number. It then prettily formats the
#' contents of a numeric column as either a percentage or a comma-separated int.
#'
#' @param .x a tibble with fields ``Measure`` and ``Value``.
#' @param .rate_key a string in the Measure name that indicates a percentage
#'
#' @return a tibble with a new column, ``Label``, that is formatted.
#' @importFrom rlang .data
#' @export
#'
#' @examples
#' make_annotation_labels(
#'     tibble::tribble(~Measure, ~Value,
#'                      "R",      0.5,
#'                      "K",      1000,
#'                      "A",      42),
#'     "R"
#' )
make_annotation_labels <- function(.x,
                                   .rate_key = "Rate") {
    dplyr::mutate(.x,
                  Label = dplyr::if_else(
                      stringr::str_detect(.data$Measure,
                                          .rate_key),
                      scales::percent(.data$Value,
                                      accuracy = 1),
                      scales::number(.data$Value,
                                     accuracy = 1,
                                     big.mark = ",")
                  )
    )
}

