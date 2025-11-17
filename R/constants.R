#' Standard options for creating a Higher Expectations vignette.
#'
#' @format a list with 8 elements
#'   \describe{
#'     \item{`collapse = TRUE`}{Try to put all of the source and output from each block into one code chunk.}
#'     \item{`warning = FALSE`}{Don't show warning messages in the output.}
#'     \item{`message = FALSE`}{Don't show informational messages in the output.}
#'     \item{`comment = "#>"`}{Text appended to every outputted line of code.}
#'     \item{`cache = TRUE`}{Re-use calculations from chunks that have not changed.}
#'     \item{`dpi = 96`}{Render the graphics in a web-friendly resolution.}
#'     \item{`fig.dim = c(width = 7, height = 4)`}{Pleasing defaults for figure sizes.}
#'     \item{`dev = c("png", "pdf")`}{Cache both `png` and `pdf` outputs, but use pngs in the vignette.}
#'   }
#' @source \url{https://yihui.org/knitr/options/}
#' @export
CHUNK_OPTIONS_FOR_KNITR <- list(
    collapse = TRUE,
    warning = FALSE,
    message = FALSE,
    comment = "#>",
    cache = TRUE,
    dpi = 96,
    fig.dim = c(width = 7,
                height = 4),
    dev = c("png", "pdf")
)

#' The golden ratio
#' @format An irrational number
#' @export
PHI <- (1 + sqrt(5)) / 2
