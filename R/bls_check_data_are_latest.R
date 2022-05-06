# Copyright (C) 2022 by Higher Expectations for Racine County

.pull_date <- function(.x, table_name) {
    dplyr::pull(
        dplyr::filter(.x,
                      stringr::str_detect(.data$Table,
                                          table_name)),
        "Upload"
    )
}

bls_check_data_are_latest <- function(table_name,
                                      previous_index,
                                      data_or_path = NULL) {

    if (rlang::inherits_any(data_or_path, "character")) {
        data_or_path <- bls_index_table(data_or_path[1])
    }
    else if (!rlang::inherits_any(data_or_path,
                                  c("tbl_df", "tbl", "data.frame"))) {
        stop("data_or_path must be a character vector or data frame")
    }

    latest_date <- .pull_date(data_or_path,
                              table_name)

    previous_date <- .pull_date(previous_index,
                               table_name)

    return(latest_date <= previous_date)
}
