# Convert lists of JSON-formatted census data to tidy tables.

Convert lists of JSON-formatted census data to tidy tables.

## Usage

``` r
census_wrangle_lists_of_raw_json(
  .x,
  variable_tibble,
  .varname = "Variable",
  .indexname = "Index",
  ...
)
```

## Arguments

- .x:

  a list of lists of json output from a query to the Census API

- variable_tibble:

  a tibble that connects census variables to factor information and row
  indices

- .varname:

  the name of the field that holds Census variable codes

- .indexname:

  the name of the field that holds row indices

- ...:

  \<\[\`dynamic-dots\`\]\[rlang::dyn-dots\]\> other inputs to
  [`census_json_to_tibble`](https://higherx4racine.github.io/hiRx/reference/census_json_to_tibble.md)

## Value

a tibble with factor variables and observed values

## See also

[`census_expand_factors`](https://higherx4racine.github.io/hiRx/reference/census_expand_factors.md)
[`census_json_to_tibble`](https://higherx4racine.github.io/hiRx/reference/census_json_to_tibble.md)
