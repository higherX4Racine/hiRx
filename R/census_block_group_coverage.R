#' Find the Percentage of each Covered Census Block Group inside a Geography
#'
#' @param blocks a simple features table with census block data
#' @param containing_geo a simple features table with one geography
#' @param group_id tidyselect description of the column with block group ids.
#'
#' @return a tibble with values summarized by block group
#' @export
#'
#' @importFrom  magrittr %>%
census_block_group_coverage <- function(blocks,
                                        containing_geo,
                                        group_id = "BLKGRPID") {
    blocks %>%
        in_or_out(containing_geo) %>%
                summarize_block_groups({{ group_id }})
}

relevant_block_groups <- function(blocks,
                                  containing_geo,
                                  group_id) {
    blocks %>%
        dplyr::mutate(
            Covered = sf::st_intersects(containing_geo,
                                        .,
                                        sparse = FALSE)[1, ]
        ) %>%
        sf::st_drop_geometry() %>%
        dplyr::group_by(
            {{ group_id }}
        ) %>%
        dplyr::summarize(
            Covered = any(.data$Covered)
        ) %>%
        dplyr::ungroup() %>%
        dplyr::filter(.data$Covered) %>%
        only_informative_columns()
}

#' Pivot blocks to
#'
#' @param blocks the many census blocks
#' @param containing_geo the single covering geo
#'
#' @return a wider table
#' @export
#'
#' @importFrom magrittr %>%
in_or_out <- function(blocks, containing_geo, group_id) {
    blocks %>%
        dplyr::mutate(
            Covered = sf::st_covers(containing_geo,
                                    .,
                                    sparse = FALSE)[1, ]
        ) %>%
        dplyr::group_by(
            {{ group_id }}
        ) %>%
        dplyr::summarize(
            Covered = any(Covered)
        ) %>%
        dplyr::ungroup()

    blocks %>%
        dplyr::mutate(
            Covered = sf::st_covers(containing_geo,
                                    .,
                                    sparse = FALSE)[1,]
        ) %>%
        dplyr::group_by(
            {{ group_id }},
            .data$Covered
        ) %>%
        dplyr::summarize(
            dplyr::across(c(.data$POP, .data$ALAND),
                          sum)
        ) %>%
        dplyr::ungroup()
}

#' Summarize a collection of block-level geographies
#'
#' @param blocks a simple features table of block-level geographies.
#' @param group_id the variable that identifies block groups
#'
#' @return a summarized table
#' @export
#'
#' @importFrom magrittr %>%
summarize_block_groups <- function(blocks, group_id) {
    blocks %>%
        dplyr::group_by({{ group_id }}) %>%
        dplyr::summarize(
            `Covered Population` = sum(.data$POP_TRUE),
            `Group Population` = sum(.data$POP_TRUE + .data$POP_FALSE),
            `Covered Area` = sum(.data$ALAND_TRUE),
            `Group Area` = sum(.data$ALAND_TRUE + .data$ALAND_FALSE),
            geometry = sf::st_union(.data$geometry)
        ) %>%
        dplyr::ungroup() %>%
        dplyr::filter(
            .data$`Covered Area` > 0
        ) %>%
        dplyr::mutate(
            `Percent Residents` =
                .data$`Covered Population` / .data$`Group Population`,
            `Percent Area` =
                .data$`Covered Area` / .data$`Group Area`
        ) %>%
        sf::st_sf()
}
