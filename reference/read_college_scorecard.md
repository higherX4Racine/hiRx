# Import data downloaded from the National College Scorecard

The U.S. Department of Education maintains a database of information
about institutions of higher education. You can download big Excel files
from <https://collegescorecard.ed.gov/data/>.

## Usage

``` r
read_college_scorecard(.path, .spec = hiRx::US_ED_COLLEGE_SCORECARD_SPEC)
```

## Arguments

- .path:

  the full path to the file

- .spec:

  a \`readr::cols\` specification, defaults to institutional graduation
  rates.

## Value

a data frame / tibble with a lot of juicy detail about enrollment
