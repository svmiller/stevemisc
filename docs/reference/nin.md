# Find Non-Matching Elements

`%nin%` finds non-matching elements in a given vector. It is the
negation of `%in%`.

## Usage

``` r
a %nin% b
```

## Arguments

- a:

  a vector (character, factor, or numeric)

- b:

  a vector (character, factor, or numeric)

## Value

`%nin%` finds non-matching elements and returns one of two things,
depending on the use. For two simple vectors, it will report what
matches and what does not. For comparing a vector within a data frame,
it has the effect of reporting the rows in the data frame that do not
match the supplied (second) vector.

## Details

This is a simple negation of `%in%`. I use it mostly for columns in a
data frame.

## Examples

``` r

library(tibble)
library(dplyr)

# Watch this subset stuff

dat <- tibble(x = seq(1:10), d = rnorm(10))
filter(dat, x %nin% c(3, 6, 9))
#> # A tibble: 7 × 2
#>       x      d
#>   <int>  <dbl>
#> 1     1 -0.319
#> 2     2  0.915
#> 3     4 -1.10 
#> 4     5 -0.605
#> 5     7 -2.09 
#> 6     8 -0.934
#> 7    10 -0.398
```
