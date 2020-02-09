cor2data <- function(cor, n, seed){
  # number of observations to simulate
  nobs = n

  # Cholesky decomposition
  U = t(chol(cor))
  nvars = dim(U)[1]

  if(missing(seed)) {

  } else {
    set.seed(seed)
  }

  # Random variables that follow the correlation matrix
  rdata = matrix(rnorm(nvars*nobs,0,1), nrow=nvars, ncol=nobs)
  X = U %*% rdata
  # Transpose, convert to data, then tbl_df()
  # require(tidyverse)
  Data = t(X)
  Data = as.data.frame(Data)
  return(Data)
}

