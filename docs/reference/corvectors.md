# Create multivariate data by permutation

`corvectors()` is a function to obtain a multivariate dataset by
specifying the relation between those specified variables.

## Usage

``` r
corvectors(
  data,
  corm,
  tol = 0.005,
  conv = 10000,
  cores = 2,
  splitsize = 1000,
  verbose = FALSE,
  seed
)
```

## Arguments

- data:

  a data matrix containing the data

- corm:

  A value containing the desired correlation or a vector or data matrix
  containing the desired correlations

- tol:

  A single value or a vector of tolerances with length `ncol(data) - 1`.
  The default is 0.005

- conv:

  The maximum iterations allowed. Defaults to 1000.

- cores:

  The number of cores to be used for parallel computing

- splitsize:

  The size to use for splitting the data

- verbose:

  Logical statement. Default is FALSE

- seed:

  An optional seed to set

## Value

`corvectors()` returns a matrix given the specified multivariate
relation.

## Details

This is liberally copy-pasted from van Kooten and Vink's
wonderful-but-no-longer-supported correlate package. They call it
`correlate()` in their package, but I opt for `corvectors()` here.

## Author

Pascal van Kooten and Gerko Vink

## Examples

``` r

if (FALSE) { # \dontrun{
set.seed(8675309)
library(tibble)
# bivariate example, start with zero correlation
as_tibble(data.frame(corvectors(replicate(2, rnorm(100)), .5)))

# multivariate example
as_tibble(data.frame(corvectors(replicate(4, rnorm(100)), c(.5, .6, .7))))

} # }
```
