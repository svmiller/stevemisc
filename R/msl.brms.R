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
#' presentation even as reviewers ask to see these.
#'
#' Right now, the only easy goodness of fit parameter to return is the number of
#' observations. The output of this function is easily customized ex post by the
#' user.
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
#' @examples
#'
#' \dontrun{
#' # this would take too much time to test...
#' library(stevedata)
#' library(brms)
#'
#' M1 <- brm(gc ~ ool + cvlhs + vl + fl + m + pd, data = Mitchell68,
#' backend = 'cmdstanr', cores = 4, chains = 4)
#'
#' msl.brms(M1)
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


