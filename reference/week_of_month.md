# Compute week numbers of dates for making calendars

Compute week numbers of dates for making calendars

## Usage

``` r
week_of_month(.days, .wdays = NULL)
```

## Arguments

- .days:

  \`\<int\|Date\>\` days of the month or dates

- .wdays:

  \`\<int?\>\` weekdays (Sunday == 1), required when \`.days\` is an
  integer

## Value

\`\<int\>\` row numbers (starting at 1) for plotting a calendar

## Examples

``` r
week_of_month(lubridate::ymd(c("2026-01-01", "2026-02-01", "2026-03-01")))
#> [1] 1 1 1
```
