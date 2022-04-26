# Copyright (C) 2022 by Higher Expectations for Racine County

.measure_subset <- function(.x, .measures) {
    .search_string <- paste0(measures, "$", collapse = "|")
    invisible(
        dplyr::filter(.x,
                      stringr::str_detect(.x$Measure,
                                          .search_string))
    )
}


.update_rate <- function(.x, .rate_factor, .rate_key = "Rate") {

    invisible(
        dplyr::mutate(
            .x,
            Value = purrr::modify_if(.x$Value,
                                     stringr::str_detect(.x$Measure,
                                                         .rate_key),
                                     ~ . * .rate_factor)
        )
    )
}


.nudge_labels <- function(.x, .x_nudge, .y_nudge) {
    invisible(
        dplyr::mutate(
            .x,
            Year = .x$Year + .x_nudge * .x$`X Offset`,
            Value = .x$Value + .y_nudge * .x$`Y Offset`
        )
    )
}


.plot_tables <- function(.x,
                         .trends,
                         .year,
                         .rate_factor,
                         .rate_key,
                         .nudge_x,
                         .nudge_y){

    .u <- .measure_subset(.x, .trends)

    .v <- .u %>%
        annotation_table(.year) %>%
        .update_rate(
            .rate_factor,
            .rate_key
        ) %>%
        .nudge_labels(.nudge_x, .nudge_y)

    invisible(
        list(u = .update_rate(.rate_factor,
                              .rate_key),
             v = .v)
    )
}


.plot_thing <- function(.grob,
                        .v,
                        .ymax) {
    .grob +
        ggplot2::geom_line(size = 1.2) +
        ggplot2::labs(y = "Number of People",
                      color = NULL) +
        ggplot2::geom_text(
            mapping = ggplot2::aes(label = Label,
                                   hjust = "center"),
            data = .v,
            show.legend = FALSE
        ) +
        ggplot2::lims(
            y = c(0, .ymax)
        ) +
        ggplot2::theme_bw()

}


.one_axis <- function(.x, .name, .scale) {
    .x %>%
        ggplot2::ggplot(
            ggplot2::aes(x = .x$Year,
                         y = .x$Value)
        ) +
        ggplot2::scale_y_continuous(
            labels = .scale,
            name = .name
        )

}


.two_axes <- function(.x,
                      .trend_colors,
                      .rate_name,
                      .rate_factor) {
    .x %>%
        ggplot2::ggplot(
            ggplot2::aes(x = .x$Year,
                         y = .x$Value,
                         color = .x$Measure)
        ) +
        ggplot2::scale_color_manual(
            values = .trend_colors
        ) +
        ggplot2::scale_y_continuous(
            labels = scales::label_comma(),
            sec.axis = ggplot2::sec_axis(
                name = .rate_name,
                trans = ~ . / .rate_factor,
                labels = scales::label_percent(1)
            )
        ) +
        ggplot2::theme(legend.position = "top")
}


plot_one_trend <- function(.x,
                           .trends,
                           .ymax = 3000,
                           .unemployment_scale = 1/.ymax,
                           .label_x = 1,
                           .label_y = 50,
                           .year = 2020,
                           .rate_key = "Rate",
                           .legend_position = "none") {

    .rate_factor = .ymax * .unemployment_scale

    .X = .plot_tables(.x,
                      .trends,
                      .year,
                      .rate_factor,
                      .rate_key,
                      .label_x,
                      .label_y)

    .plot_thing(.one_axis(.X$u,
                          .trends[1],
                          scales::label_comma()),
                .X$v,
                .ymax)
}


plot_4_laus_trends <- function(.x,
                               .trends = c("Employed",
                                           "Labor Force",
                                           "Unemployed",
                                           "Unemployment Rate"),
                               .ymax = 45000,
                               .unemployment_scale = 5,
                               .label_x = 0,
                               .label_y = 0,
                               .year = 2020,
                               .rate_key = "Rate") {

    .rate_factor = .ymax * .unemployment_scale

    .X = .plot_tables(.x,
                      .trends,
                      .year,
                      .rate_factor,
                      .rate_key,
                      .label_x,
                      .label_y)

    .plot_thing(.two_axes(.X$u,
                          c("darkgreen",
                            "red",
                            "gold",
                            "skyblue3"),
                          "Unemployment Rate",
                          .rate_factor),
                .X$v,
                .ymax)
}


plot_two_laus_trends <- function(.x,
                                 .trends = c("Unemployment Rate Difference$",
                                             "Additional Jobs"),
                                 .ymax = 3000,
                                 .unemployment_scale = 5,
                                 .label_x = 1,
                                 .label_y = 50,
                                 .year = 2020,
                                 .rate_key = "Rate") {

    .rate_factor = .ymax * .unemployment_scale

    .X = .plot_tables(.x,
                      .trends,
                      .year,
                      .rate_factor,
                      .rate_key,
                      .label_x,
                      .label_y)

    .plot_thing(.two_axes(.X$u,
                          c("darkgray", "skyblue3"),
                          "Unemployment Rate Difference",
                          .rate_factor),
                .X$v,
                .ymax)
}

