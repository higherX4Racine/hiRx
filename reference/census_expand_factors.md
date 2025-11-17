# Create a table of census variables from factors and row offsets

Create a table of census variables from factors and row offsets

## Usage

``` r
census_expand_factors(..., .offset_field = "offset")
```

## Arguments

- ...:

  \<\[\`dynamic-dots\`\]\[rlang::dyn-dots\]\> data frames with factors
  and offsets

- .offset_field:

  the variable that gives row offsets, defaults to "offset"

## Value

a table of census variables with their associated factors and rows
