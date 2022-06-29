# Copyright (C) 2022 by Higher Expectations for Racine County

#' Vectorized Creation of Census ACS Variables
#'
#' All detail table variables have the format "B000OOX_000E", where the "B" and
#' "E" are literal and the "X" is a race code.
#'
#' @param table_code the table code, like "B18101"
#' @param race_code either an empty string or one of \[A..I\]
#' @param item_number some integer between 0 and 999
#'
#' @return a vector of strings, each of which is a variable name
#' @export
#'
#' @examples
#' tables <- c("B19013", "B18101", "B18101")
#' races <- c("", "", "I")
#' numbers <- 1
#' census_build_acs_variable(tables, races, numbers)
census_build_acs_variable <- function(table_code,
                                      race_code,
                                      item_number){
    paste0(
        table_code,
        race_code,
        "_",
        stringr::str_pad(item_number,
                         width = 3,
                         side = "left",
                         pad = 0),
        "E"
    )
}
