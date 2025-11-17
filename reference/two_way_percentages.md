# Compute the percentage of some total found in two margins

Compute the percentage of some total found in two margins

## Usage

``` r
two_way_percentages(.df, .by, .across, .weights)
```

## Arguments

- .df:

  a data frame with counts and categories

- .by:

  the category that will stay as a factor column

- .across:

  the category that will become columns

- .weights:

  the column that counts individuals

## Value

a table with rows determined by .by and columns by .across
