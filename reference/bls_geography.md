# Get the BLS string for a specific geographical area

Get the BLS string for a specific geographical area

## Usage

``` r
bls_geography(area_type, state_or_region, area = NULL)
```

## Arguments

- area_type:

  one of several types of area, see notes.

- state_or_region:

  the FIPS code of a state or region

- area:

  the FIPS code of the sub-region, NULL if unnecessary.

## Value

a 15-digit geocode
