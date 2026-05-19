# Get Weighted Least Squares of Your OLS Model

`wls()` takes an OLS model and re-estimates it using a weighted least
squares approach. Weighted least squares is often a "textbook" approach
to dealing with the presence of heteroskedastic standard errors, for
which the weighted least squares estimates are compared to the OLS
estimates of uncertainty to check for consistency or potential
inferential implications.

## Usage

``` r
wls(mod)
```

## Arguments

- mod:

  a fitted OLS model

## Value

`wls()` returns a new model object that is a weighted least squares
re-estimation of the OLS model supplied to it.

## Details

The function *should* be robust to potential model specification
oddities (e.g. polynomials and fixed effects). It also should perform
nicely in the presence of missing data, if and only if
`na.action = na.exclude` is supplied first to the offending OLS model
supplied to the function for a weighted least squares re-estimation.

## Author

Steven V. Miller

## Examples

``` r

M1 <- lm(mpg ~ ., data=mtcars)
M2 <- wls(M1)

summary(M2)
#> 
#> Call:
#> lm(formula = mpg ~ cyl + disp + hp + drat + wt + qsec + vs + 
#>     am + gear + carb, data = A, weights = wts)
#> 
#> Weighted Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -1.7522 -0.8385 -0.2326  0.9062  2.7257 
#> 
#> Coefficients:
#>              Estimate Std. Error t value Pr(>|t|)
#> (Intercept) 16.798050  19.371537   0.867    0.396
#> cyl         -0.394419   1.021128  -0.386    0.703
#> disp         0.002299   0.015834   0.145    0.886
#> hp          -0.009795   0.020927  -0.468    0.645
#> drat         0.934691   1.646690   0.568    0.576
#> wt          -2.383075   1.748083  -1.363    0.187
#> qsec         0.552577   0.760879   0.726    0.476
#> vs          -0.124255   2.231573  -0.056    0.956
#> am           2.236543   2.158780   1.036    0.312
#> gear         0.484887   1.520711   0.319    0.753
#> carb        -0.564120   0.802962  -0.703    0.490
#> 
#> Residual standard error: 1.518 on 21 degrees of freedom
#> Multiple R-squared:  0.8621, Adjusted R-squared:  0.7965 
#> F-statistic: 13.13 on 10 and 21 DF,  p-value: 6.318e-07
#> 
```
