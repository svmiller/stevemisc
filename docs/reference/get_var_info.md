# Get a small data frame of the variable label and values.

`get_var_info()` allows you to peek at your labelled data, extracting a
given column's variable labels. The intended use here is mostly
"peeking" for the purpose of recoding column's in the absence of a
codebook or other form of documentation. `gvi()` is a shortcut for this
function.

## Usage

``` r
get_var_info(.data, x)

gvi(...)
```

## Arguments

- .data:

  a data frame

- x:

  a column within the data frame

- ...:

  optional, only to make the shortcut (`gvi`) work

## Value

If the column in the data frame is not labelled, the function returns a
message communicating the absence of labels. If the column in the data
frame is labelled, the function returns a small data frame communicating
the `var_label()` output (`var`), the (often but not always) numeric
"code" coinciding with with the label (`code`), and the "label" attached
to it (`label`).

## Details

This function leans on `var_label()` and `val_label()` in the `labelled`
package, which is a dependency for this package. The function is
designed to be used in a "pipe."

## Examples

``` r

library(tibble)
library(dplyr)
library(magrittr)

ess9_labelled %>% get_var_info(netusoft) # works, as intended
#>                       var code              label
#> 1 Internet use, how often    1              Never
#> 2 Internet use, how often    2  Only occasionally
#> 3 Internet use, how often    3 A few times a week
#> 4 Internet use, how often    4          Most days
#> 5 Internet use, how often    5          Every day
#> 6 Internet use, how often    7            Refusal
#> 7 Internet use, how often    8         Don't know
#> 8 Internet use, how often    9          No answer
ess9_labelled %>% get_var_info(cntry) # works, as intended
#>        var code          label
#> 1  Country   GB United Kingdom
#> 2  Country   BE        Belgium
#> 3  Country   DE        Germany
#> 4  Country   EE        Estonia
#> 5  Country   IE        Ireland
#> 6  Country   BG       Bulgaria
#> 7  Country   CH    Switzerland
#> 8  Country   FI        Finland
#> 9  Country   SI       Slovenia
#> 10 Country   NL    Netherlands
#> 11 Country   PL         Poland
#> 12 Country   NO         Norway
#> 13 Country   FR         France
#> 14 Country   RS         Serbia
#> 15 Country   AT        Austria
#> 16 Country   IT          Italy
#> 17 Country   HU        Hungary
#> 18 Country   CY         Cyprus
#> 19 Country   CZ        Czechia
ess9_labelled %>% get_var_info(ess9round) # barks at you; data are not labelled
#> get_var_info() requires a labelled column. Otherwise, you get this message.
```
