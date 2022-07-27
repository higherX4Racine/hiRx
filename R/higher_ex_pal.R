# Copyright (C) 2022 by Higher Expectations for Racine County

#' Look up a Higher Expectations color palette by name
#'
#' @param palette the name of the palette, defaults to "main"
#' @param reverse should the palette's order be reversed, defaults to FALSE
#' @param n.colors choose this to limit the number of colors in the palette, defaults to NULL for all of the palette's colors
#' @param ... further arguments to pass to `grDevices::colorRampPalette`
#'
#' @return a color palette object for use in, e.g., ggplot
#'   The available palettes are
#'   \describe{
#'     \item{main}{Five colors from the branding document}
#'     \item{blues}{Three shades of blue, light to dark}
#'     \item{econ}{Two shades of orange}
#'     \item{logo}{Gray, Gold, and White}
#'     \item{race}{Four colors for Racine's empirical census races}
#'     \item{inverse}{The reverse of `logo`}
#'     \item{tableau}{The first four default colors from Tableau}
#'     \item{navy gradient}{Navy, the intermediate green, and Gold}
#'     \item{bright gradient}{Bright Blue, the intermediate green, and Gold}
#'     \item{medium gradient}{Medium Blue, the intermediate green, and Gold}
#'   }
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
    econ = higher_ex_cols(
        `Not Economically Disadvantaged` = "Tableau Sunny",
        `Economically Disadvantaged` = "Tableau Orange"
    ),
    logo = higher_ex_cols(
        "Gray",
        "Gold",
        "White"
    ),
    race = higher_ex_cols(c(
        Black = "Tableau Azure",
        `Latin@` = "Tableau Olive",
        White = "Tableau Green",
        `All Other Races` = "Tableau Muave"
    )),
    inverse = higher_ex_cols(
        "White",
        "Gold",
        "Gray"
    ),
    tableau = higher_ex_cols(
        "Tableau Azure",
        "Tableau Orange",
        "Tableau Green",
        "Tableau Muave"),
    `navy gradient` = higher_ex_cols(
        "Navy",
        "Navy Green",
        "Gold"
    ),
    `bright gradient` = higher_ex_cols(
        "Bright Blue",
        "Bright Green",
        "Gold"
    ),
    `medium gradient` = higher_ex_cols(
        "Medium Blue",
        "Medium Green",
        "Gold"
    )
)
