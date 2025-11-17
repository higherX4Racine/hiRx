# Aggregate variables over all races/ethnicities

Aggregate variables over all races/ethnicities

## Usage

``` r
aggregate_over_races(.x, ..., .f = sum, .all_races_label = "All")
```

## Arguments

- .x:

  a tibble with variables by race but no all-race totals

- ...:

  \<\[\`dynamic dots\`\]\[rlang::dyn-dots\]\> The variables to
  aggregate.

- .f:

  the function to aggregate with, defaults to `sum`.

- .all_races_label:

  the level for all races. defaults to "All"

## Value

a tibble with values aggregated over all races
