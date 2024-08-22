#' Compare Linear Smoother to LOESS Smoother for Your OLS Model
#'
#' @description \code{linloess_plot()} provides a visual diagnostic of the
#' linearity assumption of the OLS model. Provided an OLS model fit by
#' \code{lm()} in base R, the function extracts the model frame and creates a
#' faceted scatterplot. For each facet, a linear smoother and LOESS smoother
#' are estimated over the points. Users who run this function can assess just
#' how much the linear smoother and LOESS smoother diverge. The more they
#' diverge, the more the user can determine how much the OLS model is a good
#' fit as specified. The plot will also point to potential outliers that may
#' need further consideration.
#'
#' @details This function makes an implicit assumption that there is no variable
#' in the regression formula with the name ".y" or ".resid".
#'
#' It may be in your interest (for the sake of rudimentary diagnostic checks) to
#' disable the standard error bands for particularly ill-fitting linear models.
#'
#' @return \code{linloess_plot()} returns a faceted scatterplot as a
#' \pkg{ggplot2} object. The linear smoother is in solid blue (with blue
#' standard error bands) and the LOESS smoother is a dashed black line (with
#' gray/default standard error bands). You can add cosmetic features to it after
#' the fact. The function may spit warnings to you related to the LOESS smoother,
#' depending your data. I think these to be fine the extent to which this is
#' really just a visual aid and an informal diagnostic for the linearity
#' assumption.
#'
#' @author Steven V. Miller
#'
#' @param mod a fitted OLS model
#' @param resid logical, defaults to \code{TRUE}. If \code{FALSE}, the y-axis
#' on these plots are the raw values of the dependent variable. If \code{TRUE},
#' the y-axis is the model's residuals. Either work well here for the matter
#' at hand, provided you treat the output here as illustrative or suggestive.
#' @param se logical, defaults to \code{TRUE}. If \code{TRUE}, gives standard
#' error estimates with the assorted smoothers.
#' @param span a numeric, defaults to .75. An adjustment to the smoother. Higher
#' values permit smoother lines and might be warranted in the presence of
#' sparse pockets of the data.
#' @param smoother defaults to "loess", and is passed to the 'method' argument
#' for the non-linear smoother.
#' @param ... optional parameters, passed to the scatterplot
#' (\code{geom_point()}) component of this function. Useful if you want to make
#' the smoothers more legible against the points.
#'
#' @examples
#'
#' M1 <- lm(mpg ~ ., data=mtcars)
#'
#' linloess_plot(M1)
#' linloess_plot(M1, color="black", pch=21)


linloess_plot <- function(mod, resid = TRUE, smoother = "loess", se = TRUE, span = .75, ...) {
  modframe <- model.frame(mod)

  if(resid == FALSE) {

    dat <- gather(modframe, "var", "value", 2:ncol(modframe))
    colnames(dat)[1] <- c(".y")

    ggplot(dat, aes(.data$value, .data$.y)) +
      # Create your facet now since the var variable is the particular x variable.
      # Make sure to set scale="free_x" because these x variables are all on different scales
      ggplot2::facet_wrap(~var, scale="free_x") +
      # scatterplot
      geom_point(...) +
      # linear smoother
      geom_smooth(method="lm", fill="blue", se = se) +
      # smoother, with different color
      geom_smooth(method = smoother, color = "black", linetype = "dashed",
                  se = se, span = span)

  } else {
    modframe$.resid <- resid(mod)
    modframe <- modframe[c(".resid",names(modframe)[c(-1, -ncol(modframe))])]

    dat <- gather(modframe, "var", "value", 2:ncol(modframe))
    colnames(dat)[1] <- c(".resid")

    ggplot(dat, aes(.data$value, .data$.resid)) +
      # Create your facet now since the var variable is the particular x variable.
      # Make sure to set scale="free_x" because these x variables are all on different scales
      ggplot2::facet_wrap(~var, scale="free_x") +
      # scatterplot
      geom_point(...) +
      # linear smoother
      geom_smooth(method="lm", fill="blue", se = se) +
      # smoother, with different color
      geom_smooth(method = smoother, color = "black", linetype = "dashed",
                  se = se, span = span)
  }



}
