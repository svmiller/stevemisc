# Create "peace years" or "spells" by cross-sectional unit, more generally

`ps_btscs()` allows you to create spells ("peace years" in the
international conflict context) between observations of some event. This
will allow the researcher to better model temporal dependence in binary
time-series cross-section ("BTSCS") models. It is an improvement on
[`sbtscs()`](http://svmiller.com/reference/sbtscs.md) (included in this
package) by its ability to more flexibly work with data that have lots
of `NAs` that bracket the observed event data. It is used in the
`peacesciencer` package.

## Usage

``` r
ps_btscs(data, event, tvar, csunit, pad_ts = FALSE)
```

## Arguments

- data:

  the data set with which you are working

- event:

  some event (0, 1) for which you want spells or peace years

- tvar:

  the time variable (e.g. a year)

- csunit:

  the cross-sectional unit (likely a dyad if you're doing boilerplate
  international conflict stuff)

- pad_ts:

  should time-series be filled when panels are unbalanced/have gaps?
  Defaults to FALSE.

## Value

`ps_btscs()` takes a data frame and returns the data frame with a new
variable named `spell`.

## Details

This function is derived from
[`sbtscs()`](http://svmiller.com/reference/sbtscs.md). See documentation
there for more information.

## References

Armstrong, Dave. 2016. “DAMisc: Dave Armstrong's Miscellaneous
Functions.” *R package version 1.4-3*.

Miller, Steven V. 2017. “Quickly Create Peace Years for BTSCS Models
with `sbtscs` in `stevemisc`.”
<https://svmiller.com/blog/2017/06/quickly-create-peace-years-for-btscs-models-with-stevemisc/>

## Author

David A. Armstrong, Steven V. Miller

## Examples

``` r
# \donttest{
library(dplyr)
library(stevemisc)
data(usa_mids)

# notice: no quotes
ps_btscs(usa_mids, midongoing, year, dyad)
#> Joining with `by = join_by(dyad, year)`
#> # A tibble: 14,586 × 7
#>       dyad ccode1 ccode2  year midongoing midonset spell
#>      <dbl>  <dbl>  <dbl> <dbl>      <dbl>    <dbl> <dbl>
#>  1 1002020      2     20  1920          0        0     0
#>  2 1002020      2     20  1921          0        0     1
#>  3 1002020      2     20  1922          0        0     2
#>  4 1002020      2     20  1923          0        0     3
#>  5 1002020      2     20  1924          0        0     4
#>  6 1002020      2     20  1925          0        0     5
#>  7 1002020      2     20  1926          0        0     6
#>  8 1002020      2     20  1927          0        0     7
#>  9 1002020      2     20  1928          0        0     8
#> 10 1002020      2     20  1929          0        0     9
#> # ℹ 14,576 more rows
# }
```
