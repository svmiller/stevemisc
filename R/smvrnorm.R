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
