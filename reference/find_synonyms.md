# Look up the root item that corresponds to each item's synonym

Look up the root item that corresponds to each item's synonym

## Usage

``` r
find_synonyms(.x, key_col = "PrimaryKey", syn_col = "Synonym")
```

## Arguments

- .x:

  a data frame with primary keys and self-referential synonyms

- key_col:

  the column that contains the primary keys

- syn_col:

  the column that contains self-referential keys

## Value

a vector of primary keys

## Examples

``` r
discrete_example <- tibble::tribble(
~ PrimaryKey, ~ Dimension, ~ Order, ~ Label, ~ Synonym,
1L, 1L, 1L, "A", NA,
2L, 1L, 2L, "B", NA,
3L, 1L, 3L, "C", NA,
4L, 1L, NA, "Alpha", 1L,
5L, 1L, NA, "Beta", 2L,
6L, 1L, NA, "Gamma", 3L,
7L, 1L, NA, "\u03B1", 4L
)
synonyms <- find_synonyms(discrete_example)
dplyr::slice(discrete_example, synonyms)
#> # A tibble: 7 × 5
#>   PrimaryKey Dimension Order Label Synonym
#>        <int>     <int> <int> <chr>   <int>
#> 1          1         1     1 A          NA
#> 2          2         1     2 B          NA
#> 3          3         1     3 C          NA
#> 4          1         1     1 A          NA
#> 5          2         1     2 B          NA
#> 6          3         1     3 C          NA
#> 7          1         1     1 A          NA
```
