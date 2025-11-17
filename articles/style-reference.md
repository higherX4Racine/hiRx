# Word Style Reference Document

``` r
library(hiRx)
```

## Style Reference

[RStudio](https://rstudio.com) uses the
[`bookdown`](https://bookdown.org) to render Word documents. The
developers of `bookdown` decided that the most effective way to manage
styling for Word documents was for the user to create a reference
document with customized styles. This document is an Rmarkdown
progenitor for just such a style reference document.

### Second-level Heading

#### Third-level Heading

##### Fourth-level Heading

``` r

ggplot2::ggplot() +
    ggplot2::geom_text(ggplot2::aes(x = 1,
                                    y = 1,
                                    label = "Hello, World")) +
    ggplot2::theme_void() +
    ggplot2::theme(text = ggplot2::element_text(family = "Myriad Pro"))
```

![A figure caption](style-reference_files/figure-html/a-figure-1.png)

A figure caption

A table

``` r

knitr::kable(tibble::tribble(
    ~ Foo, ~ Bar, ~ Baz,
    1, "a", TRUE,
    2, "b", FALSE,
    3, "c", NA
))
```

| Foo | Bar | Baz   |
|----:|:----|:------|
|   1 | a   | TRUE  |
|   2 | b   | FALSE |
|   3 | c   | NA    |
