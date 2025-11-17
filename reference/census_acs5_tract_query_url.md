# Create an API query URL for tract-level data from a 5-Year ACS

Create an API query URL for tract-level data from a 5-Year ACS

## Usage

``` r
census_acs5_tract_query_url(..., for_items = NULL, state = 55, county = 101)
```

## Arguments

- ...:

  \<\[\`dynamic dots\`\]\[rlang::dyn-dots\]\> named arguments to pass to
  [`census_api_url`](https://higherx4racine.github.io/hiRx/reference/census_api_url.md)

- for_items:

  the tracts to fetch data for. Defaults to eastern Racine County

- state:

  the state to fetch data for. Defaults to Wisconsin

- county:

  the county to fetch data for. Defaults to Racine

## Value

one URL for an API call

## Examples

``` r
census_acs5_tract_query_url(year = 2020,
                            variables = paste0("B25003_00", 1:3, "E"))
#> [1] "https://api.census.gov/data/2020/acs/acs5?get=B25003_001E,B25003_002E,B25003_003E&for=tract:001201,001400,001501,001502,001503,001601,001602,000903,000600,000700,000800,000901,000904,001001,001100,001202,001701,001702,001703,001704,000100,000200,000300,000400,000500,001002,001003,001301,001302,001504,001505,001705,001706,001401,001506,001507,001101,001102,001402,002900&in=state:55&in=county:101"
```
