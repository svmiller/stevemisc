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
