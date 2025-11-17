# Identify the indices of rows that will be labelled in a graph

Identify the indices of rows that will be labelled in a graph

## Usage

``` r
identify_indices(.x, .col, .focal_value, .peak_col = "Value")
```

## Arguments

- .x:

  \<obj\> the data frame to summarize

- .col:

  \<str\> the name of the column to find indices in.

- .focal_value:

  \<num\> a value to focus on (e.g. the year 2020)

- .peak_col:

  \<str\> the name of the column to search for its max. defaults to
  "Value"

## Value

a tibble with “Name“, “Index“, “X Offset“, and “Y Offset“

## Examples

``` r
racine_laus |>
    purrr::pluck("wisconsin") |>
    dplyr::mutate(Parsed = laus_parse_series(.data$Series)) |>
    tidyr::unnest("Parsed") |>
    dplyr::filter(.data$measure_code == 6L, Month == "January") |>
    identify_indices("Year", 2020)
#> # A tibble: 4 × 4
#>   Name       Index `X Offset` `Y Offset`
#>   <chr>      <int>      <dbl>      <dbl>
#> 1 first         20         -1         -1
#> 2 peak value    21          0          1
#> 3 2020 index    23          0          0
#> 4 final         21          1         -1
```
