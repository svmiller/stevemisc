# Convert data frame to an object of class "tibble"

`tbl_df()` ensures legacy compatibility with some of my scripts since
the function is deprecated in dplyr. `to_tbl()` also added for fun.

## Usage

``` r
tbl_df(...)

to_tbl(...)
```

## Arguments

- ...:

  optional parameters, but don't put anything here. It's just there to
  quell CRAN checks.

## Value

This function takes a data frame and turns it into a tibble.

## Examples

``` r

tbl_df(mtcars)
#> Error: `tbl_df()` was deprecated in dplyr 1.0.0 and is now defunct.
#> ℹ Please use `tibble::as_tibble()` instead.
tbl_df(iris)
#> Error: `tbl_df()` was deprecated in dplyr 1.0.0 and is now defunct.
#> ℹ Please use `tibble::as_tibble()` instead.
```
