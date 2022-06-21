# Copyright (C) 2022 by Higher Expectations for Racine County

# these are constants that match the current structure of the LAUS files.
# check these first if the package stops working.

BLS_INDEX_ELEMENT <- "pre"
BLS_INDEX_WIDTHS <- c(19, 13, NA)
BLS_INDEX_COLUMNS <- c("Upload", "Bytes", "Table")
BLS_DATETIME_FORMAT <- "%m/%d/%Y %I:%M %p"
BLS_INDEX_NA_VALUES <- c("", NA, "<dir>")
BLS_INDEX_TABLE_FIELD <- BLS_INDEX_COLUMNS[3]
BLS_INDEX_TABLE_PARTS <- c(NA, NA, "Index", "Place")
BLS_INDEX_TABLE_SEP <- "\\."

#' Download information about the subtables in a BLS data tree
#'
#' @param table_path the path to the index file, e.g. "pub/time.series/la"
#'
#' @return a data frame with the following fields
#'     \describe{
#'         \item{Upload}{the timestamp of when the table was last changed.}
#'         \item{Bytes}{the size of the table, in bytes}
#'         \item{Table}{the name of the table}
#'         \item{Index}{the index of the table, if it contains data}
#'         \item{Place}{more detail about what the table's data describe}
#'     }
#' @export
#' @importFrom magrittr %>%
bls_index_table <- function(table_path) {

    file.path(BLS_DOMAIN,
              table_path) %>%
        xml2::read_html() %>%
        rvest::html_element(css = BLS_INDEX_ELEMENT) %>%
        rvest::html_text2() %>%
        readr::read_fwf(
            col_positions = readr::fwf_widths(
                widths = BLS_INDEX_WIDTHS,
                col_names = BLS_INDEX_COLUMNS
            ),
            col_types = readr::cols(
                Upload = readr::col_datetime(format = BLS_DATETIME_FORMAT),
                Bytes = readr::col_integer(),
                .default = readr::col_character()
            ),
            skip = 2,
            trim_ws = TRUE,
            na = BLS_INDEX_NA_VALUES
        ) %>%
        tidyr::separate(
            {{ BLS_INDEX_TABLE_FIELD }},
            into = BLS_INDEX_TABLE_PARTS,
            sep = BLS_INDEX_TABLE_SEP,
            remove = FALSE,
            convert = TRUE,
            fill = "right",
        )
}
