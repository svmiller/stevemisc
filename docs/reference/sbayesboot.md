# Bootstrap a Regression Model, the Bayesian Way

`sbayesboot()` performs a Bayesian bootstrap of a regression model.

## Usage

``` r
sbayesboot(object, reps = 1000L, seed, cluster = NULL, ...)
```

## Arguments

- object:

  a regression model object

- reps:

  how many bootstrap replicates the user wants. Defaults to 1000

- seed:

  set an optional seed for reproducibility

- cluster:

  an optional cluster for calibrating the weights

- ...:

  optional arguments

## Value

`sbayesboot()` takes a fitted regression model and returns a matrix of
bootstrapped coefficients (with intercept). These could be easily
converted to a data frame for ease of summary.

## Details

The code underpinning `sbayesboot()` is largely derived from code
provided by Grant McDermott and Vincent Arel-Bundock. My approach here
takes the flexibility of McDermott's model-agnostic code (along with the
ease of specifying clusters) and combines it with Arel-Bundock's
[`update()`](https://rdrr.io/r/stats/update.html) approach to the actual
bootstrapping. I may have screwed something up, so feel free to point to
cases where I did screw up.

## Author

Grant McDermott, Vincent Arel-Bundock

## Examples

``` r
# \donttest{
M1 <- lm(mpg ~ disp + wt + hp, mtcars)

# Default options

BB1 <- sbayesboot(M1)

# Cluster bootstrap on cylinder variable

BB2 <- sbayesboot(M1, cluster=~cyl)
# }
```
