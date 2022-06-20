# Copyright (C) 2022 by Higher Expectations for Racine County

#' Only report intersections with valid geometries
#'
#' @param geos_of_interest a collection of `sf::sf`-like objects
#' @param reference_geo a single `sf::sf` object
#'
#' @return a collection of new, valid `sf::sf` objects
#' @seealso
#'   \describe{
#'     \item{`sf::st_intersection`}{the function for computing the intersections}
#'     \item{`sf::st_make_valid`}{the function that repairs the new geometries}
#' }
#' @export
valid_intersections <- function(geos_of_interest, reference_geo){
    sf::st_intersection(sf::st_geometry(geos_of_interest),
                        sf::st_geometry(reference_geo)) %>%
        sf::st_make_valid()
}
