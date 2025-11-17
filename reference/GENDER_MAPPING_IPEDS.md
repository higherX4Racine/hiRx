# Codes that identify gender in IPEDS demographics tables

Recent files in the US Department of Education's Integrated
Postsecondary Education Database may track a number of different gender
identities. This table oversimplifies them into "Female" and
"Non-female" to protect the identities of Racine people with uncommon
gender identities.

## Usage

``` r
GENDER_MAPPING_IPEDS
```

## Format

a tibble with 2 columns:

- Gender:

  The IPEDS label for this gender identity.

- Sex:

  A binary label for this set of identities in Racine, WI.

## Source

<https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
