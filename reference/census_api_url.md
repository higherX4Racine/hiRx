# Create an API call to send to api.census.gov

Create an API call to send to api.census.gov

## Usage

``` r
census_api_url(
  variables,
  for_geo,
  for_items,
  survey_type,
  survey_or_table_code,
  year,
  ...
)
```

## Arguments

- variables:

  a vector of variables

- for_geo:

  a single geographic level, like "tract" or "block"

- for_items:

  the specific geographies, or "\*"

- survey_type:

  e.g. "acs" or "dec"

- survey_or_table_code:

  e.g. "acs5" or "pl"

- year:

  the year of the survey

- ...:

  \<\[\`dynamic dots\`\]\[rlang::dyn-dots\]\> other items to pass to the
  query

## Value

one URL, as a string

## Examples

``` r
census_api_url(paste0("B25003_00", 1:3, "E"),
              "tract",
              "*",
              "acs",
              "acs5",
              2020L,
              state = 55L,
              county = 101L)
#> [1] "https://api.census.gov/data/2020/acs/acs5?get=B25003_001E,B25003_002E,B25003_003E&for=tract:*&in=state:55&in=county:101"

census_api_url(paste0("P1_00", c(1, 3, 4), "N"),
              "tract",
              "*",
              "dec",
              "pl",
              2020L,
              state = 55L,
              county = 101L)
#> [1] "https://api.census.gov/data/2020/dec/pl?get=P1_001N,P1_003N,P1_004N&for=tract:*&in=state:55&in=county:101"
```
