# collect shapefiles from TIGER/Line that are from different years.

collect shapefiles from TIGER/Line that are from different years.

## Usage

``` r
census_tigershapes_combine(file_names, shapefile_path, ...)
```

## Arguments

- file_names:

  A named vector or list of shapefiles

- shapefile_path:

  The full path to the folder that contains the files

- ...:

  Arguments that \`dplyr::filter\` will use on the files' features.

## Value

an \`sf::sf\` object, a data frame of features with a geometry column
