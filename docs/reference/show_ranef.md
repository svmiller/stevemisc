# Get a caterpillar plot of random effects from a mixed model

`show_ranef()` allows a user estimating a mixed model to quickly plot
the random intercepts (with conditional variances) of a given random
effect in a mixed model. In cases where there is a random slope over the
intercept, the function plots the random slope as another caterpillar
plot (as another facet)

## Usage

``` r
show_ranef(model, group, reorder = TRUE)
```

## Arguments

- model:

  a fitted mixed model with random intercepts

- group:

  What random intercept/slopes do you want to see as a caterpillar plot?
  Declare it as a character

- reorder:

  optional argument. DEFAULT is TRUE, which “re-orders” the intercepts
  by the original value in the data. If FALSE, the ensuing caterpillar
  plot defaults to a default method of ordering the levels of the random
  effect by their estimated conditional mode.

## Value

`show_ranef()` returns a caterpillar plot of the random intercepts from
a given mixed model. If
[`broom.mixed::augment()`](https://generics.r-lib.org/reference/augment.html)
can process it, this function should work just fine.

## Details

This function is a simple wrapper in which `broom.mixed` and, obviously
`ggplot2` are doing the heavy lifting.

## Author

Steven V. Miller

## Examples

``` r

library(lme4)
#> Loading required package: Matrix
library(stevemisc)
data(sleepstudy)

M1 <- lmer(Reaction ~ Days + (Days | Subject), data=sleepstudy)
show_ranef(M1, "Subject")
#> `height` was translated to `width`.

show_ranef(M1, "Subject", reorder=FALSE)
#> `height` was translated to `width`.

```
