# Percentages within groups where different inputs have different weights

This definitely requires explanation, but an example should make it
clear. The motivation of this function is to compute the percentage of
people within a municipality that have a certain demographic
characteristic. The catch is that the data are not reported by
municipality, but by census tract, and census tract boundaries don't
match the boundaries of the municipalities. So, to compute the
percentage of people who have health insurance in Racine, WI, we need to
count the number of people in each census tract that overlaps with
Racine, weight the tracts by how much of their populations are actually
within the city's borders, and then find the weighted percent with
insurance by dividing the weighted sum of people with insurance by the
weighted sum of all people.

## Usage

``` r
grouped_weighted_percentage(
  .x,
  groups,
  in_value_field,
  all_value_field,
  in_weight_field,
  all_weight_field
)
```

## Arguments

- .x:

  a tibble of data

- groups:

  a vector of strings that name grouping variables

- in_value_field:

  the field with counts of in-group members

- all_value_field:

  the field with counts of all items

- in_weight_field:

  the field with weights for in-group members

- all_weight_field:

  the field with weights for all items

## Value

a tibble with weighted percents per group

## Examples

``` r
toy_data <- tibble::tribble(
    ~ City, ~ Tract, ~ Insured, ~ All, ~ `City Pop`, ~ `Tract Pop`,
    "Foo",  "A",     10L,       10L,      0L,          99L,
    "Bar",  "A",     10L,       10L,     22L,          99L,
    "Foo",  "B",     25L,       42L,   1200L,        1900L,
    "Bar",  "B",     25L,       42L,    700L,        1900L
)
grouped_weighted_percentage(toy_data,
                            groups = "City",
                            in_value_field = "Insured",
                            all_value_field = "All",
                            in_weight_field = "City Pop",
                            all_weight_field = "Tract Pop")
#> # A tibble: 2 × 4
#>   City  Insured   All `Percent Insured`
#>   <chr>   <dbl> <dbl>             <dbl>
#> 1 Bar      11.4  17.7             0.646
#> 2 Foo      15.8  26.5             0.595
```
