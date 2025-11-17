# Construct the query part of the URL for a call to the US Census API

Construct the query part of the URL for a call to the US Census API

## Usage

``` r
census_api_query(variables, for_geo, for_items, ...)
```

## Arguments

- variables:

  a vector of strings with variable codes

- for_geo:

  the geographic level of detail that you want

- for_items:

  the specific geographic entities that you want

- ...:

  other key-value pairs to pass to the query

## Value

a string with the query part of a Census API call

## Examples

``` r
census_api_query(paste0("B25003_00", 1:3, "E"),
                 "tract",
                 "*",
                 state = 55L,
                 county = 101L)
#> [1] "B25003_001E,B25003_002E,B25003_003E&for=tract:*&in=state:55&in=county:101"

census_api_query(paste0("P1_00", c(1, 3, 4), "N"),
                 "block%20group",
                 "*",
                 state = 55L,
                 county = 101L)
#> [1] "P1_001N,P1_003N,P1_004N&for=block%20group:*&in=state:55&in=county:101"
```
