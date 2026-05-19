# Reorganize a factor after "re-leveling" it

`fct_reorg()` is a forcats hack that reorganizes a factor after
re-leveling it. It has been situationally useful in my coefficient plots
over the years.

## Usage

``` r
fct_reorg(fac, ...)
```

## Arguments

- fac:

  a character or factor vector

- ...:

  optional parameters to be supplied to forcats functions.

## Value

This function takes a character or factor vector and first re-levels it
before re-coding certain values. The end result is a factor.

## Details

Solution comes by way of this issue on Github:
<https://github.com/tidyverse/forcats/issues/45>

## Examples

``` r

x<-factor(c("a","b","c"))
fct_reorg(x, B="b", C="c")
#> [1] a B C
#> Levels: B C a
```
