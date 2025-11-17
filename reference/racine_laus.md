# Local Area Unemployment Data Series for Racine, Wisconsin

A list of LAUS time series for three local areas: the state of Wisconsin
and the County and City of Racine, WI. There are four time series for
each area: Employment, Labor Force, Unemployment, and Unemployment Rate.

## Usage

``` r
racine_laus
```

## Format

A list of three data frames, each of which have 6 variables:

- Geography:

  a 15-character FIPS-like geocode.

- Measure:

  an enum from the Python package “herc.bls.laus“.

- Series:

  a 20-char. BLS code concatenating “Geography“ and “Measure“.

- Year:

  the four-digit year of the series

- Month:

  an ordered factor with full month names in English.

- Value:

  the value of the measure for the area and date.

## Source

<https://api.bls.gov/publicAPI/v2/timeseries/data/>
