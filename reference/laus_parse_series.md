# Separate a LAUS series code into its components

Separate a LAUS series code into its components

## Usage

``` r
laus_parse_series(.codes)
```

## Arguments

- .codes:

  character vector with series codes

## Value

a data frame with the following fields

- seasonal:

  'S' for seasonally-transformed data, 'U' otherwise

- area_prefix:

  a 2-character code describing a level of geographic organization

- srd_code:

  an integer holding a 2-digit FIPS code for a state, census region, or
  census division

- area_fips:

  an 11-character FIPS code for an intrastate area

- measure_code:

  an integer code for what the series measures.

## Examples

``` r
laus_parse_series(c(
    "LAUST290000000000009",
    "LAUCS233569500000005",
    "LAUMT542658000000003",
    "LAUCN170630000000005",
    "LAUCA392120000000004",
    "LAUCN210230000000003",
    "LAUCN190410000000006",
    "LAUCT134319200000005",
    "LAUMC554802000000004",
    "LAURD840000000000006"
))
```
