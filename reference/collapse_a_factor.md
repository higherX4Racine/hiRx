# Summarize all of the values of a category

Summarize all of the values of a category

## Usage

``` r
collapse_a_factor(
  .x,
  group_to_collapse,
  values_to_summarize,
  collapsed_label,
  .summary_f = sum,
  ...
)
```

## Arguments

- .x:

  a tibble

- group_to_collapse:

  the name of the field whose categories will be collapsed

- values_to_summarize:

  the name(s) of the fields with values to summarize

- collapsed_label:

  the name of the new, collapsed category

- .summary_f:

  the summary function, defaults to \`sum\`

- ...:

  further arguments for \`.summary_f\`, e.g. \`na.rm = TRUE\`.

## Value

a new summary tibble
