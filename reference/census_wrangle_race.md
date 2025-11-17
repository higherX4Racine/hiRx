# Condense and relabel racial and ethnic factors

Condense and relabel racial and ethnic factors

## Usage

``` r
census_wrangle_race(
  .x,
  race_tibble,
  ...,
  .code_field = "Code",
  .name_field = "Name",
  .val_field = "Population"
)
```

## Arguments

- .x:

  a tibble with Census data that is organized by race

- race_tibble:

  a tibble that defines condensed racial/ethnic factors

- ...:

  \<\[\`dynamic-dots\`\]\[rlang::dyn-dots\]\> ignored

- .code_field:

  defaults to "Code"

- .name_field:

  defaults to "Name"

- .val_field:

  defaults to "Population"

## Value

a tibble with better factor values
