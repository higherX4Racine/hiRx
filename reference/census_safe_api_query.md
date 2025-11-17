# Split a census query into fewer than 50 variables per query

The census API complains if you have more than 50 variables per query.

## Usage

``` r
census_safe_api_query(.x, max_per_query = 40, ...)
```

## Arguments

- .x:

  a tibble with a column called "Variable"

- max_per_query:

  defaults to 40

- ...:

  other arguments for "hiRx::census_api_url"

## Value

a list of JSON-formatted census replies.
