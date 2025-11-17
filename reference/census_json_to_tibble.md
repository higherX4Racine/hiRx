# Wrangle Census Table JSON

Wrangle Census Table JSON

## Usage

``` r
census_json_to_tibble(
  jsonlist,
  variable_names,
  .val_trans_f = readr::parse_integer,
  .value_column = "Population"
)
```

## Arguments

- jsonlist:

  a list of lists from fetching Census data in JSON format

- variable_names:

  the census API codes for variables

- .val_trans_f:

  a function for converting variable values to numbers

- .value_column:

  the name of the numeric column in the new table

## Value

a tibble with fields for geographies, variable name, and value
