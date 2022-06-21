# Copyright (C) 2022 by Higher Expectations for Racine County

#' Some Example Local Area Unemployment Statistics Data Series
#'
#' A table of LAUS series from four places: Nashua, NH; Minneapolis, MN; Ithaca,
#' NY, and Racine WI. There are four kinds of data: Unemployment Rate,
#' Unemployed People, Employed People, and Labor Force. These data are all not
#' adjusted for seasonality.
#'
#'
#'
#' @format This table demonstrates what raw series data look like when
#'   downloaded from the BLS's plain-text data archives, as described in
#'   \code{vignette("laus", package = "hiRx")}.
#'
#'   \describe{
#'   \item{series_id}{a 20-character BLS series code}
#'   \item{year}{an integer giving the year of the observation}
#'   \item{period}{a 3-character code, either the month or annual mean.}
#'   \item{value}{a real number that is either people or a percentage.}
#'   \item{footnote_codes}{a one-character flag if the observation is weird.}
#'   }
#'
#' @source \url{https://download.bls.gov/pub/time.series/la/}
"laus_example"

#' Local Area Unemployment Data Series for Racine, Wisconsin
#'
#' A list of LAUS time series for three local areas: the state of Wisconsin and
#' the County and City of Racine, WI. There are four time series for each area:
#' Employment, Labor Force, Unemployment, and Unemployment Rate.
#'
#' @format A list of three data frames, each of which have 6 variables:
#'     \describe{
#'         \item{Geography}{a 15-character FIPS-like geocode.}
#'         \item{Measure}{an enum from the Python package ``herc.bls.laus``.}
#'         \item{Series}{a 20-char. BLS code concatenating ``Geography`` and ``Measure``.}
#'         \item{Year}{the four-digit year of the series}
#'         \item{Month}{an ordered factor with full month names in English.}
#'         \item{Value}{the value of the measure for the area and date.}
#'     }
#' @source \url{https://api.bls.gov/publicAPI/v2/timeseries/data/}
"racine_laus"

#' Populations of Different Races in Census Tracts and Places in Racine, WI
#'
#' The smallest unit of area that the ACS 5-year survey reports in is the
#' census tract. No one actually cares about what happens in a census tract
#' in and of itself, though. County subdivisions, on the other hand, are actual
#' places like towns, villages, or cities. Those, we care about. This is a
#' tibble of the populations of three racial/ethnic groups of Racine County, WI
#' within census tracts and county subdivisions.
#'
#' @format a tibble with 6 columns:
#'     \describe{
#'         \item{Year}{four-digit integer}
#'         \item{Municipality}{each county subdivision's NAME field.}
#'         \item{tract}{the six-digit code of the tract within Racine County}
#'         \item{Race/Ethnicity}{"Black", "Latin@", "White", or "All Other Races"}
#'         \item{Municipal Population}{people who live in the tract and Municipality}
#'         \item{Tract Population}{people in this race who live anywhere in the tract.}
#'     }
#' @source \url{https://api.census.gov}
"racine_race_pop_weights_by_tract"
