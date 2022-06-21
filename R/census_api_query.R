.BASE_URL <- "https://api.census.gov/data"

.colonic <- function(...) {
    list(...) %>%
        purrr::imap(~ paste0("in=", .y, ":", .x)) %>%
        paste0(collapse = "&")
}

#' Build a URL for querying the 5-Year ACS API
#'
#' @param year the year to query
#' @param variables a vector of variables
#' @param for_geo a single geographic level, like "tract" or "block"
#' @param for_items the specific geographies, or "*"
#' @param ... other items to pass to the query
#'
#' @return one string that holds the entire query
#' @export
#' @examples
#' hiRx::acs5_query_url(2020,
#'                     "B190013_001E",
#'                     for_geo = "tract",
#'                     for_items = "*",
#'                     state = 55,
#'                     county = 101)
acs5_query_url <- function(year,
                           variables,
                           for_geo,
                           for_items,
                           ...){
    vars <- paste0(variables, collapse = ",")
    fors <- glue::glue("for={for_geo}:{paste0(for_items, collapse = ',')}")
    query <- paste(vars, fors, .colonic(...), sep = "&")
    glue::glue("{.BASE_URL}/{year}/acs/acs5?get={query}")
}


#' Create a query url for pulling data from the Decennial Census API
#'
#' @param year the year to query
#' @param summary_table the summary table that the variables come from
#' @param variables the specific rows in the summary table
#' @param for_geo the type of geographic area, like "county\%20subdivision"
#' @param for_items the specific items, like "66000" or "*"
#' @param ... other keys to pass to the query
#'
#' @return one string that holds the entire query
#' @export
#' @examples
#' hiRx::decennial_query_url(year = 2020,
#'                           summary_table = "pl",
#'                           for_geo = "block",
#'                           for_items = "*",
#'                           state = 55,
#'                           county = 101)
decennial_query_url <- function(year,
                                summary_table,
                                variables,
                                for_geo,
                                for_items,
                                ...){
    vars <- paste0(variables, collapse = ",")
    fors <- paste0("for=", for_geo, ":", paste0(for_items, collapse = ","))
    query <- paste(vars, fors, .colonic(...), sep = "&")
    paste(.BASE_URL,
          as.character(year),
          "dec",
          paste0(summary_table,
                 "?get=",
                 query),
          sep = "/"
    )
}
