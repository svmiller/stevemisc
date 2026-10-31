# Fit a Residual Plot of Your Linear Model

`lmr.plot()` provides a visual diagnostic of the linearity assumption of
the linear model. Provided a linear model fit by
[`lm()`](https://rdrr.io/r/stats/lm.html) in base R, the function
extracts the model frame and creates a faceted scatterplot. For each
facet, a linear smoother and LOESS smoother are estimated over the
points. Users who run this function can assess just how much the linear
smoother and LOESS smoother diverge. The more they diverge, the more the
user can determine how much the linear model is a good fit as specified.
The plot will also point to potential outliers that may need further
consideration.

## Usage

``` r
lmr.plot(
  mod,
  smoother = "loess",
  se = FALSE,
  span = 0.75,
  dummies = FALSE,
  warning = TRUE,
  degree = 2,
  robust = FALSE,
  ...
)

# S3 method for class 'lmr.plot'
print(x, ...)
```

## Arguments

- mod:

  a fitted model, ideally a simple linear model

- smoother:

  defaults to "loess", and is passed to the 'method' argument for the
  non-linear smoother in
  [`geom_smooth()`](https://ggplot2.tidyverse.org/reference/geom_smooth.html).

- se:

  logical, defaults to `TRUE`. If `TRUE`, gives standard error estimates
  with the assorted smoothers. If `resid` is `TRUE`, there is no
  standard error for a flat line at 0.

- span:

  a numeric, defaults to .75. An adjustment to the smoother. Higher
  values permit smoother lines and might be warranted in the presence of
  sparse pockets of the data.

- dummies:

  logical, defaults to `FALSE`. If `FALSE`, removes binary independent
  variables from the plot. If `TRUE`, facets appear for binary
  independent variables. You should probably keep this as `FALSE` for
  your own use cases.

- warning:

  logical, defaults to `TRUE`. If `TRUE`, the plot suppresses assorted
  warnings from the LOESS smoother that would otherwise be cautioning
  you about things your eyes could otherwise see.

- degree:

  takes either 1 or 2 and passes argument to
  [`geom_smooth()`](https://ggplot2.tidyverse.org/reference/geom_smooth.html)
  call in the function. 1 = linear local fits. 2 = quadratic local fits.

- robust:

  logical, defaults to `FALSE`. If `TRUE`, employs robust smoothing in
  which large residuals are downweighted while fitting.

- ...:

  Additional arguments (passed to the scatterplot in `lmr.plot()`, not
  used in the print function

- x:

  a ggplot object with this special 'lmr.plot' class

## Value

`lmr.plot()` returns a faceted scatterplot as a ggplot2 object. The
linear smoother is flat at 0 by definition and is depicted by a black
dashed line. The LOESS smoother is a blue line. You can add cosmetic
features to it after the fact. The function may spit warnings to you
related to the LOESS smoother, depending your data and whether you have
disabled the warnings in the function. I think these to be fine the
extent to which this is really just a visual aid and an informal
diagnostic for the linearity assumption in a specified model.

## Details

This function makes an implicit assumption that there is no variable in
the regression formula with the name ".resid".

It may be in your interest (for the sake of rudimentary diagnostic
checks) to disable the standard error bands for particularly ill-fitting
linear models.

This function will ignore interactions in your model, returning only the
first-order terms in the model's specification.

## Author

Steven V. Miller

## Examples

``` r

set.seed(8675309) # Don't need this updating every time...
x1 <- rnorm(500)
x2 <- rnorm(500)
e <- rnorm(500)
y <- 5 + .5*x1 + .5*x2 + e

M1 <- lm(y ~ x1 + x2)

lmr.plot(M1)
#> `geom_smooth()` using formula = 'y ~ x'
#> `geom_smooth()` using formula = 'y ~ x'

lmr.plot(M1, color="black", pch=21)
#> `geom_smooth()` using formula = 'y ~ x'
#> `geom_smooth()` using formula = 'y ~ x'

```
