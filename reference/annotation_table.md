# Create a data frame for putting labels on a graph.

Create a data frame for putting labels on a graph.

## Usage

``` r
annotation_table(.x, .col, .focal_value, .group_col)
```

## Arguments

- .x:

  \<obj\> the data frame to summarize

- .col:

  \<str\> the name of the column to find indices in.

- .focal_value:

  \<num\> a value to focus on (e.g. the year 2020)

- .group_col:

  \<str\> the name of the variable to find indices within

## Value

a data frame with fields “Name“, “Measure“, “Value“, and “Label“

## Examples

``` r
racine_laus |>
    purrr::pluck("wisconsin") |>
    dplyr::mutate(Parsed = list(laus_parse_series(.data$Series))) |>
    tidyr::unnest("Parsed") |>
    dplyr::select("measure_code", "Year", "Month", "Value") |>
    dplyr::filter(.data$Month == "January") |>
    annotation_table("Year", 2020, "measure_code")
#> # A tibble: 6,192 × 4
#>    measure_code  Year Month     Value
#>           <int> <dbl> <fct>     <dbl>
#>  1            5  2020 January 2981617
#>  2            5  2020 January 2981617
#>  3            5  2020 January 2981617
#>  4            5  2020 January 2981617
#>  5            5  2020 January 2981617
#>  6            5  2020 January 2981617
#>  7            5  2020 January 2981617
#>  8            5  2020 January 2981617
#>  9            5  2020 January 2981617
#> 10            5  2020 January 2981617
#> # ℹ 6,182 more rows
```
