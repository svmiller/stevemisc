#' Simulate a Phillips-Perron Test to Assess Unit Root in a Time Series
#'
#' @description \code{spp_test()} provides a simulation approach to assessing
#' unit root in a time series by way of the Phillips-Perron test. It takes a
#' vector and performs three Phillips-Perron tests (no drift, no trend; drift, no
#' trend; drift and trend) and calculates both rho and tau statistics as one
#' normally would. Rather than interpolate or approximate a *p*-value, it
#' simulates some user-specified number of Phillips-Perron tests of a known,
#' white-noise time series matching the length of the time series the user
#' provides. This allows the user to make assessments of non-stationarity or
#' stationarity by way of simulation rather than approximation from received
#' critical values by way of books or these some years out of date.
#'
#' @details Some knowledge of Augmented Dickey-Fuller and the Phillips-Perron
#' procedure is assumed here. Generally, the Phillips-Perron test purports to
#' build on the Augmented Dickey-Fuller procedure through two primary means. The
#' first is relaxing the need to specify or assume lag structures ad hoc or ex
#' ante. Only a short-term lag or long-term lag are necessary. The second is
#' that its robust to various forms of heteroskedasticity in the error term.
#'
#' The short-term and long-term lags follow the convention introduced in the
#' Phillips-Perron test. The short-term lag uses the default number of
#' Newey-West lags, defined as the floor of 4*(n/100)^.25 where `n` is the length
#' of the time series. The long-term lag substitutes 4 for 12 in this equation.
#'
#' This function specifies three different types of tests: 1) no drift, no trend,
#' 2) drift, no trend, and 3) drift and trend. In the language of the `lm()`
#' function, the first is `lm(y ~ ly - 1)` where `y` is the value of `y` and
#' `ly` is its first-order lag. The second test is `lm(y ~ ly)`, intuitively
#' suggesting the *y*-intercept in this equation is the "drift". The third would
#' be `lm(y ~ ly + t)` with `t` being a simple integer that increases by 1 for
#' each observation (i.e. a time-trend).
#'
#' There are two types of statistics in the Phillips-Perron test: rho and tau.
#' Of the two, tau is the more intuitive statistic and compares favorably to its
#' corollary statistic in the Augmented Dickey-Fuller test. It's why you'll
#' typically see tau reported as the statistic of interest in other
#' implementations. rho has its utility for more advanced diagnostics, though.
#' Both are calculated in this function, though tau is the default statistic.
#'
#' @return \code{spp_test()} returns a list of length 2 or 3. The first element
#' in the list is a matrix of rho statistics and tau statistics calculated by
#' the Phillips-Perron test. The second element is a data frame of the simulated
#' rho and tau statistics of a known, white-noise time series. If the user asks
#' for an interpretation of the results in the console, the message is also
#' added as the third element in the list for posterity.
#'
#' @author Steven V. Miller
#'
#' @param x a vector
#' @param lag_short logical, defaults to \code{TRUE}. If \code{TRUE}, the
#' "short-term" lag is used for the Phillips-Perron test. If \code{FALSE}, the
#' "long-term" lag is used.
#' @param n_sims the number of simulations for calculating an interval or
#' distribution of test statistics of a white-noise time series. Defaults to
#' 1,000.
#' @param interpret logical, defaults to \code{TRUE}. If \code{TRUE}, the user
#' gets a message summarizing the simulations and what they mean for assessing
#' non-stationarity or stationarity.
#' @param pp_stat what type of Phillip-Perron test statistic should be summarized
#' and returned to the user. Must be either "tau" or "rho".
#'
#' @examples
#'
#' a <- rnorm(25) # white noise
#' b <- cumsum(a) # random walk
#'
#' spp_test(a, n_sims = 25, interpret = FALSE)
#' spp_test(b, n_sims = 25)

spp_test <- function(x, lag_short = TRUE, n_sims = 1000, interpret = TRUE,
                     pp_stat = "tau") {

  if (!pp_stat %in% c("tau", "rho") | length(pp_stat) > 1) {
    stop("The only 'pp_stat' arguments that make sense in this context is 'tau' or 'rho'. Pick one of the two.")
  }


  m <- embed(x, 2)
  dat <- data.frame(y = m[, 1], ly = m[, 2])
  dat$t <- 1:length(dat$y)

  n <- length(dat$y)

  M1 <- lm(y ~ ly - 1, dat) # no drift, no trend
  M2 <- lm(y ~ ly, dat) # drift, no trend
  M3 <- lm(y ~ ly + t, dat) # drift and trend


  if(lag_short == TRUE) {
    q <- floor(4*(n/100)^0.25)
  } else {
    q <-  floor(12*(n/100)^0.25)
  }

  get_z_stats <- function(mod, m) {
    index <- ifelse(m > 1, 2, 1)
    resids <- resid(mod)
    est_rho <- summary(mod)$coefficients[index,1]
    est_sig <- summary(mod)$coefficients[index,2]
    s2 <- sum(resids^2)/(n - m)
    gamma <- numeric(q + 1)
    for (i in 1:(q + 1)) {
      u <- embed(resids, i)
      gamma[i] = sum(u[,1]*u[,i])/n
    }
    lambda2 <- gamma[1] + 2*sum((1 - 1:q/(q + 1))*gamma[-1])
    z_rho <- n*(est_rho - 1) - n^2*est_sig^2/s2*(lambda2 - gamma[1])/2
    z_tau <- sqrt(gamma[1]/lambda2)*(est_rho - 1)/est_sig -
      (lambda2 - gamma[1])*n*est_sig/(2*sqrt(lambda2*s2))
    return(c(z_rho, z_tau))
  }


  Stats <- rbind(get_z_stats(M1,1),
                get_z_stats(M2,2),
                get_z_stats(M3,3))


  Sims <- data.frame()
  for (i in 1:n_sims) {
    fake_x <- rnorm(length(x))

    fm <- embed(fake_x, 2)
    fdat <- data.frame(y = fm[, 1], ly = fm[, 2])
    fdat$t <- 1:length(fdat$y)

    fn <- length(fdat$y)

    fM1 <- lm(y ~ ly - 1, fdat) # no drift, no trend
    fM2 <- lm(y ~ ly, fdat) # drift, no trend
    fM3 <- lm(y ~ ly + t, fdat) # drift and trend

    fakeStats <- rbind(get_z_stats(fM1, 1),
                   get_z_stats(fM2, 2),
                   get_z_stats(fM3, 3))

    fakeStats <- data.frame(fakeStats)
    names(fakeStats) <- c("z_rho", "z_tau")
    fakeStats$sim <- i
    fakeStats$cat <- c("No Drift, No Trend", "Drift, No Trend", "Drift and Trend")

    Sims <- rbind(Sims, fakeStats)


  }

  output <- list("stats" = Stats,
                 "sims" = Sims)


  if(interpret == TRUE) {

    if(pp_stat == "tau") {

      tau_stats <- output$stats[1:3, 2]

      tau_results <- do.call(rbind, with(output$sims, {
        lapply(split(z_tau, cat), function(x) {
          data.frame(
            mean = mean(x),
            lwr = quantile(x, probs = 0.05),
            upr = quantile(x, probs = 0.95)
          )
        })
      }))

      tau_results$cat <- rownames(tau_results)
      rownames(tau_results) <- NULL

      stat_sum <- paste0("Your tau statistics were: ", round(tau_stats[1], 3), " (no drift, no trend), ",
                              round(tau_stats[2], 3), " (drift, no trend), and ", round(tau_stats[3], 3),
                              " (drift and trend). The mean across ", n_sims,
                              " simulations of a white noise time series of the length of your time series returns simulated means (and 95% intervals) of ",
                              round(subset(tau_results, cat == 'No Drift, No Trend')[1,1], 3), " (",
                              round(subset(tau_results, cat == 'No Drift, No Trend')[1,2], 3),", ",
                              round(subset(tau_results, cat == 'No Drift, No Trend')[1,3], 3),") [no drift, no trend], ",
                              round(subset(tau_results, cat == 'Drift, No Trend')[1,1], 3), " (",
                              round(subset(tau_results, cat == 'Drift, No Trend')[1,2], 3),",",
                              round(subset(tau_results, cat == 'Drift, No Trend')[1,3], 3),") [drift, no trend], and ",
                              round(subset(tau_results, cat == 'Drift and Trend')[1,1], 3), " (",
                              round(subset(tau_results, cat == 'Drift and Trend')[1,2], 3),", ",
                              round(subset(tau_results, cat == 'Drift and Trend')[1,3], 3),") [drift and trend]."
      )


    } else if (pp_stat == "rho") {

      rho_stats <- output$stats[1:3, 1]


      rho_results <- do.call(rbind, with(output$sims, {
        lapply(split(z_rho, cat), function(x) {
          data.frame(
            mean = mean(x),
            lwr = quantile(x, probs = 0.05),
            upr = quantile(x, probs = 0.95)
          )
        })
      }))

      rho_results$cat <- rownames(rho_results)
      rownames(rho_results) <- NULL



      stat_sum <- paste0("Your rho statistics were ", round(rho_stats[1], 3), " (no drift, no trend), ",
                              round(rho_stats[2], 3), " (drift, no trend), and ", round(rho_stats[3], 3),
                              " (drift and trend). The mean across ", n_sims,
                              " simulations of a white noise time series of the length of your time series returns simulated means (and 95% intervals) of ",
                              round(subset(rho_results, cat == 'No Drift, No Trend')[1,1], 3), " (",
                              round(subset(rho_results, cat == 'No Drift, No Trend')[1,2], 3),", ",
                              round(subset(rho_results, cat == 'No Drift, No Trend')[1,3], 3),") [no drift, no trend], ",
                              round(subset(rho_results, cat == 'Drift, No Trend')[1,1], 3), " (",
                              round(subset(rho_results, cat == 'Drift, No Trend')[1,2], 3),",",
                              round(subset(rho_results, cat == 'Drift, No Trend')[1,3], 3),") [drift, no trend], and ",
                              round(subset(rho_results, cat == 'Drift and Trend')[1,1], 3), " (",
                              round(subset(rho_results, cat == 'Drift and Trend')[1,2], 3),", ",
                              round(subset(rho_results, cat == 'Drift and Trend')[1,3], 3),") [drift and trend]."
      )


    }

    interp_message <- paste0(stat_sum, "\n\nFor any one of those three statistics, if your *particular* test statistic is not included in those corresponding intervals, it is strongly suggestive of non-stationarity as it would be incompatible with a pure stationary, white-noise time series across these ", n_sims,
                             " simulations.\n\nThe actual simulations are available to you in the output of this function for further exploration or inference by other intervals. This message has also been attached as an element in the list output produced by this function.")

    output$summary <- interp_message

    message(interp_message)

  } else {

  }

  return(output)


}
