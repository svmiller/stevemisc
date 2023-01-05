#' Get Simulations from a Model Object (with New Data)
#'
#' @description \code{get_sims()} is a function to simulate quantities of interest from a
#' multivariate normal distribution for "new data" from a regression model.
#'
#' @details This (should) be a flexible function that takes a \code{merMod} object
#' (estimated from \pkg{lme4}, \pkg{blme}, etc.) or a \code{lm} or \code{glm} object and
#' generates some quantities of interest when paired with new data of observations of interest.
#' Of note: I've really only tested this function with linear models, generalized linear models,
#' and their mixed model equivalents. For mixed models, this approach does not offer support for
#' the incorporation of the random effects or the random slopes. It's just for the fixed effects,
#' which is typically what most people want anyway. Users who want to better incorporate the
#' random intercepts or slope could find that support in the \pkg{merTools} package.
#'
#' @name get_sims
#'
#' @param model a model object
#' @param newdata A data frame on some quantities of interest to be simulated
#' @param nsim Number of simulations to be run
#' @param seed An optional seed to set
#'
#' @return \code{get_sims()} returns a data frame (as a \code{tibble}) with the quantities
#' of interest and identifying information about the particular simulation number.
#'
#' @author Steven V. Miller
#'
#' @examples
#' \dontrun{
#' # Note: these models are dumb, but they illustrate how it works.
#'
#' M1 <- lm(mpg ~ hp, mtcars)
#' # Note: this function requires the DV to appear somewhere, anywhere in the "new data"
#' newdat <- data.frame(mpg = 0,
#'                      hp = c(mean(mtcars$hp) - sd(mtcars$hp),
#'                             mean(mtcars$hp),
#'                             mean(mtcars$hp) + sd(mtcars$hp)))
#'
#' get_sims(M1, newdat, 100, 8675309)
#'
#' # Note: this is likely a dumb model, but illustrates how it works.
#' mtcars$mpgd <- ifelse(mtcars$mpg > 25, 1, 0)
#'
#' M2 <- glm(mpgd ~ hp, mtcars, family=binomial(link="logit"))
#'
#' # Again: this function requires the DV to be somewhere, anywhere in the "new data"
#' newdat$mpgd <- 0
#'
#' # Note: the simulations are returned on their original "link". Here, that's a "logit"
#' # You can adjust that accordingly. `plogis(y)` will convert those to probabilities.
#' get_sims(M2, newdat, 100, 8675309)
#'
#' library(lme4)
#' M3 <- lmer(mpg ~ hp + (1 | cyl), mtcars)
#'
#' # Random effects are not required here since we're passing over them.
#' get_sims(M3, newdat, 100, 8675309)
#' }
#'
#' @export
#'

get_sims <- function(model, newdata, nsim, seed) {
    if (missing(seed)) {

    } else {
        set.seed(seed)
    }
    modelsim <- sim(model, n.sims = nsim)
    modmat <- model.matrix(terms(model), newdata)
    the_sims <- tibble(y = numeric(), sim = numeric())
    for (i in (1:nsim)) {
        if (is(model, "lm") == TRUE | is(model, "glm") == TRUE) {
            yi <- modmat %*% coef(modelsim)[i, ]
        } else {
            # assuming it's merMod
            yi <- modmat %*% coef(modelsim)$fixef[i, ]
        }
        simval <- rep(i, length(yi))
        hold_me <-  suppressMessages(as.data.frame(cbind(yi, simval)))
        the_sims <- rbind(the_sims, hold_me)
    }
    names(the_sims) <- c("y", "sim")
    the_sims <- as_tibble(the_sims)
    return(the_sims)
}

