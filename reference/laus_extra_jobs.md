# The number of jobs that would make the two areas' unemployment rates equal.

The number of jobs that would make the two areas' unemployment rates
equal.

## Usage

``` r
laus_extra_jobs(.x, .focal_geo, .comp_geo, .result_name = "Additional Jobs")
```

## Arguments

- .x:

  the tibble with LAUS data

- .focal_geo:

  the area whose number of jobs would be changed.

- .comp_geo:

  the area whose employment rate is the baseline.

- .result_name:

  optional, the name for the new column

## Value

a tibble with a new category of Measure, "Additional Jobs"
