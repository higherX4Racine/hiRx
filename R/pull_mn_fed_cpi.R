#' Scrape the Minneapolis Federal Reserve's Consumer Price Index page.
#'
#' The Minneapolis fed
#' [hosts]("https://www.minneapolisfed.org/about-us/monetary-policy/inflation-calculator/consumer-price-index-1913-")
#' an html table that reports the annual national Consumer Price Index.
#'
#' @return a tibble with 3 columns: year, CPI, and % change.
#' @export
pull_mn_fed_cpi <- function() {
    cpi_cells <- "https://www.minneapolisfed.org/about-us/monetary-policy/inflation-calculator/consumer-price-index-1913-" |>
        httr2::request() |>
        httr2::req_perform() |>
        httr2::resp_body_html() |>
        xml2::xml_find_all("//tr") |>
        xml2::xml_children() |>
        xml2::xml_text() |>
        stringr::str_squish()

    cpi_cells |>
        utils::tail(-3) |>
        matrix(
            ncol = 3,
            byrow = TRUE,
            dimnames = list(list(),
                            cpi_cells[1:3])
        ) |>
        tibble::as_tibble() |>
        readr::type_convert(
            col_types = "inn"
        )
}
