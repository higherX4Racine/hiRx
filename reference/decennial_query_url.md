# Create an API query URL for a table from a decennial US Census

Create an API query URL for a table from a decennial US Census

## Usage

``` r
decennial_query_url(summary_table, ...)
```

## Arguments

- summary_table:

  the code for a summary table from a decennial census

- ...:

  \<\[\`dynamic dots\`\]\[rlang::dyn-dots\]\> named arguments to pass to
  [`census_api_url`](https://higherx4racine.github.io/hiRx/reference/census_api_url.md)

## Value

one URL for an API call

## Examples

``` r
hiRx::decennial_query_url(variables = paste0("P1_00", c(1, 3, 4), "N"),
                          summary_table = "pl",
                          year = 2020,
                          for_geo = "tract",
                          for_items = "*",
                          state = 55,
                          county = 101)
#> [1] "https://api.census.gov/data/2020/dec/pl?get=P1_001N,P1_003N,P1_004N&for=tract:*&in=state:55&in=county:101"
```
