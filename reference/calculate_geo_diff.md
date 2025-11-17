# Calculate differences across times between two areas for one measure

Calculate differences across times between two areas for one measure

## Usage

``` r
calculate_geo_diff(.x, .focal_geo, .comp_geo, .measure)
```

## Arguments

- .x:

  a tibble of LAUS data

- .focal_geo:

  the area whose value is on the left side of the subtraction

- .comp_geo:

  the area whose value is on the right side

- .measure:

  the measure to compare between areas

## Value

a tibble with a new Measure, “"{.measure} Difference"“
