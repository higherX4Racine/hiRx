# Standard options for creating a Higher Expectations vignette.

Standard options for creating a Higher Expectations vignette.

## Usage

``` r
CHUNK_OPTIONS_FOR_KNITR
```

## Format

a list with 8 elements

- \`collapse = TRUE\`:

  Try to put all of the source and output from each block into one code
  chunk.

- \`warning = FALSE\`:

  Don't show warning messages in the output.

- \`message = FALSE\`:

  Don't show informational messages in the output.

- \`comment = "#\>"\`:

  Text appended to every outputted line of code.

- \`cache = TRUE\`:

  Re-use calculations from chunks that have not changed.

- \`dpi = 96\`:

  Render the graphics in a web-friendly resolution.

- \`fig.dim = c(width = 7, height = 4)\`:

  Pleasing defaults for figure sizes.

- \`dev = c("png", "pdf")\`:

  Cache both \`png\` and \`pdf\` outputs, but use pngs in the vignette.

## Source

<https://yihui.org/knitr/options/>
