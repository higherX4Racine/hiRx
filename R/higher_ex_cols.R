.higher_ex_colors <- c(
    Gold = "#FDB913",
    Gray = "#58585B",
    Navy = "#0C223F",
    `Bright Blue` = "#00B2E2",
    `Medium Blue` = "#0081C9",
    White = "#FFFFFF",
    `Tableau Green` = "#159a48",
    `Tableau Azure` = "#0a4e8d",
    `Tableau Olive` = "#bcb833",
    `Tableau Muave` = "#af5d98",
    `Tableau Sunny` = "#fdbe13",
    `Tableau Orange` = "#f89620"
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
        return (.higher_ex_colors)

    tmp <- .higher_ex_colors[cols]

    names(tmp) <- NULL

    tmp
}
