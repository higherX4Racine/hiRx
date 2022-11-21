# Copyright (C) 2022 by Higher Expectations for Racine County

#' Some Example Local Area Unemployment Statistics Data Series
#'
#' A table of LAUS series from four places: Nashua, NH; Minneapolis, MN; Ithaca,
#' NY, and Racine WI. There are four kinds of data: Unemployment Rate,
#' Unemployed People, Employed People, and Labor Force. These data are all not
#' adjusted for seasonality.
#'
#' @format This table demonstrates what raw series data look like when
#'   downloaded from the BLS's plain-text data archives, as described in
#'   \code{vignette("laus", package = "hiRx")}.
#'
#'   \describe{
#'     \item{series_id}{a 20-character BLS series code}
#'     \item{year}{an integer giving the year of the observation}
#'     \item{period}{a 3-character code, either the month or annual mean.}
#'     \item{value}{a real number that is either people or a percentage.}
#'     \item{footnote_codes}{a one-character flag if the observation is weird.}
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
#'   \describe{
#'     \item{Geography}{a 15-character FIPS-like geocode.}
#'     \item{Measure}{an enum from the Python package ``herc.bls.laus``.}
#'     \item{Series}{a 20-char. BLS code concatenating ``Geography`` and ``Measure``.}
#'     \item{Year}{the four-digit year of the series}
#'     \item{Month}{an ordered factor with full month names in English.}
#'     \item{Value}{the value of the measure for the area and date.}
#'   }
#'
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
#'   \describe{
#'     \item{Year}{four-digit integer}
#'     \item{Municipality}{each county subdivision's NAME field.}
#'     \item{tract}{the six-digit code of the tract within Racine County}
#'     \item{Race/Ethnicity}{"Black", "Latin@", "White", or "All Other Races"}
#'     \item{Municipal Population}{people who live in the tract and Municipality}
#'     \item{Tract Population}{people in this race who live anywhere in the tract.}
#'   }
#'
#' @source \url{https://api.census.gov}
"racine_race_pop_weights_by_tract"

#' Race, at least among Racine Students, usually means Black, Latin@@, or White.
#'
#' While folks in town are increasingly likely to identify as multiracial,
#' there are still a small enough number of them that the only statistically
#' useful thing to do is to lump everyone else into "All Other Races." This is
#' obviously bad, but then again, so is all racial categorization? To add to the
#' perfidy, I'm using the "one drop" system that is so perniciously part of
#' American racism: you aren't Latin@@ if you are Black, and you're not White if
#' you are Black or Latin@@. I am NOT endorsing this system. It reflects the
#' nature of the community fragmentation that is in Racine today.
#'
#' @format An ordered list of race labels based on recent ancestry from ...
#'   \describe{
#'     \item{Black}{Sub-Saharan Africa}
#'     \item{Latin@@}{Latin America}
#'     \item{White}{Europe or the Middle East}
#'     \item{All Other Races}{None of the above}
#'   }
"RACE_LABELS_RACINE"

#' Information for re-coding between Census and Higher Expectations race labels
#'
#' In Racine County, WI, only a few racial/ethnic groups occur in large enough
#' numbers for us to report on their demographics. Even though we lump some
#' groups into an "All Other Races" category, we still value the cultures and
#' experiences of people from all heritages.
#'
#' @format a tibble with three columns
#'   \describe{
#'     \item{SOURCE RACE}{Labels for each group used by the Census}
#'     \item{Suffix}{The one-letter code the Census uses to identify tables about each group.}
#'     \item{Race/Ethnicity}{One of four labels for groups in Racine, WI.}
#'   }
"RACE_MAPPING_CENSUS"

#' Codes that identify race/ethnicity in WI DPI staff demographics tables
#'
#' The WI DPI is the Wisconsin Department of Public Instruction. It uses one-
#' letter codes to report the race/ethnicity of staff members.
#' @format a tibble with 2 columns:
#'   \describe{
#'     \item{SOURCE RACE}{The one-letter code for this racial label}
#'     \item{Description}{The WI DPI's short description of this racial group .}
#'     \item{Race/Ethnicity}{The broad group for this subgroup in Racine, WI.}
#'   }
#' @source \url{https://dpi.wi.gov/wise/data-elements/race}
"RACE_MAPPING_DPI_STAFF"

#' Codes that identify race/ethnicity in PALS tables
#'
#' PALS is the Phonological Awareness and Literacy Screening. It
#' @format a tibble with 2 columns:
#'   \describe{
#'     \item{SOURCE RACE}{An integer code that corresponds to a race.}
#'     \item{Long Description}{PALS' verbose description of the racial category.}
#'     \item{Race/Ethnicity}{The broad group for this subgroup in Racine, WI.}
#'   }
#' @source \url{https://palsk8.com/PDF/data-columns/PALS-PreK\%20Data\%20Files\%20Column\%20Headings.pdf}
"RACE_MAPPING_PALS"

#' Codes that identify race/ethnicity in WISEDash tables
#'
#' WISEDash is the Wisconsin Department of Instruction's data portal. It has
#' its own set of racial categories that are similar to, but not identical to,
#' the U.S. Census Bureau's categories.
#' @format a tibble with 2 columns:
#'   \describe{
#'     \item{SOURCE RACE}{The name that WISEDash uses for this group}
#'     \item{Race/Ethnicity}{The broad group for this subgroup in Racine, WI.}
#'   }
#' @source \url{https://dpi.wi.gov/wise/data-elements/race}
"RACE_MAPPING_WISEDASH"

#' Codes that identify race/ethnicity in tables from Teaching Strategies Gold.
#'
#' Teaching Strategies LLC, which owns and publishes the GOLD child assessment
#' suite, has its own set of racial categories that are similar, but not
#' identical, to the U.S. Census Bureau's categories.
#' @format a tibble with 3 columns:
#'   \describe{
#'     \item{Race}{The name that Teaching Strategies uses for this group}
#'     \item{Ethnicity}{Teaching Strategies tracks Hispanic status with this field.}
#'     \item{Race/Ethnicity}{The broad group for this subgroup in Racine, WI.}
#'   }
#' @source \url{https://teachingstrategies.force.com/portal/s/article/What-are-the-ethnicity-and-race-selections-for-child-records}
"RACE_MAPPING_TSG"

#' Codes that identify the measures being described by a LAUS data series.
#'
#' The U.S. Bureau of Labor Statistics provides monthly reports about Local
#' Area Unemployment Statistics (LAUS). The measures that it reports are:
#' @format a tibble with 3 columns:
#'   \describe{
#'     \item{Code}{a two-digit character value between 03 and 09}
#'     \item{Measure}{a name for the measure}
#'     \item{Description}{a short summary of what the measure quantifies}
#'   }
#' @source \url{https://download.bls.gov/pub/time.series/la/la.measure}
"LAUS_MEASURE_MAP"
