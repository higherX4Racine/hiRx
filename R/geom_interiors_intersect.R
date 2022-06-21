# Copyright (C) 2022 by Higher Expectations for Racine County

#' Detect when geometries' interiors intersect.
#'
#' This approach uses a custom intersection algorithm that only counts areas as
#' intersecting if their interiors overlap
#'
#' @param x an object of class `sf::sf`, `sf::sfc` or `sf::sfg`
#' @param y an object of class `sf::sf`, `sf::sfc` or `sf::sfg`
#' @param ... other arguments that might be passed to `sf::st_relate`
#'
#' @return either a matrix of `logical`s or a list of row indices
#' @export
#'
#' @seealso `sf::st_relate`
geom_interiors_intersect <- function(x, y, ...) {
    sf::st_relate(x, y,
                  pattern = "T********",
                  ...)
}
