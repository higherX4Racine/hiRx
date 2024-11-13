#' Copyright (C) 2022 Higher Expectations for Racine County

#' Read a file of FAFSA completion data from the US Dept. of Education
#'
#' @param path the full path to the file
#'
#' @return a tibble of helpful information.
#' @export
fafsa_read_file <- function(path) {
    path |>
        readxl::read_excel(
            path = _,
            range = cellranger::cell_limits(c(5, 1), c(NA, 5)),
            col_names = c("Name", "City", "State", "Submitted", "Complete"),
            col_types = "text"
        ) |>
        dplyr::mutate(
            dplyr::across(
                .cols = c(.data$Submitted, .data$Complete),
                .fns = ~ readr::parse_integer(., na = c("<5", "NA"))
            ),
            Rate = .data$Complete / .data$Submitted
        ) |>
        invisible()
}
