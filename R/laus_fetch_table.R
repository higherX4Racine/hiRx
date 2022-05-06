# Copyright (C) 2022 by Higher Expectations for Racine County

LAUS_PATH <- "pub/time.series/la"

#' Get tab-delimited data from download.bls.gov/pub/time.series/la
#'
#' @param table_name a string that identifies the table to find
#' @param column_specification a readr::cols object defining the table's fields.
#'
#' @return a data frame with fields defined by \code{column_specification}
#' @export
laus_fetch_table <- function(table_name,
                             column_specification) {
    readr::read_delim(file.path(BLS_DOMAIN,
                                LAUS_PATH,
                                table_name),
                      col_types = column_specification,
                      delim = "\t",
                      trim_ws = TRUE,
                      show_col_types = FALSE,
                      na = c("", NA, "-")
    )
}
