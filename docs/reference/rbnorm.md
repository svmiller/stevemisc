# Bounded Normal (Really: Scaled Beta) Distribution

`rbnorm()` is a function to randomly generate values from a bounded
normal (really: a scaled beta) distribution with specified mean,
standard deviation, and upper/lower bounds. I use this function to
randomly generate data that we treat as interval for sake of getting
means and standard deviations, but have discernible bounds (and even
skew) to teach students about things like random sampling and central
limit theorem.

## Usage

``` r
rbnorm(n, mean, sd, lowerbound, upperbound, round = FALSE, seed)
```

## Arguments

- n:

  the number of observations to simulate

- mean:

  a mean to approximate

- sd:

  a standard deviation to approximate

- lowerbound:

  a lower bound for the data to be generated

- upperbound:

  an upper bound for the data to be generated

- round:

  whether to round the values to whole integers. Defaults to FALSE

- seed:

  set an optional seed

## Value

The function returns a vector of simulated data approximating the
user-specified conditions.

## Details

I call it "bounded normal" when it's really a beta distribution. I'm
aware of this. I took much of this code from somewhere. I forget where.

## Examples

``` r

library(tibble)

tibble(x = rbnorm(10000, 57, 14, 0, 100))
#> # A tibble: 10,000 × 1
#>        x
#>    <dbl>
#>  1  51.3
#>  2  75.9
#>  3  57.1
#>  4  66.4
#>  5  34.2
#>  6  71.4
#>  7  29.8
#>  8  42.5
#>  9  66.2
#> 10  56.2
#> # ℹ 9,990 more rows
tibble(x = rbnorm(10000, 57, 14, 0, 100, round = TRUE))
#> # A tibble: 10,000 × 1
#>        x
#>    <dbl>
#>  1    58
#>  2    27
#>  3    56
#>  4    53
#>  5    49
#>  6    80
#>  7    47
#>  8    74
#>  9    61
#> 10    76
#> # ℹ 9,990 more rows
tibble(x = rbnorm(10000, 57, 14, 0, 100, seed = 8675309))
#> # A tibble: 10,000 × 1
#>        x
#>    <dbl>
#>  1  72.8
#>  2  44.6
#>  3  66.9
#>  4  38.4
#>  5  39.8
#>  6  56.5
#>  7  45.5
#>  8  47.3
#>  9  41.4
#> 10  39.2
#> # ℹ 9,990 more rows
```
