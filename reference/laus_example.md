# Some Example Local Area Unemployment Statistics Data Series

A table of LAUS series from four places: Nashua, NH; Minneapolis, MN;
Ithaca, NY, and Racine WI. There are four kinds of data: Unemployment
Rate, Unemployed People, Employed People, and Labor Force. These data
are all not adjusted for seasonality.

## Usage

``` r
laus_example
```

## Format

This table demonstrates what raw series data look like when downloaded
from the BLS's plain-text data archives, as described in
`vignette("laus", package = "hiRx")`.

- series_id:

  a 20-character BLS series code

- year:

  an integer giving the year of the observation

- period:

  a 3-character code, either the month or annual mean.

- value:

  a real number that is either people or a percentage.

- footnote_codes:

  a one-character flag if the observation is weird.

## Source

<https://download.bls.gov/pub/time.series/la/>
