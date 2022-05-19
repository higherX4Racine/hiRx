.BASE_URL <- "https://api.census.gov/data"

.colonic <- function(...) {
    list(...) %>%
        purrr::imap(~ paste0("in=", .y, ":", .x)) %>%
        paste0(collapse = "&")
}

#' Title
#'
#' @param x
#'
#' @return
#' @export
#'
#' @importFrom magrittr %>%
tibble_from_json <- function(x) {
    x %>%
        tail(-1) %>%
        purrr::transpose() %>%
        purrr::set_names(as.character(x[[1]])) %>%
        tibble::as_tibble() %>%
        dplyr::mutate(
            dplyr::across(.fns = as.character)
        )
}

#' Title
#'
#' @param year
#' @param variables
#' @param for_geo
#' @param for_items
#' @param ...
#'
#' @return
#' @export
#'
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
