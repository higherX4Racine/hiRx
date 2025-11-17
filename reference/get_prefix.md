# Strip out the first several characters from a column

Strip out the first several characters from a column

## Usage

``` r
get_prefix(.x, .col, .len)
```

## Arguments

- .x:

  the input data frame

- .col:

  the character column to extract the prefix from

- .len:

  the length of the prefix

## Value

a new data frame with a column, “prefix“ inserted before “.col“

## Examples

``` r
hiRx:::get_prefix(
    tibble::tribble(~Text, "hello", "world"),
    Text,
    3
)
```
