# Get tab-delimited data from download.bls.gov/pub/time.series/la

Get tab-delimited data from download.bls.gov/pub/time.series/la

## Usage

``` r
laus_fetch_table(table_name, column_specification)
```

## Arguments

- table_name:

  a string that identifies the table to find

- column_specification:

  a readr::cols object defining the table's fields.

## Value

a data frame with fields defined by `column_specification`
