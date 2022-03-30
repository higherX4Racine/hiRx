# Copyright (C) 2022 by Higher Expectations for Racine County

#' Scale aesthetics
#'
#' Use a Higher Expectations color palette for an aesthetic
#'
#' @inheritParams higher_ex_pal
#'
#' @return the grob being created
#'
#' @name scale_aesthetics
NULL

#' @export
#'
#' @examples
#' scale_color_higher_ex("logo", n.colors = 2)
#' scale_color_higher_ex("blues", discrete = FALSE)
#'
#' @rdname scale_aesthetics
scale_color_higher_ex <- function(...) {
    .scale_aesthetic_higher_ex("color", ...)
}

#' @export
#'
#' @examples
#' scale_fill_higher_ex("tableau", n.colors = 2)
#' scale_color_higher_ex("blues", discrete = FALSE)
#'
#' @rdname scale_aesthetics
scale_fill_higher_ex <- function(...) {
    .scale_aesthetic_higher_ex("fill", ...)
}

.scale_aesthetic_higher_ex <- function(aesthetic,
                                       palette = "main",
                                       discrete = TRUE,
                                       reverse = FALSE,
                                       n.colors = NULL,
                                       ...) {
    pal <- higher_ex_pal(palette = palette,
                         reverse = reverse,
                         n.colors = n.colors,
                         ...)

    if (discrete) {
        ggplot2::discrete_scale(aesthetic,
                                paste0("higher_ex_", palette),
                                palette = pal, ...)
    } else {
        ggplot2::scale_color_gradientn(colours = pal(256),
                                       ...)
    }
}
