# Scrape the Minneapolis Federal Reserve's Consumer Price Index page.

The Minneapolis fed
\[hosts\]("https://www.minneapolisfed.org/about-us/monetary-policy/inflation-calculator/consumer-price-index-1913-")
an html table that reports the annual national Consumer Price Index.

## Usage

``` r
pull_mn_fed_cpi()
```

## Value

a tibble with 3 columns: year, CPI, and
