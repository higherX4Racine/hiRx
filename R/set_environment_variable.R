# Copyright (C) 2022 by Higher Expectations for Racine Count
# This function is cribbed from the ``tidycensus`` package:
# https://github.com/walkerke/tidycensus/blob/master/R/helpers.R

#' Install a keypair in Your \code{.Renviron} File for Repeated Use
#' @description This function will add the keypair to your \code{.Renviron}
#' file so it can be called securely without being stored in your code. After
#' installation, it can be called any time by typing \code{Sys.getenv("KEY")}
#' and can be used in package functions by simply typing KEY. If you do not
#' have an \code{.Renviron} file, the function will create on for you. If you
#' already have an \code{.Renviron} file, the function will append the key to
#' your existing file, while making a backup of your original file for disaster
#' recovery purposes.
#' @param key The name of the environment variable. TODO: constrain all caps.
#' @param value The value of the environment variable.
#' @param install if TRUE, will install the key in your \code{.Renviron} file for use in future sessions.  Defaults to FALSE.
#' @param overwrite If this is set to TRUE, it will overwrite an existing KEY that you already have in your \code{.Renviron} file.
#' @importFrom utils write.table read.table
#' @examples
#'
#' \dontrun{
#' set_environment_variable("SECRET_KEY" = "111111abc", install = TRUE)
#' # First time, reload your environment so you can use the key without restarting R.
#' readRenviron("~/.Renviron")
#' # You can check it with:
#' Sys.getenv("SECRET_KEY")
#' }
#'
#' \dontrun{
#' # If you need to overwrite an existing key:
#' set_environment_variable("SECRET_KEY", "111111abc", overwrite = TRUE, install = TRUE)
#' # First time, relead your environment so you can use the key without restarting R.
#' readRenviron("~/.Renviron")
#' # You can check it with:
#' Sys.getenv("SECRET_KEY")
#' }
#' @export

set_environment_variable <- function(key,
                                     value,
                                     overwrite = FALSE,
                                     install = FALSE){

    if (install) {
        home <- Sys.getenv("HOME")
        renv <- file.path(home, ".Renviron")
        if(file.exists(renv)){
            # Backup original .Renviron before doing anything else here.
            file.copy(renv, file.path(home, ".Renviron_backup"))
        }
        if(!file.exists(renv)){
            file.create(renv)
        }
        else{
            if(isTRUE(overwrite)){
                message("Your original .Renviron will be backed up and stored in your R HOME directory if needed.")
                oldenv=read.table(renv, stringsAsFactors = FALSE)
                newenv <- oldenv[-grep(key, oldenv),]
                write.table(newenv,
                            renv,
                            quote = FALSE,
                            sep = "\n",
                            col.names = FALSE,
                            row.names = FALSE)
            }
            else{
                tv <- readLines(renv)
                if(any(grepl(key, tv))){
                    stop(paste0("A ", key, " already exists. ",
                                "You can overwrite it with the argument ",
                                "overwrite=TRUE"),
                         call.=FALSE)
                }
            }
        }

        keyconcat <- paste0(key, '="', value, '"')
        # Append key=value to .Renviron file
        write(keyconcat, renv, sep = "\n", append = TRUE)
        message(
            paste0('Your keypair has been stored in your .Renviron and ',
                   'can be accessed by Sys.getenv("', key,'").',
                   '\nTo use now, restart R or run ',
                   '`readRenviron("~/.Renviron")`')
        )
        return(key)
    } else {
        message(
            paste0("To install your API key for use in future sessions, ",
                   "run this function with `install = TRUE`.")
        )
        Sys.setenv("{key}" := value)
    }

}
