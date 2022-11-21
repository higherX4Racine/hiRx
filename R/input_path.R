# Copyright (C) 2022 by Higher Expectations for Racine County

#' Define a subfolder of the runtime environment's DATA_PATH
#'
#' @param ... path components
#'
#' @return a path to a file or directory
#' @export
input_path <- function(...){
    path.expand(
        file.path(Sys.getenv("DATA_PATH"),
                  ...)
    )
}
