#' Generate a Binned-Residual Plot from a Fitted Generalized Linear Model
#'
#' @description \code{binred_plot()} provides a visual diagnostic of the fit of
#'  the generalized linear model by "binning" the fitted and residual values
#'  from the model and showing where they may fall outside 95% error bounds.
#'
#' @details The number of bins the user wants is arbitrary. Gelman and Hill
#' (2007) say that, for larger data sets (n >= 100), the number of bins should
#' be the rounded-down square root of the number of observations from the model.
#' For models with a number of observations between 10 and 100, the number of
#' bins should be 10. For models with fewer than 10 observations, the number
#' of bins should be the rounded-down number of observations (divided by 2).
#' The default is the rounded square root of the number of observations in
#' the model. Be smart about what you want here.
#'
#' @return \code{bindred_plot()} returns a plot as a \pkg{ggplot2} object. The
#' *y*-axis is the mean residuals of the particular bin. The *x*-axis is the
#' mean fitted values from the bin. Error bounds are 95%. A LOESS smoother is
#' overlaid as a solid blue line.
#'
#' @author Steven V. Miller
#'
#' @param model a fitted GLM model, assuming link is "logit"
#' @param nbins number of "bins" for the calculation. Defaults to the rounded
#' square root of the number of observations in the model in the absence of a
#' user-specified override here.
#'
#' @examples
#'
#' M1 <- glm(vs ~ mpg + cyl + drat, data=mtcars, family=binomial(link="logit"))
#'
#' binred_plot(M1)


binred_plot <- function(model, nbins) {
  data <- model$data
  data$fitted <- model$fitted.values
  data$resid <- model$y - model$fitted.values #residuals(model, type = "response")

  n_mod <- nobs(model)

  if(missing(nbins)) {
    n_bins <- round(sqrt(n_mod))
  } else { # assuming user wants their own binnie-bin-bins
    n_bins <- nbins
  }

  breaks.index <- floor(length(model$fitted.values) * (1:(n_bins - 1)) / n_bins)
  breaks <- unique(c(-Inf, sort(model$fitted.values)[breaks.index], Inf))

  data <- subset(data, select=c("fitted", "resid"))
  data <- na.omit(data)

  data$bin <- as.numeric(cut(model$fitted.values, breaks))


  byfunc <- by(data, list(data$bin), function(x) {
    c(bin = unique(x$bin),
      min = min(x$fitted, na.rm = TRUE),
      max = max(x$fitted, na.rm = TRUE),
      n = nrow(x),
      meanfit = mean(x$fitted, na.rm = TRUE),
      meanresid = mean(x$resid, na.rm = TRUE),
      sdresid = sd(x$resid, na.rm = TRUE)
    )
  })

  data <- data.frame(do.call(rbind, byfunc))

  data$se <- p_z(.05)*(data$sdresid/sqrt(data$n))
  data$inbounds <- ifelse((data$meanresid > -(data$se)) & (data$meanresid < data$se), 1, 0)

  ggplot(data, aes(.data$meanfit, .data$meanresid)) +
    geom_point() +
    geom_smooth() +
    geom_ribbon(aes(ymin = -Inf, ymax = -.data$se), alpha = .1 , fill = "red") +
    geom_ribbon(aes(ymin = .data$se, ymax = Inf), alpha = .1 , fill = "red") +
    geom_line(aes(y = .data$se), colour = "grey70") +
    geom_line(aes(y = -.data$se), colour = "grey70") +
    geom_hline(yintercept = 0, linetype = "dashed")
}
