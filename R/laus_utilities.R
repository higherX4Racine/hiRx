convert_code_columns <- function(.x) {
    invisible(
        dplyr::mutate(.x,
                      dplyr::across(
                          c(.data$srd_code, .data$measure_code),
                          as.integer
                      ))
    )

}
