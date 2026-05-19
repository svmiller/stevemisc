# The Student-t Distribution (Location-Scale)

These are density, distribution function, quantile function and random
generation for the Student-t distribution with location `mu`, scale
`sigma`, and degrees of freedom `df`. Base R gives you the so-called
"standard" Student-t distribution, with just the varying degrees of
freedom. This generalizes that standard Student-t to the three-parameter
version.

## Usage

``` r
dst(x, df, mu, sigma)

pst(q, df, mu, sigma)

qst(p, df, mu, sigma)

rst(n, df, mu, sigma)
```

## Arguments

- x, q:

  a vector of quantiles

- df:

  a vector of degrees of freedom

- mu:

  a vector for the location value

- sigma:

  a vector of scale values

- p:

  Vector of probabilities.

- n:

  Number of samples to draw from the distribution.

## Value

`dst()` returns the density. `pst()` returns the distribution function.
`qst()` returns the quantile function. `rst()` returns random numbers.

## Details

This is a simple hack taken from Wikipedia. It's an itch I've been
wanting to scratch for a while. I can probably generalize this outward
to allow the tail and log stuff, but I wrote this mostly for the random
number generation. Right now, I haven't written this to account for the
fact that sigma should be non-negative, but that's on the user to know
that (for now).

## See also

[`TDist`](https://rdrr.io/r/stats/TDist.html)
