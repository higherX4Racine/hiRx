# Create a table of estimates for specific levels of a main effect

This function is a wrapper for using \[emmeans::emmeans()\] to examine
just the levels of one main effect from a more complicated model. It
relabels some of the columns for easier use in visualizations.

## Usage

``` r
emmean_main_effects(.obj, .field)
```

## Arguments

- .obj:

  \`\<obj\>\` a model or \[emmeans::emmGrid\] object to analyze

- .field:

  \`\<chr\>\` the name of the main effect to analyze

## Value

\`\<tbl\>\` a data frame with as many rows as there are levels of
\`.field\` and eight columns

- \`.field\`:

  \`\<chr\>\` the levels of the main effect

- emmean:

  \`\<dbl\>\` the marginal mean for that level of the effect

- SE:

  \`\<dbl\>\` the standard error of the marginal mean

- df:

  \`\<int\>\` the estimated degrees of freedom for the t test

- lower.CL:

  \`\<dbl\>\` the lower bound of the 95% confidence interval

- upper.CL:

  \`\<dbl\>\` the upper bound of the 95% confidence interval

- \`\$t\_{df}\$\`:

  \`\<dbl\>\` the t statistic for this estimate, with df in the name.

- \`\$p\$-value\`:

  \`\<dbl\>\` the p-value of the t test for this effect

## See also

\[emmeans::emmeans()\]
