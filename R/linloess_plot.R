#' Compare Linear Smoother to LOESS Smoother for Your OLS Model
#'
#' @description \code{linloess_plot()} provides a visual diagnostic of the linearity assumption of the OLS model.
#'  Provided an OLS model fit by \code{lm()} in base R, the function extracts the model frame and creates a faceted
#'  scatterplot. For each facet, a linear smoother and LOESS smoother are estimated over the points. Users who run
#'  this function can assess just how much the linear smoother and LOESS smoother diverge. The more they diverge, the
#'  more the user can determine how much the OLS model is a good fit as specified. The plot will also point to potential
#'  outliers that may need further consideration.
#'
#' @details This function makes an implicit assumption that there is no variable in the regression
#'  formula with the name ".y".
#'
#' @return \code{linloess_plot()} returns a faceted scatterplot as a \pkg{ggplot2} object. You can add cosmetic features
#' to it after the fact.
#'
#' @author Steven V. Miller
#'
#' @param mod a fitted OLS model
#'
#' @examples
#'
#' M1 <- lm(mpg ~ ., data=mtcars)
#'
#' linloess_plot(M1)
#'


linloess_plot <- function(mod) {
  modframe <- model.frame(mod)

  dat <- gather(modframe, "var", "value", 2:ncol(modframe))
  colnames(dat)[1] <- c(".y")

  ggplot(dat, aes(value, .y)) +
    # Create your facet now since the var variable is the particular x variable.
    # Make sure to set scale="free_x" because these x variables are all on different scales
    facet_wrap(~var, scale="free_x") +
    # scatterplot
    geom_point() +
    # linear smoother
    geom_smooth(method="lm") +
    # loess smoother, with different color
    geom_smooth(method="loess", color="black", linetype="dashed")

}
