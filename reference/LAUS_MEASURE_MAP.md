# Codes that identify the measures being described by a LAUS data series.

The U.S. Bureau of Labor Statistics provides monthly reports about Local
Area Unemployment Statistics (LAUS). The measures that it reports are:

## Usage

``` r
LAUS_MEASURE_MAP
```

## Format

a tibble with 3 columns:

- Code:

  a two-digit character value between 03 and 09

- Measure:

  a name for the measure

- Description:

  a short summary of what the measure quantifies

## Source

<https://download.bls.gov/pub/time.series/la/la.measure>
