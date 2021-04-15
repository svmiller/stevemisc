#' Simulate from a Multivariate Normal Distribution
#'
#' @description \code{smvrnorm()} simulates data from a multivariate normal distribution.
#'
#' @details This is a simple port and rename of \code{mvrnorm()} from the \pkg{MASS} package. I elect
#' to plagiarize/port it because the \pkg{MASS} package conflicts with a lot of things in my workflow,
#' especially \code{select()}. This is useful for "informal Bayes" approaches to generating quantities
#' of interest from a regression model.
#'
#' @param n the number of observations to simulate
#' @param mu a vector of means
#' @param sigma a positive-definite symmetric matrix specifying the covariance matrix of the variables.
#' @param tol tolerance (relative to largest variance) for numerical lack of positive-definiteness in \code{sigma}.
#' @param empirical logical. If true, \code{mu} and \code{sigma} specify the empirical not population mean and covariance matrix.
#' @param eispack logical. values other than FALSE result in an error
#' @param seed set an optional seed
#'
#' @return The function returns simulated data from a multivariate normal distribution.
#'
#' @references  B. D. Ripley (1987) \emph{Stochastic Simulation.} Wiley. Page 98.
#'
#' @examples
#'
#' M1 <- lm(mpg ~ disp + cyl, mtcars)
#'
#' smvrnorm(100, coef(M1), vcov(M1))
#'
smvrnorm <- function(n = 1, mu, sigma, tol = 1e-06,
                     empirical = FALSE, eispack = FALSE, seed) {
    if (missing(seed)) {

    } else {
        set.seed(seed)
    }
    p <- length(mu)
    if (!all(dim(sigma) == c(p, p)))
        stop("incompatible arguments")
    if (eispack)
        stop("'EISPACK' is no longer supported by R", domain = NA)
    es <- eigen(sigma, symmetric = TRUE)
    ev <- es$values
    if (!all(ev >= -tol * abs(ev[1L])))
        stop("'Sigma' is not positive definite")
    xmat <- matrix(rnorm(p * n), n)
    if (empirical) {
        xmat <- scale(xmat, TRUE, FALSE)  # remove means
        xmat <- xmat %*% svd(xmat, nu = 0)$v  # rotate to PCs
        xmat <- scale(xmat, FALSE, TRUE)  # rescale PCs to unit variance
    }
    xmat <- drop(mu) + es$vectors %*% diag(sqrt(pmax(ev, 0)), p) %*% t(xmat)
    nm <- names(mu)
    if (is.null(nm) && !is.null(dn <- dimnames(sigma)))
        nm <- dn[[1L]]
    dimnames(xmat) <- list(nm, NULL)
    if (n == 1)
        drop(xmat) else t(xmat)
}
