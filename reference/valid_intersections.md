# Only report intersections with valid geometries

Only report intersections with valid geometries

## Usage

``` r
valid_intersections(geos_of_interest, reference_geo)
```

## Arguments

- geos_of_interest:

  a collection of \`sf::sf\`-like objects

- reference_geo:

  a single \`sf::sf\` object

## Value

a collection of new, valid \`sf::sf\` objects

## See also

- \`sf::st_intersection\`:

  the function for computing the intersections

- \`sf::st_make_valid\`:

  the function that repairs the new geometries
