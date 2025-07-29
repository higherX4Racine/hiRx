.higher_ex_colors <- c(
    Gold = "#FDB913",
    Gray = "#58585B",
    Navy = "#0C223F",
    `Bright Blue` = "#00B2E2",
    `Medium Blue` = "#0081C9",
    `Navy Green` = "#207C5C",
    `Bright Green` = "#06CF79",
    `Medium Green` = "#05B57E",
    White = "#FFFFFF",
    `Tableau Green` = "#159a48",
    `Tableau Azure` = "#0a4e8d",
    `Tableau Olive` = "#bcb833",
    `Tableau Mauve` = "#af5d98",
    `Tableau Sunny` = "#fdbe13",
    `Tableau Orange` = "#f89620",
    `Caledonia Blue` = "#014493",
    `Mount Pleasant Green` = "#6BB745",
    `Racine Blue` = "#3C76BE",
    `Sturtevant Brown` = "#8C7B73",
    `Strive Slate` = "#3B5663",
    `Strive Gray` = "#B3B3B3",
    `Strive Orange` = "#F58B3B",
    `Strive Pink` = "#FABFD2",
    `Strive Gold` = "#EFC94C",
    `Strive Lilac` = "#91679B",
    `Strive Teal` = "#1C95A9",
    `Strive Blue` = "#118DFF",
    `Strive Forest` = "#338676",
    `Strive Sea` = "#69C1B1",
    `Strive Red` = "#DD5757",
    `Strive Brown` = "#B8682C",
    `Strive Robin` = "#AFE0E8",
    `Case Green` = "#143b26",
    `Horlick Gray` = "#aeb0b3",
    `Park Orange` = "#de532a",
    `REAL Blue` = "#87afdf",
    `Walden Purple` = "#423186"
)

#' Look up a color from Higher Expectations' palette
#'
#' Higher Expectations for Racine County has several color palettes that were
#' designed by the branding team.
#'
#' @param ... Character vectors that name colors. Calling without arguments returns every color.
#'
#' @return An unnamed vector of colors in hex format
#' @export
#'
#' @note The possible values for
#' @examples
#' blues <- higher_ex_cols("Bright Blue", "Medium Blue", "Navy")
higher_ex_cols <- function(...) {
    cols <- c(...)

    if (is.null(cols))
        return(.higher_ex_colors)

    tmp <- .higher_ex_colors[cols]

    names(tmp) <- NULL

    tmp
}
