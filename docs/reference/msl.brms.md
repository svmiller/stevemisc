# Create Custom modelsummary List from a Model Fitted in brms

`msl.brms()` is a convenience function for preparing a model fitted in
brms for presentation in modelsummary using its custom
"modelsummary_list" feature.

## Usage

``` r
msl.brms(mod, robust = FALSE)
```

## Arguments

- mod:

  a model fitted in brms

- robust:

  logical, defaults to FALSE. If FALSE, the "tidy" estimates are the
  mean of the simulated coefficients and the standard deviation of those
  coefficients. If TRUE, the "tidy" estimates are the median and median
  absolute deviation.

## Value

`msl.brms()` takes a model fitted by brms and prepares a custom
modelsummary list for formatting with that package's `modelsummary()`
function.

## Details

Bayesians typically recoil at the thought of reporting *p*-values for
presentation even as reviewers ask to see these. The *p*-value in
question is the "probability of direction" of an effect's existence.
Makowski et al. (2019) is a worthwhile read on this procedure. The
function calculates what they propose but doesn't require bayestestR as
a dependency.

Right now, the only easy goodness of fit parameter to return is the
number of observations. The output of this function is easily customized
ex post by the user.

The function scrubs the `b_` prefix in the terms, which is is a
convention of the modeling procedure in brms.

## References

Makowski, Dominique, Mattan S. Ben-Shachar, S. H. Annabel Chen, & Daniel
Lüdecke. 2019. "Indices of Effect Existence and Significance in the
Bayesian Framework." *Frontiers in Psychology* (10)2767.

## Examples

``` r

if (FALSE) { # \dontrun{
# this would take too much time to test...
library(stevedata)
library(brms)

M1 <- brm(gc ~ ool + cvlhs + vl + fl + m + pd, data = Mitchell68,
backend = 'cmdstanr', cores = 4, chains = 4)

msl.brms(M1)

} # }
```
