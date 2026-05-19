# Create "spells" by cross-sectional unit, even more generally

`ps_spells()` allows you to create spells ("peace years" in the
international conflict context) between observations of some event. This
will allow the researcher to better model temporal dependence in binary
time-series cross-section ("BTSCS") models. The function is one of three
in this package, and the contents of this function are partly ported
from the `add_duration()` function in the spduration package. That
function, unlike the other two I offer here, works much better where
panels are decidedly imbalanced.

## Usage

``` r
ps_spells(data, event, tvar, csunit, time_type = "year", ongoing = FALSE)
```

## Arguments

- data:

  the data set with which you are working

- event:

  some event (0, 1) for which you want spells

- tvar:

  the time variable (e.g. a year)

- csunit:

  the cross-sectional unit (e.g. a dyad or leader)

- time_type:

  what type of time-unit are the data? Right now, this will only work
  with years but support for months and days are forthcoming. Don't do
  anything with this argument just yet.

- ongoing:

  If `TRUE`, successive 1s are considered ongoing events and treated as
  `NA` after the first 1. If `FALSE`, successive 1s are all treated as
  failures. Defaults to `FALSE`.

## Value

`ps_spells()` takes a data frame and returns the data frame with a new
variable named `spell`.

## Details

This function is derived from `add_duration()` in the spduration
package. See documentation there for more information. I thank Andreas
Beger for the blessing to port parts of it here.

## References

Beger, Andreas, Daina Chiba, Daniel W. Hill, Jr, Nils W. Metternich,
Shahryar Minhas and Michael D. Ward. 2018. “spduration: Split-Population
and Duration (Cure) Regression.” *R package version 0.17.1*.

## Author

Andreas Beger, Steven V. Miller

## Examples

``` r

One <- ps_btscs(usa_mids, midongoing, year, dyad)
#> Joining with `by = join_by(dyad, year)`
Two <- ps_spells(usa_mids, midongoing, year, dyad)
#> Joining with `by = join_by(orig_order)`
identical(One, Two)
#> [1] TRUE

```
