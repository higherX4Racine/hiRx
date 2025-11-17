# Vectorized Creation of Census ACS Variables

All detail table variables have the format "B000OOX_000E", where the "B"
and "E" are literal and the "X" is a race code.

## Usage

``` r
census_build_acs_variable(table_code, race_code, item_number)
```

## Arguments

- table_code:

  the table code, like "B18101"

- race_code:

  either an empty string or one of \\A..I\\

- item_number:

  some integer between 0 and 999

## Value

a vector of strings, each of which is a variable name

## Examples

``` r
tables <- c("B19013", "B18101", "B18101")
races <- c("", "", "I")
numbers <- 1
census_build_acs_variable(tables, races, numbers)
#> [1] "B19013_001E"  "B18101_001E"  "B18101I_001E"
```
