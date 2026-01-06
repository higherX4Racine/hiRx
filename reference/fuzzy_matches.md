# Find edit distances between pairwise combinations of two sets of text

The specific kind of edit distance depends upon the extra arguments,
which get passed on to \[utils::adist()\]. This is really syntactic
sugar for converting the matrix that \[utils::adist()\] creates into a
long tibble.

## Usage

``` r
fuzzy_matches(.lhs, .rhs, ...)
```

## Arguments

- .lhs:

  \`\<chr\>\` the first set of text values to fuzzy match

- .rhs:

  \`\<chr\>\` the second set

- ...:

  Arguments passed on to
  [`utils::adist`](https://rdrr.io/r/utils/adist.html)

  `costs`

  :   a numeric vector or list with names partially matching
      `insertions`, `deletions` and `substitutions` giving the
      respective costs for computing the Levenshtein distance, or `NULL`
      (default) indicating using unit cost for all three possible
      transformations.

  `counts`

  :   a logical indicating whether to optionally return the
      transformation counts (numbers of insertions, deletions and
      substitutions) as the `"counts"` attribute of the return value.

  `fixed`

  :   a logical. If `TRUE` (default), the `x` elements are used as
      string literals. Otherwise, they are taken as regular expressions
      and `partial = TRUE` is implied (corresponding to the approximate
      string distance used by
      [`agrep`](https://rdrr.io/r/base/agrep.html) with
      `fixed = FALSE`).

  `partial`

  :   a logical indicating whether the transformed `x` elements must
      exactly match the complete `y` elements, or only substrings of
      these. The latter corresponds to the approximate string distance
      used by [`agrep`](https://rdrr.io/r/base/agrep.html) (by default).

  `ignore.case`

  :   a logical. If `TRUE`, case is ignored for computing the distances.

  `useBytes`

  :   a logical. If `TRUE` distance computations are done byte-by-byte
      rather than character-by-character.

## Value

an object of class \`tbl_df/tbl/data.frame\` with \`length(.lhs)\`
\\\times\\ \`length(.rhs)\` rows and 3 columns:

- LHS:

  \`\<chr\>\` each value of \`.lhs\`, repeated \`len(.rhs)\` times

- RHS:

  \`\<chr\>\` each value of \`.rhs\`, repeated \`len(.lhs)\` times

- Distance:

  \`\<dbl\>\` the edit distance between the strings.

## Examples

``` r
fuzzy_matches(c("Foo", "Bar", "Baz"),
              c("Aleph", "Bab", "Jeen", "Dal"))
#> # A tibble: 12 × 3
#>    LHS   RHS   Distance
#>    <chr> <chr>    <dbl>
#>  1 Foo   Aleph        5
#>  2 Foo   Bab          3
#>  3 Foo   Jeen         4
#>  4 Foo   Dal          3
#>  5 Bar   Aleph        5
#>  6 Bar   Bab          1
#>  7 Bar   Jeen         4
#>  8 Bar   Dal          2
#>  9 Baz   Aleph        5
#> 10 Baz   Bab          1
#> 11 Baz   Jeen         4
#> 12 Baz   Dal          2
fuzzy_matches(c("Foo", "Bar", "Baz"),
              c("Aleph", "Bab", "Jeen", "Dal"),
              fixed = FALSE, ignore.case = TRUE)
#> # A tibble: 12 × 3
#>    LHS   RHS   Distance
#>    <chr> <chr>    <dbl>
#>  1 Foo   Aleph        3
#>  2 Foo   Bab          3
#>  3 Foo   Jeen         3
#>  4 Foo   Dal          3
#>  5 Bar   Aleph        2
#>  6 Bar   Bab          1
#>  7 Bar   Jeen         3
#>  8 Bar   Dal          2
#>  9 Baz   Aleph        2
#> 10 Baz   Bab          1
#> 11 Baz   Jeen         3
#> 12 Baz   Dal          2
```
