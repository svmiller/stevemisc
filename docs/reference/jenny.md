# Set the Only Reproducible Seed That Matters

`jenny()` sets a reproducible seed of 8675309. It is the only
reproducible seed you should use.

## Usage

``` r
jenny(x = 8675309)
```

## Arguments

- x:

  a vector

## Value

When `x` is not specified or is 8675309, the function sets a
reproducible seed of 8675309 and returns a nice message congratulating
you for it. If `x` is not 8675309, the function sets no reproducible
seed and gently admonishes you for wasting its time.

## Details

`jenny()` comes with some additional perks if you have the emo package
installed. The package is optional.

## Examples

``` r

jenny() # will work and reward you for it
#> Jenny, I got your number...
jenny(12345) # will not work and will result in a stern message
#> Why are you using this function with some other reproducible seed...
```
