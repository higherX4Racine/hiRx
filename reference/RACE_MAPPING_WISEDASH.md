# Codes that identify race/ethnicity in WISEDash tables

WISEDash is the Wisconsin Department of Instruction's data portal. It
has its own set of racial categories that are similar to, but not
identical to, the U.S. Census Bureau's categories.

## Usage

``` r
RACE_MAPPING_WISEDASH
```

## Format

a tibble with 2 columns:

- SOURCE RACE:

  The name that WISEDash uses for this group

- Race/Ethnicity:

  The broad group for this subgroup in Racine, WI.

## Source

<https://dpi.wi.gov/wise/data-elements/race>
