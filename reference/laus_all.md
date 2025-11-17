# Download a huge table of LAUS observations

Download a huge table of LAUS observations

## Usage

``` r
laus_all(.laus_tables)
```

## Arguments

- .laus_tables:

  a table from calling
  [`laus_fetch_table`](https://higherx4racine.github.io/hiRx/reference/laus_fetch_table.md).

## Value

A tibble that will have more than a million observations. Its columns
are:

- series:

  a 20-character code, e.g. "LAUCT556600000000003"

- date:

  always the first day of the observation's month

- value:

  a double-precision numeric value

- footnote_codes:

  a one-character code indicating caveats

The `series` field tracks where the data are from and what they are.
