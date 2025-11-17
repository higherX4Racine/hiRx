# Codes that identify race/ethnicity in COVID data from the WI DHS

DHS is Wisconsin's Department of Health Services. It has its own set of
racial categories that are similar to, but not identical to, the U.S.
Census Bureau's categories. Crucially, it does not have a "white,
non-Hispanic" racial category. Strictly speaking, that means that
Ethnicity and Race should be two separate variables when dealing with
these data.

## Usage

``` r
RACE_MAPPING_WI_DHS
```

## Format

a tibble with 2 columns:

- SOURCE RACE:

  The name that the WI DHS uses for this group

- Race/Ethnicity:

  The broad group for this subgroup in Racine, WI.

## Source

<https://data.dhsgis.wi.gov/>
