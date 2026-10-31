# Generate Week of the Month from a Date

`wom()` is a convenience function I use for constructing calendars in
ggplot2. It takes a date and returns, as a numeric vector, the week of
the month for the date given to it.

## Usage

``` r
wom(x)
```

## Arguments

- x:

  a date

## Value

`wom()` is a convenience function I use for constructing calendars in
ggplot2. It takes a date and returns, as a numeric vector, the week of
the month for the date given to it.

## Details

`wom()` assumes Sunday is the start of the week. This can assuredly be
customized later in this function, but right now the assumption is
Sunday is the start of the week (and not Monday, as it might be in other
contexts).

## Examples

``` r

wom(as.Date("2022-01-01"))
#> [1] 1

wom(Sys.Date())
#> [1] 5
```
