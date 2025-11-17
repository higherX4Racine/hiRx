# Populations of Different Races in Census Tracts and Places in Racine, WI

The smallest unit of area that the ACS 5-year survey reports in is the
census tract. No one actually cares about what happens in a census tract
in and of itself, though. County subdivisions, on the other hand, are
actual places like towns, villages, or cities. Those, we care about.
This is a tibble of the populations of three racial/ethnic groups of
Racine County, WI within census tracts and county subdivisions.

## Usage

``` r
racine_race_pop_weights_by_tract
```

## Format

a tibble with 6 columns:

- Year:

  four-digit integer

- Municipality:

  each county subdivision's NAME field.

- tract:

  the six-digit code of the tract within Racine County

- Race/Ethnicity:

  "Black", "Latin@", "White", or "All Other Races"

- Municipal Population:

  people who live in the tract and Municipality

- Tract Population:

  people in this race who live anywhere in the tract.

## Source

<https://api.census.gov>
