# Copyright (C) 2022 by Higher Expectations for Racine

#' Horizontal bar plots colored by race/ethnicity showing percentages
#'
#' @param .x the data, including a "Race/Ethnicity" variable
#' @param response the percentage-valued response variable
#' @param label a horizontal axis label for the plot
#' @param .race_ethnicity, optional, defaults to "Race/Ethnicity"
#'
#' @return a graphical object to chain with other ggplot2 items.
#'
#' @export
plot_percent_by_race <- function(.x,
                                 response,
                                 label,
                                 .race_ethnicity = "Race/Ethnicity"){
    .x %>%
        ggplot2::ggplot(
            ggplot2::aes(x = {{ response }},
                         y = .data[[.race_ethnicity]],
                         fill = .data[[.race_ethnicity]])
        ) +
        ggplot2::geom_col(
            position = "dodge",
            col = "black",
            show.legend = FALSE
        ) +
        ggplot2::geom_text(
            mapping = ggplot2::aes(
                label = scales::label_percent(accuracy = 1)({{ response }})
            ),
            position = ggplot2::position_stack(vjust = 0.5),
            col = "white"
        ) +
        ggplot2::scale_y_discrete(
            name = NULL,
            limits = rev
        ) +
        ggplot2::scale_x_continuous(
            name = label,
            labels = NULL,
            limits = c(0, NA)
        ) +
        hiRx::scale_fill_higher_ex("race",
                                   n.colors = 4)
}
