# Fetch JSON-formatted data from the US Census API

Fetch JSON-formatted data from the US Census API

## Usage

``` r
census_do_api_query(url, .api_key = NULL)
```

## Arguments

- url:

  a fully-formed API call in URL form

- .api_key:

  an API key

## Value

a list of lists, one row per geo, one entry per variable
