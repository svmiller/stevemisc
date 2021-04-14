#' The Student-t Distribution (Location-Scale)
#'
#' These are density, distribution function, quantile function and random generation
#' for the Student-t distribution with location \code{mu}, scale \code{sigma},
#' and degrees of freedom \code{df}. Base R gives you the so-called "standard" Student-t
#' distribution, with just the varying degrees of freedom. This generalizes that standard
#' Student-t to the three-parameter version.
#'
#' @name studentt
#'
#' @param x,q a vector of quantiles
#' @param p Vector of probabilities.
#' @param n Number of samples to draw from the distribution.
#' @param mu a vector for the location value
#' @param sigma a vector of scale values
#' @param df a vector of degrees of freedom
#'
#' @details This is a simple hack taken from Wikipedia. It's an itch I've been wanting to scratch for a while. I can probably
#' generalize this outward to allow the tail and log stuff, but I wrote this mostly for the random number generation. Right now,
#' I haven't written this to account for the fact that sigma should be non-negative, but that's on the user to know that (for now).
#'
#' @return \code{dst()} returns the density. \code{pst()} returns the distribution function. \code{qst()} returns the quantile function.
#' \code{rst()} returns random numbers.
#'
#' @seealso \code{\link[stats:TDist]{TDist}}
#'
#' @export
#'

#' @rdname studentt
#' @export
dst <- function(x, df, mu, sigma) {
  1/sigma * dt((x - mu)/sigma, df)
}


#' @rdname studentt
#' @export
pst <- function(q, df, mu, sigma) {
  pt((q - mu)/sigma, df)
}


#' @rdname studentt
#' @export
qst <- function(p, df, mu, sigma) {
  qt(p, df)*sigma + mu
}


#' @rdname studentt
#' @export
rst <- function(n, df, mu, sigma) {
  rt(n,df)*sigma + mu
}

# https://github.com/paul-buerkner/brms/blob/master/R/distributions.R
