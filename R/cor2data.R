#' Simulate Data from Correlation Matrix
#'
#' @description A function to simulate data from a correlation matrix.
#' This is useful for illustrating some theoretical properties of
#' regressions when population parameters are known and set in advance.
#'
#' @name cor2data
#'
#' @param cor A correlation matrix (of class \code{matrix})
#' @param n A number of observations to simulate
#' @param seed An optional parameter to set a seed. Omitting this generates new simulations every time.
#'
#' @return \code{cor2data()} returns a data frame where all observations are simulated from a standard
#' normal distribution, but with those pre-set correlations.
#'
#' @author Steven V. Miller
#'
#'
#' @examples
#' vars <- c("control", "treat", "instr", "e")
#' Correlations <- matrix(cbind(1, 0.001, 0.001, 0.001,
#'                              0.001, 1, 0.85, -0.5,
#'                             0.001, 0.85, 1, 0.001,
#'                            0.001, -0.5, 0.001, 1),nrow=4)
#'
#' rownames(Correlations) <- colnames(Correlations) <- vars
#'
#' cor2data(Correlations, 1000, 8675309)
#'
#' @export
#'

cor2data <- function(cor, n, seed) {
    # number of observations to simulate
    nobs <- n
    # Cholesky decomposition
    cholesky <- t(chol(cor))
    nvars <- dim(cholesky)[1]
    if (missing(seed)) {
        } else {
        set.seed(seed)
    }
    # Random variables that follow the correlation matrix
    rdata <- matrix(rnorm(nvars * nobs, 0, 1), nrow = nvars, ncol = nobs)
    xmat <- cholesky %*% rdata
    # Transpose, convert to data, then tbl_df() require(tidyverse)
    dat <- t(xmat)
    dat <- as.data.frame(dat)
    return(dat)
}
