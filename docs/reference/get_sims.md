# Get Simulations from a Model Object (with New Data)

`get_sims()` is a function to simulate quantities of interest from a
multivariate normal distribution for "new data" from a regression model.

## Usage

``` r
get_sims(model, newdata, nsim, seed)
```

## Arguments

- model:

  a model object

- newdata:

  A data frame on some quantities of interest to be simulated

- nsim:

  Number of simulations to be run

- seed:

  An optional seed to set

## Value

`get_sims()` returns a data frame (as a `tibble`) with the quantities of
interest and identifying information about the particular simulation
number.

## Details

This (should) be a flexible function that takes a `merMod` object
(estimated from lme4, blme, etc.) or a `lm` or `glm` object and
generates some quantities of interest when paired with new data of
observations of interest. Of note: I've really only tested this function
with linear models, generalized linear models, and their mixed model
equivalents. For mixed models, this approach does not offer support for
the incorporation of the random effects or the random slopes. It's just
for the fixed effects, which is typically what most people want anyway.
Users who want to better incorporate the random intercepts or slope
could find that support in the merTools package.

## Author

Steven V. Miller

## Examples

``` r
if (FALSE) { # \dontrun{
# Note: these models are dumb, but they illustrate how it works.

M1 <- lm(mpg ~ hp, mtcars)
# Note: this function requires the DV to appear somewhere, anywhere in the "new data"
newdat <- data.frame(mpg = 0,
                     hp = c(mean(mtcars$hp) - sd(mtcars$hp),
                            mean(mtcars$hp),
                            mean(mtcars$hp) + sd(mtcars$hp)))

get_sims(M1, newdat, 100, 8675309)

# Note: this is likely a dumb model, but illustrates how it works.
mtcars$mpgd <- ifelse(mtcars$mpg > 25, 1, 0)

M2 <- glm(mpgd ~ hp, mtcars, family=binomial(link="logit"))

# Again: this function requires the DV to be somewhere, anywhere in the "new data"
newdat$mpgd <- 0

# Note: the simulations are returned on their original "link". Here, that's a "logit"
# You can adjust that accordingly. `plogis(y)` will convert those to probabilities.
get_sims(M2, newdat, 100, 8675309)

library(lme4)
M3 <- lmer(mpg ~ hp + (1 | cyl), mtcars)

# Random effects are not required here since we're passing over them.
get_sims(M3, newdat, 100, 8675309)
} # }
```
