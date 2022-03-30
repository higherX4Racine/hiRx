# Copyright (C) 2022 by Higher Expectations for Racine County

#' Look up a Higher Expectations color palette by name
#'
#' @param palette the name of the palette, defaults to "main"
#' @param reverse should the palette's order be reversed, defaults to FALSE
#' @param n.colors how many colors should be in the palette, defaults to NULL
#' @param ... further arguments to pass to `grDevices::colorRampPalette`
#'
#' @return a color palette object for use in, e.g., ggplot
#' @export
#'
#' @examples
#' higher_ex_pal("blues")
higher_ex_pal <- function(palette = "main",
                          reverse = FALSE,
                          n.colors = NULL,
                          ...) {
    pal <- .higher_ex_palettes[[palette]]

    n.colors <- ifelse(
        is.null(n.colors) || !is.finite(n.colors) || n.colors < 1,
        length(pal),
        min(length(pal), n.colors)
    )

    pal <- pal[1:n.colors]

    if (reverse) {
        pal <- rev(pal)
    }

    grDevices::colorRampPalette(pal, ...)
}

.higher_ex_palettes <- list(
    main = higher_ex_cols(
        "Gold",
        "Gray",
        "Navy",
        "Bright Blue",
        "Medium Blue"
    ),
    blues = higher_ex_cols(
        "Bright Blue",
        "Medium Blue",
        "Navy"
    ),
    logo = higher_ex_cols(
        "Gray",
        "Gold",
        "White"
    ),
    race = higher_ex_cols(c(
        Black = "Tableau Azure",
        Latinx = "Tableau Olive",
        White = "Tableau Green",
        `2+` = "Tableau Muave",
        `Non-Econ` = "Tableau Sunny",
        `Econ Disadvant` = "Tableau Orange"
    )),
    inverse = higher_ex_cols(
        "White",
        "Gold",
        "Gray"
    ),
    tableau = higher_ex_cols(
        "Tableau Azure",
        "Tableau Orange",
        "Tableau Muave",
        "Tableau Green")
)
