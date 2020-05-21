smvrnorm <-
  function(n = 1, mu, Sigma, tol=1e-6, empirical = FALSE, EISPACK = FALSE, seed)
  {
    if(missing(seed)) {

    } else {
      set.seed(seed)
    }
    p <- length(mu)
    if(!all(dim(Sigma) == c(p,p))) stop("incompatible arguments")
    if(EISPACK) stop("'EISPACK' is no longer supported by R", domain = NA)
    eS <- eigen(Sigma, symmetric = TRUE)
    ev <- eS$values
    if(!all(ev >= -tol*abs(ev[1L]))) stop("'Sigma' is not positive definite")
    X <- matrix(rnorm(p * n), n)
    if(empirical) {
      X <- scale(X, TRUE, FALSE) # remove means
      X <- X %*% svd(X, nu = 0)$v # rotate to PCs
      X <- scale(X, FALSE, TRUE) # rescale PCs to unit variance
    }
    X <- drop(mu) + eS$vectors %*% diag(sqrt(pmax(ev, 0)), p) %*% t(X)
    nm <- names(mu)
    if(is.null(nm) && !is.null(dn <- dimnames(Sigma))) nm <- dn[[1L]]
    dimnames(X) <- list(nm, NULL)
    if(n == 1) drop(X) else t(X)
  }
