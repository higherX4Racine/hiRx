# Codes that identify race/ethnicity in IPEDS demographics tables

The US Department of Education's Integrated Postsecondary Education
Database only loosely follows the OMB97 definitions of race and
ethnicity. This table maps from its categories to Higher Expectations'.

## Usage

``` r
RACE_MAPPING_IPEDS
```

## Format

a tibble with 2 columns:

- Race/Ethnicity:

  The broad group for this subgroup in Racine, WI.

- Population:

  The IPEDS label for this racial group.

## Source

<https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
