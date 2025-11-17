# Horizontal bar plots colored by race/ethnicity showing percentages

Horizontal bar plots colored by race/ethnicity showing percentages

## Usage

``` r
plot_percent_by_race(
  .x,
  response,
  label,
  .race_ethnicity = "Race/Ethnicity",
  .text_size = 4
)
```

## Arguments

- .x:

  the data, including a "Race/Ethnicity" variable

- response:

  the percentage-valued response variable

- label:

  a horizontal axis label for the plot

- .race_ethnicity, :

  optional, defaults to "Race/Ethnicity"

- .text_size, :

  optional, defaults to 4

## Value

a graphical object to chain with other ggplot2 items.
