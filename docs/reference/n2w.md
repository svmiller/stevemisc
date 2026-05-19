# Convert Number (Integer) to Word

`n2w()` is a convenience function that converts a positive number (and
one assumes an integer) to an English word or set of words.

## Usage

``` r
n2w(x)
```

## Arguments

- x:

  a number (one assumes: an integer)

## Value

`n2w()` takes a number (one assumes: an integer) and returns that number
as an English word (or set of words).

## Details

`n2w()` assumes but does not compel the use of integers. Positive reals
are rounded down to the nearest integer.

The function issues a stop in cases where the number provided is
negative or a decimal value between 0 (with precision) and 1. Returns of
0 and infinity are still valid.

This function has been passed from multiple sources, including John Fox,
Andy Teucher, and an "AJH." I copied it from Jason Miller (no relation)
and made some minor edits to it.

## Author

John Fox, Andy Teucher, "AJH", Jason Miller, Steven V. Miller

## Examples

``` r

n2w(3)
#> [1] "three"
n2w(13)
#> [1] "thirteen"
n2w(30)
#> [1] "thirty"
n2w(8675309)
#> [1] "eight million, six hundred and seventy five thousand, three hundred and nine"
```
