#' Read a csv file that contains mappings between racial labels
#'
#' @param .file_name the full path to the file
#'
#' @return a tibble of character columns
read_race_mapping <- function(.file_name) {
    readr::read_csv(
        .file_name,
        col_names = TRUE,
        col_types = readr::cols(
            .default = readr::col_character()
        ),
        show_col_types = FALSE,
        na = c("NA")
    )
}
