# Create "peace years" or "spells" by cross-sectional unit

`sbtscs()` allows you to create spells ("peace years" in the
international conflict context) between observations of some event. This
will allow the researcher to better model temporal dependence in binary
time-series cross-section ("BTSCS") models.

## Usage

``` r
sbtscs(data, event, tvar, csunit, pad_ts = FALSE)
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

`sbtscs()` takes a data frame and returns the data frame with a new
variable named `spell`.

## Details

I should confess outright, and it should be obvious to anyone who looks
at the code, that I liberally copy from Dave Armstrong's `btscs()`
function in the DAMisc package. I offer two such improvements. One, the
`btscs()` function chokes when a large number of cross-sectional units
have no recorded "event." I don't know why this happens but it does.
Further, "tidying" up the code by leaning on dplyr substantially speeds
up computation. Incidentally, this concerns the same cross-sectional
units with no recorded events that can choke the `btscs()` function in
large numbers.

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
if (FALSE) { # \dontrun{
library(dplyr)
library(stevemisc)
data(usa_mids)

# notice: no quotes
sbtscs(usa_mids, midongoing, year, dyad)
} # }
```
