#' Create Custom \pkg{modelsummary} List from a Model Fitted in \pkg{brms}
#'
#' @description
#'
#' \code{msl.brms()} is a convenience function for preparing a model fitted in
#' \pkg{brms} for presentation in \pkg{modelsummary}  using its custom
#' "modelsummary_list" feature.
#'
#' @details
#'
#' Bayesians typically recoil at the thought of reporting *p*-values for
#' presentation even as reviewers ask to see these. The *p*-value in question is
#' the "probability of direction" of an effect's existence. Makowski et al. (2019)
#' is a worthwhile read on this procedure. The function calculates what they
#' propose but doesn't require \pkg{bayestestR} as a dependency.
#'
#' Right now, the only easy goodness of fit parameter to return is the number of
#' observations. The output of this function is easily customized ex post by the
#' user.
#'
#' The function scrubs the `b_` prefix in the terms, which is is a convention of
#' the modeling procedure in \pkg{brms}.
#'
#' @param mod a model fitted in \pkg{brms}
#' @param robust logical, defaults to FALSE. If FALSE, the "tidy" estimates
#' are the mean of the simulated coefficients and the standard deviation of those
#' coefficients. If TRUE, the "tidy" estimates are the median and median absolute
#' deviation.
#'
#' @return
#'
#' \code{msl.brms()} takes a model fitted by \pkg{brms} and prepares a custom
#' \pkg{modelsummary} list for formatting with that package's `modelsummary()`
#' function.
#'
#' @references
#'
#' Makowski, Dominique, Mattan S. Ben-Shachar, S. H. Annabel Chen, & Daniel
#' Lüdecke. 2019.  "Indices of Effect Existence and Significance in the Bayesian
#' Framework." *Frontiers in Psychology* (10)2767.
#'
#' @examples
#'
#' \dontrun{
#' # this would take too much time to test...
#' library(stevedata)
#' library(brms)
#'
#' # This is typically how I do it. 4 chains, 4 cores. backend is cmdstanr.
#' M1 <- brm(gc ~ ool + cvlhs + vl + fl + m + pd, data = Mitchell68,
#' backend = 'cmdstanr', cores = 4, chains = 4)
#'
#' MSL <- msl.brms(M1)
#'
#' MSL
#'
#' # You can customize this output if you know how {modelsummary} does things.
#' # For example:
#'
#' MSL$glance$r.squared <- as.vector(bayes_R2(M1, robust = TRUE))[1]
#' MSL$glance$adj.r.squared <- as.vector(loo_R2(M1, robust = TRUE))[1]
#'
#' }

msl.brms <- function(mod, robust = FALSE) {

  if(robust == FALSE) {

    modsum <- summary(mod, robust = FALSE)

  } else { # robust = TRUE

    modsum <- summary(mod, robust = TRUE)

  }

  ti <- data.frame(term = row.names(modsum$fixed),
                   estimate = modsum$fixed$Estimate,
                   std.error = modsum$fixed$Est.Error)

  moddraws <- as.matrix(mod)
  bdraws <- moddraws[, grepl("b_", colnames(moddraws))]

  calcpval <- function(x) {

    aa <- max(sum(x > 0), sum(x < 0))/length(x)
    aaa <- 2*(1 - aa)
    return(aaa)

  }

  ppp <- apply(bdraws, 2, calcpval)

  dppp <- data.frame(term = names(ppp), p.value = as.numeric(ppp))
  dppp$term <- sub("^b_", "", dppp$term)

  ti <- merge(ti, dppp, by.x = "term", by.y = "term", sort = FALSE)


  gl <- data.frame(nobs = nrow(mod$data))

  msl <- list(
    tidy = ti,
    glance = gl)

  class(msl) <- "modelsummary_list"
  return(msl)

}


