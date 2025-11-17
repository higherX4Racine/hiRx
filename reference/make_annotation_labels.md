# Create a column of formatted labels from one of disparate numeric values.

This function looks in a character column for a regex that indicates
whether a row is a percentage or a whole number. It then prettily
formats the contents of a numeric column as either a percentage or a
comma-separated int.

## Usage

``` r
make_annotation_labels(.x, .rate_key = "Rate")
```

## Arguments

- .x:

  a tibble with fields “Measure“ and “Value“.

- .rate_key:

  a string in the Measure name that indicates a percentage

## Value

a tibble with a new column, “Label“, that is formatted.

## Examples

``` r
make_annotation_labels(
    tibble::tribble(~Measure, ~Value,
                     "R",      0.5,
                     "K",      1000,
                     "A",      42),
    "R"
)
#> # A tibble: 3 × 3
#>   Measure  Value Label
#>   <chr>    <dbl> <chr>
#> 1 R          0.5 50%  
#> 2 K       1000   1,000
#> 3 A         42   42   
```
