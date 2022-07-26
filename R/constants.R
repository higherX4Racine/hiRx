#' Information for re-coding between Census and Higher Expectations race labels
#'
#' In Racine County, WI, only a few racial/ethnic groups occur in large enough
#' numbers for us to report on their demographics. Even though we lump some
#' groups into an "All Other Races" category, we still value the cultures and
#' experiences of people from all heritages.
#'
#' @format a tibble with three columns
#'   \describe{
#'     \item{Census Race}{Labels for each group used by the Census}
#'     \item{Suffix}{The one-letter code the Census uses to identify tables about each group.}
#'     \item{Race/Ethnicity}{One of four labels for groups in Racine, WI.}
#'   }
#' @export
#' @rdname constants
CENSUS_RACE_MAPPING <- tibble::tribble(
    ~`Census Race`, ~`Suffix`, ~ `Race/Ethnicity`,
    "All", "", "All",
    "Black", "B", "Black",
    "First Nations", "C", "All Other Races",
    "Asian", "D", "All Other Races",
    "Pacific Islander", "E", "All Other Races",
    "Other", "F", "All Other Races",
    "Multi-Racial", "G", "All Other Races",
    "White", "H", "White",
    "Latin@", "I", "Latin@"
) %>%
    dplyr::mutate(
        `Race/Ethnicity` = factor(.data$`Race/Ethnicity`,
                                  levels = c("Black",
                                             "Latin@",
                                             "White",
                                             "All Other Races",
                                             "All"))
    )

#' Census races/ethnicities with their one-letter codes.
#' @export
#' @rdname constants
CENSUS_RACE_SUFFIXES <- c(
    All = "",
    Black = "B",
    `First Nations` = "C",
    Asian = "D",
    `Pacific Islander` = "E",
    Other = "F",
    `Multi-Racial` = "G",
    White = "H",
    `Latin@` = "I"
)


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
#' @rdname constants
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
