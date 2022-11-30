# Copyright (C) 2022 Higher Expectations for Racine County
#' Read a file of FAFSA completion data from the US Dept. of Education
#'
#' @param path the full path to the file
#'
#' @return a tibble of helpful information.
#' @export
fafsa_read_file <- function(path) {
    readxl::read_excel(path,
                       skip = 3,
                       col_types = "text") %>%
        tidyr::pivot_longer(cols = !(Name:State),
                            values_to = "Applications") %>%
        dplyr::mutate(
            Applications = readr::parse_integer(Applications,
                                                na = c("<5", "NA"))) %>%
        dplyr::filter(!is.na(Applications)) %>%
        tidyr::separate(name,
                        c(NA,
                          "Status",
                          "Date"),
                        sep = "\n",
                        convert = TRUE) %>%
        tidyr::pivot_wider(id_cols = c(Name, City, State, Date),
                           names_from = Status,
                           values_from = Applications) %>%
        tidyr::unnest(c("Submitted",
                        "Complete")) %>%
        tidyr::extract(Date,
                       into = c("Month",
                                "Day",
                                "Year"),
                       regex = "([[:alpha:]]{3})(\\S*)\\s+(.+)",
                       convert = TRUE) %>%
        dplyr::mutate(Rate = Complete / Submitted,
                      Date = lubridate::ymd(paste(Year,
                                                  Month,
                                                  dplyr::if_else(is.na(Day),
                                                                 1L,
                                                                 Day)))
        ) %>%
        dplyr::distinct() %>%
        invisible()
}
