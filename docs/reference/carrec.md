# Recode a Variable

This recodes a numeric vector, character vector, or factor according to
fairly simple recode specifications that former Stata users will
appreciate. Yes, this is taken from John Fox's `recode()` unction in his
car package. I'm going with `carrec()` (i.e. shorthand for
[`car::recode()`](https://rdrr.io/pkg/car/man/recode.html), phonetically
here: "car-wreck") for this package, with an additional shorthand of
`carr` that does the same thing.

The goal here is to minimize the number of function clashes with
multiple packages that I use in my workflow. For example: car, dplyr,
and Hmisc all have `recode()` functions. I rely on the car package just
for this function, but it conflicts with some other tidyverse functions
that are vital to my workflow.

## Usage

``` r
carrec(var, recodes, as_fac, as_num = TRUE, levels)

carr(...)
```

## Arguments

- var:

  numeric vector, character vector, or factor

- recodes:

  character string of recode specifications: see below, but former Stata
  users will find this stuff familiar

- as_fac:

  return a factor; default is `TRUE` if `var` is a factor, `FALSE`
  otherwise

- as_num:

  if `TRUE` (which is the default) and `as.factor` is `FALSE`, the
  result will be coerced to a numeric if all values in the result are
  numeric. This should be what you want in 99% of applications for
  regression analysis.

- levels:

  an optional argument specifying the order of the levels in the
  returned factor; the default is to use the sort order of the level
  names.

- ...:

  optional, only to make the shortcut (`carr()`) work

## Value

`carrec()` returns a vector, recoded to the specifications of the user.
`carr()` is a simple shortcut for`carrec()`.

## Details

Recode specifications appear in a character string, separated by
semicolons (see the examples below), of the form input=output. If an
input value satisfies more than one specification, then the first (from
left to right) applies. If no specification is satisfied, then the input
value is carried over to the result. NA is allowed on input and output.

## References

Fox, J. and Weisberg, S. (2019). *An R Companion to Applied Regression*,
Third Edition, Sage.

## Author

John Fox

## Examples

``` r
x <- seq(1,10)
carrec(x,"0=0;1:2=1;3:5=2;6:10=3")
#>  [1] 1 1 2 2 2 3 3 3 3 3
```
