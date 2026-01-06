# Look up a Higher Expectations color palette by name

Look up a Higher Expectations color palette by name

## Usage

``` r
higher_ex_pal(palette = "main", reverse = FALSE, n.colors = NULL, ...)
```

## Arguments

- palette:

  the name of the palette, defaults to "main"

- reverse:

  should the palette's order be reversed, defaults to FALSE

- n.colors:

  choose this to limit the number of colors in the palette, defaults to
  NULL for all of the palette's colors

- ...:

  further arguments to pass to \`grDevices::colorRampPalette\`

## Value

a color palette object for use in, e.g., ggplot The available palettes
are

- main:

  Five colors from the branding document

- blues:

  Three shades of blue, light to dark

- econ:

  Two shades of orange

- logo:

  Gray, Gold, and White

- race:

  Four colors for Racine's empirical census races

- inverse:

  The reverse of \`logo\`

- tableau:

  The first four default colors from Tableau

- navy gradient:

  Navy, the intermediate green, and Gold

- bright gradient:

  Bright Blue, the intermediate green, and Gold

- medium gradient:

  Medium Blue, the intermediate green, and Gold

## Examples

``` r
higher_ex_pal("blues")
#> function (n) 
#> {
#>     x <- ramp(seq.int(0, 1, length.out = n))
#>     if (ncol(x) == 4L) 
#>         rgb(x[, 1L], x[, 2L], x[, 3L], x[, 4L], maxColorValue = 255)
#>     else rgb(x[, 1L], x[, 2L], x[, 3L], maxColorValue = 255)
#> }
#> <bytecode: 0x55d40a0fbf28>
#> <environment: 0x55d40a0f9978>
```
