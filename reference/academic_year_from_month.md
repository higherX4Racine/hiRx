# Compute the year in an academic year from a month

Compute the year in an academic year from a month

## Usage

``` r
academic_year_from_month(months, ending_year, starting_month = 8L)
```

## Arguments

- months:

  \<int\> the months to find the years for

- ending_year:

  \<int\> the calendar year when the academic year ends.

- starting_month:

  \<int, optional\> the first month of the academic year defaults to
  August.

## Value

\<int\> a vector of years suitable for use in e.g.
\[lubridate::make_date()\]

## Examples

``` r
academic_year_from_month(1:12, 2024, 9)
#>  [1] 2024 2024 2024 2024 2024 2024 2024 2024 2023 2023 2023 2023
```
