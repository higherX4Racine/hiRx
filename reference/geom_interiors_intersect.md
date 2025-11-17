# Detect when geometries' interiors intersect.

This approach uses a custom intersection algorithm that only counts
areas as intersecting if their interiors overlap

## Usage

``` r
geom_interiors_intersect(x, y, ...)
```

## Arguments

- x:

  an object of class \`sf::sf\`, \`sf::sfc\` or \`sf::sfg\`

- y:

  an object of class \`sf::sf\`, \`sf::sfc\` or \`sf::sfg\`

- ...:

  other arguments that might be passed to \`sf::st_relate\`

## Value

either a matrix of \`logical\`s or a list of row indices

## See also

\`sf::st_relate\`
