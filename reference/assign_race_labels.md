# Convert the race labels from a data source to Racine race labels

Convert the race labels from a data source to Racine race labels

## Usage

``` r
assign_race_labels(
  .x,
  mapping,
  ...,
  target_name = "Race/Ethnicity",
  .levels = hiRx::RACE_LABELS_RACINE
)
```

## Arguments

- .x:

  a data frame with a column of race labels

- mapping:

  a data frame that relates the source's labels to Racine's

- ...:

  values for the \`by\` argument of an \`inner_join\` between \`.x\` and
  \`mapping\`

- target_name:

  optional, defaults to "Race/Ethnicity".

- .levels:

  optional, the new levels for the Race/Ethnicity factor.

## Value

a new data frame with a factor, \`Race/Ethnicity\`, of Racine races.
