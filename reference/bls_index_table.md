# Download information about the subtables in a BLS data tree

Download information about the subtables in a BLS data tree

## Usage

``` r
bls_index_table(table_path)
```

## Arguments

- table_path:

  the path to the index file, e.g. "pub/time.series/la"

## Value

a data frame with the following fields

- Upload:

  the timestamp of when the table was last changed.

- Bytes:

  the size of the table, in bytes

- Table:

  the name of the table

- Index:

  the index of the table, if it contains data

- Place:

  more detail about what the table's data describe
