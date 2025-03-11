#' Residual Density Plot for Linear Models
#'
#' @description \code{rd_plot()} provides a visual diagnostic of the normality
#'  assumption of the linear model. Provided an OLS model fit by \code{lm()} in
#'  base R, the function extracts the residuals of the model and creates
#'  a density plot of those residuals (solid black line) against a standard
#'  normal distribution with a mean of 0 and a standard deviation matching the
#'  standard deviation of the residuals from the model. The function may be used
#'  for diagnostic purposes.
#'
#' @details The user can always add \pkg{ggplot2} elements on top of this for
#' greater legibility/clarity. For example, density plots can be finicky about
#' making observations appear where they don't. Perhaps adjusting the scale
#' of \code{x} ad hoc, after the fact, may be warranted.
#'
#' The goal of this function is to emphasize that in many real world applications,
#' the normality assumption of the residuals is never held but can often be
#' reasonably approximated upon visual inspection.
#'
#' @return \code{rd_plot()} returns a density plot a \pkg{ggplot2} object. A
#' density plot of the actual residuals is a solid black line. A stylized normal
#' distribution matching the description of the residuals is the blue dashed
#' line.
#'
#' @author Steven V. Miller
#'
#' @param mod a fitted linear model
#' @param ... optional arguments, intended for adjusting the line width.
#'
#' @examples
#'
#' M1 <- lm(mpg ~ hp + disp, data = mtcars)
#'
#' rd_plot(M1)
#' rd_plot(M1, linewidth = 1.1)


rd_plot <- function(mod, ...) {

  sdr <- sd(resid(mod), na.rm=T)

  hold_this <- data.frame(x = resid(mod))

  ggplot(hold_this, aes(x)) +
    geom_density(...) +
    stat_function(fun = dnorm, color="blue",
                  args = list(mean = 0, sd = sdr),
                  linetype="dashed", ...)


}
