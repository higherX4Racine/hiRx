# Consolidate racial categories from the Census's to Higher Expectations'

Consolidate racial categories from the Census's to Higher Expectations'

## Usage

``` r
census_collapse_races(
  .x,
  .census_label_field = "Census Race",
  .value_field = "Population",
  .summary_f = sum
)
```

## Arguments

- .x:

  a tibble with information grouped by Census race categories.

- .census_label_field:

  the name of the field with Census race in it. Defaults to "Census
  Race"

- .value_field:

  the name of the field with numeric data. Defaults to "Population"

- .summary_f:

  the function to consolidate values with. Defaults to \`sum\`.

## Value

a tibble with Higher Expectations' race groups instead of the Census's.
