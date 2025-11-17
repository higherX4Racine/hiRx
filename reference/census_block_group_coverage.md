# Find the Percentage of each Covered Census Block Group inside a Geography

Find the Percentage of each Covered Census Block Group inside a
Geography

## Usage

``` r
census_block_group_coverage(blocks, containing_geo, group_id = "BLKGRPID")
```

## Arguments

- blocks:

  a simple features table with census block data

- containing_geo:

  a simple features table with one geography

- group_id:

  tidyselect description of the column with block group ids.

## Value

a tibble with values summarized by block group
