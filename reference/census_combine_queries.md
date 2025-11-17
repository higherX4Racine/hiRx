# Title

Title

## Usage

``` r
census_combine_queries(
  .l,
  metadata,
  .field_name = "Variable",
  .value_name = "Population",
  .index_name = "Index"
)
```

## Arguments

- .l:

  a list of JSON-formatted API query responses

- metadata:

  a tibble with details about each field in the query

- .field_name:

  the column that identifies fields. Defaults to "Variable".

- .value_name:

  the column that reports measures. Defaults to "Population".

- .index_name:

  the column that indicates a fields' place in a table. Defaults to
  "Index".

## Value

a tibble of Census data with Higher Expectations factor names.
