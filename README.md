
# Steve’s Miscellaneous Functions

[![](https://www.r-pkg.org/badges/version/stevemisc?color=green)](https://cran.r-project.org/package=stevemisc)
[![](http://cranlogs.r-pkg.org/badges/grand-total/stevemisc?color=green)](https://cran.r-project.org/package=stevemisc)
[![](http://cranlogs.r-pkg.org/badges/last-month/stevemisc?color=green)](https://cran.r-project.org/package=stevemisc)
[![](http://cranlogs.r-pkg.org/badges/last-week/stevemisc?color=green)](https://cran.r-project.org/package=stevemisc)

<img src="http://svmiller.com/images/stevemisc-hexlogo.png" alt="My stevemisc hexlogo" align="right" width="200" style="padding: 0 15px; float: right;"/>

`{stevemisc}` is an R package that includes various functions and tools
that I have written over the years to assist me in my research. I offer
it here for a public release because 1) I am vain and think I privately
want an entire, eponymous ecosystem in the R programming language
(i.e. the “steveverse”) and 2) I think there are tools here that are
broadly useful for users that I’m trying to bundle with other things
that I offer (prominently
[{steveproj}](https://github.com/svmiller/steveproj)). The usage section
will elaborate some of its uses.

## Installation

When the time comes, you can install this on CRAN.

``` r
install.packages("stevemisc")
```

Right now, this package in development and is not available on CRAN. You
can install the development version of `steveproj` from Github via the
`devtools` package. I suppose using the `remotes` package would work as
well.

``` r
devtools::install_github("svmiller/stevemisc")
```

## Usage

The documentation files will include several of these as “examples.” I
offer them here as proofs of concept.

### `carrec()`: A Port of `car::recode()`

`carrec()` (phonetically: “car-wreck”) is a simple port of
`car::recode()` that I put in this package because of various function
clashes in the `{car}` package. For those who cut their teeth on Stata,
this package offers Stata-like recoding features that are tough to find
in the R programming language. It comes with a shortcut as well,
`carr()`.

For example, assume the following vector that is some variable of
interest on a 1-10 scale. You want to code the variables that are 6 and
above to be 1 and code the variables of 1-5 to be 0. Here’s how you
would do that.

``` r
library(tidyverse)
library(stevemisc)
x <- seq(1, 10)
x
```

    ##  [1]  1  2  3  4  5  6  7  8  9 10

``` r
carrec(x, "1:5=0;6:10=1")
```

    ##  [1] 0 0 0 0 0 1 1 1 1 1

``` r
carr(x, "1:5=0;6:10=1")
```

    ##  [1] 0 0 0 0 0 1 1 1 1 1

### `cor2data()`: Simulate Variables from a Standard Normal Distribution with Pre-Specified Correlations

`cor2data()` is great for instructional purposes for simulating data
from a standard normal distribution in which the ensuing data are
generated to approximate some pre-specified correlations. This is useful
for teaching how statistical models are supposed to operate under some
ideal circumstances. For example, here’s how [I used this function to
teach about instrumental variable
models](http://post8000.svmiller.com/lab-scripts/instrumental-variables-lab.html).
Notice the correlations I devise and how they satisfy they assumptions
of exclusion, exogeneity, and relevance.

``` r
vars = c("control", "treat", "instr", "e")
Cor <- matrix(cbind(1, 0, 0, 0,
                    0, 1, 0.85, -0.5,
                    0, 0.85, 1, 0,
                    0, -0.5, 0, 1),nrow=4)
rownames(Cor) <- colnames(Cor) <- vars

Fake <- as_tibble(cor2data(Cor, 1000, 8675309)) # Jenny I got your number...
Fake$y <- with(Fake, 5 + .5*control + .5*treat + e)

Fake
```

    ## # A tibble: 1,000 x 5
    ##    control   treat   instr       e     y
    ##      <dbl>   <dbl>   <dbl>   <dbl> <dbl>
    ##  1 -0.997   0.722   0.288  -0.220   4.64
    ##  2  1.07    0.987   0.854  -0.260   5.77
    ##  3  0.572   0.904  -0.0482 -1.38    4.36
    ##  4  0.150  -0.660  -1.08    0.148   4.89
    ##  5 -0.442  -0.901  -0.845   0.0682  4.40
    ##  6  1.99    0.0440 -0.176  -0.497   5.52
    ##  7 -0.415   0.683   0.944   0.383   5.52
    ##  8 -0.186   0.383   0.524   0.475   5.57
    ##  9  1.57    0.589   0.176  -0.863   5.22
    ## 10  0.0639 -0.313  -0.397  -0.0922  4.78
    ## # … with 990 more rows

### `corvectors()`: Create Multivariate Data by Permutation

`corvectors()` is a port of `correlate()` from the `{correlate}`
package. This package is no longer on CRAN, but it’s wonderful for
creating multivariate data with set correlations in which variables can
be on any number of raw scales. I used this function to create fake data
to mimic the API data in `{survey}`, which I make available as `fakeAPI`
in the `{stevedata}` package. Here is a smaller version of that.

``` r
data(api, package="survey")
cormatrix <- cor(apipop %>%
                   select(meals, col.grad, full) %>% na.omit)

nobs <- 1e3

corvectors(cbind(runif(nobs, 0, 100),
                 rbnorm(nobs, 20.73, 14.14, 0, 100),
                 rbnorm(nobs, 87.52, 12.93, 0, 100)), cormatrix) %>% 
  as.data.frame() %>% as_tibble() %>%
  rename(meals = V1, colgrad = V2, fullqual = V3)
```

    ##            [,1]       [,2]       [,3]
    ## [1,]  1.0000000 -0.6820575 -0.4845344
    ## [2,] -0.6820575  1.0000000  0.3107186
    ## [3,] -0.4845344  0.3107186  1.0000000

    ## # A tibble: 1,000 x 3
    ##    meals colgrad fullqual
    ##    <dbl>   <dbl>    <dbl>
    ##  1  48.4  17.8       97.8
    ##  2  19.6  58.2       76.1
    ##  3  88.1   6.41      72.4
    ##  4  52.1  11.7       86.6
    ##  5  43.2  23.4       87.3
    ##  6  81.0   0.361     54.5
    ##  7  54.6   6.49      85.1
    ##  8  87.1  12.0       88.0
    ##  9  80.8   4.34     100. 
    ## 10  73.0  13.9       74.9
    ## # … with 990 more rows

### `get_var_info()`: Get Labelled Data from Your Variables

`get_var_info()` allows for what I like to term “peeking” at your
labelled data. If you do not have a codebook handy, but you know the
data are labelled, `get_var_info()` (and its shortcut: `gvi()`) will
extract the pertinent information for you. `{stevemisc}` comes with a
toy data set—`ess9_labelled`—in which there are two labelled variables
for the country and internet consumption from the ninth round of the
European Social Survey. You can extract that information with this
package.

Do note that it assumes a pipe-based workflow. It’s there for when
you’re having to sit down in an R session and recode data without the
assistance of a dual-monitor setup or physical codebook.

``` r
ess9_labelled
```

    ## # A tibble: 109 x 4
    ##    essround edition cntry                      netusoft
    ##       <dbl> <chr>   <chr+lbl>                 <dbl+lbl>
    ##  1        9 1.2     AT [Austria] 5 [Every day]         
    ##  2        9 1.2     AT [Austria] 1 [Never]             
    ##  3        9 1.2     AT [Austria] 4 [Most days]         
    ##  4        9 1.2     AT [Austria] 2 [Only occasionally] 
    ##  5        9 1.2     AT [Austria] 3 [A few times a week]
    ##  6        9 1.2     BE [Belgium] 5 [Every day]         
    ##  7        9 1.2     BE [Belgium] 2 [Only occasionally] 
    ##  8        9 1.2     BE [Belgium] 1 [Never]             
    ##  9        9 1.2     BE [Belgium] 4 [Most days]         
    ## 10        9 1.2     BE [Belgium] 3 [A few times a week]
    ## # … with 99 more rows

``` r
# alternatively, below:
# ess9_labelled %>% gvi(netusoft)
# we'll do it this way, though...
ess9_labelled %>% get_var_info(netusoft)
```

    ##                       var code              label
    ## 1 Internet use, how often    1              Never
    ## 2 Internet use, how often    2  Only occasionally
    ## 3 Internet use, how often    3 A few times a week
    ## 4 Internet use, how often    4          Most days
    ## 5 Internet use, how often    5          Every day
    ## 6 Internet use, how often    7            Refusal
    ## 7 Internet use, how often    8         Don't know
    ## 8 Internet use, how often    9          No answer

### `jenny()`: Set the Only Reproducible Seed that Matters, and Get a Nice Message for It

There are infinite reproducible seeds. There is only one correct one.
`jenny()` will set it for you and reward you with a nice message. It
will get catty with you if try to use `jenny()` to set any other
reproducible seed.

``` r
jenny() # good
```

    ## 🎶 Jenny, I got your number...

``` r
jenny(12345) # bad, and no seed set. Use set.seed() instead, you goon.
```

    ## Why are you using this function with some other reproducible seed...
