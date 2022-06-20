# Copyright (C) 2022 by Higher Expectations for Racine County

geom_interior_intersection_area <- function(atomic_geoms,
                                            containing_geom) {
    sf::st_intersection(atomic_geoms,
                        sf::st_geometry(containing_geom),
                        .predicate = sf::st_relate,
                        pattern = "T********") %>%
        sf::st_make_valid() %>%
        sf::st_area() %>%
        as.numeric()
}

#' Find elements in `atomic_geoms` that overlap with `containing_geom`
#'
#' @param atomic_geoms an `sf::sf` object with one or more features
#' @param containing_geom one simple features object
#'
#' @return a tibble with elements from `atomic_geoms`
#' @export
geom_filter_by_interior_intersection <- function(atomic_geoms,
                                                 containing_geom) {

    atomic_geoms %>%
        sf::st_filter(containing_geom,
                      .predicate = sf::st_relate,
                      pattern = "T********") %>%
        dplyr::filter(
            geom_interior_intersection_area(., containing_geom) > 1
        )
}
