# Print each element of a vector on a new line, with commas

Print each element of a vector on a new line, with commas

## Usage

``` r
print_array_as_column(.array, .sep = ",", .quote = "\"")
```

## Arguments

- .array:

  \<any\>, a vector of values, probably string, but could be anything.

- .sep:

  \<chr\>, optional, Delimiter to print before each new line. The
  default is a comma.

- .quote:

  \<chr\>, optional, Character to wrap each item in. The default is a
  double quote.

## Value

Nothing, this function is side-effect only.

## Examples

``` r
library(hiRx)
print_array_as_column(c("foo", "bar", "baz"))
#> "foo",
#> "bar",
#> "baz"
```
