#' Fit a Residual Plot of Your Linear Model
#'
#' @description \code{lmr_plot()} provides a visual diagnostic of the
#' linearity assumption of the linear model. Provided a linear model fit by
#' \code{lm()} in base R, the function extracts the model frame and creates a
#' faceted scatterplot. For each facet, a linear smoother and LOESS smoother
#' are estimated over the points. Users who run this function can assess just
#' how much the linear smoother and LOESS smoother diverge. The more they
#' diverge, the more the user can determine how much the linear model is a good
#' fit as specified. The plot will also point to potential outliers that may
#' need further consideration.
#'
#' @details This function makes an implicit assumption that there is no variable
#' in the regression formula with the name ".resid".
#'
#' It may be in your interest (for the sake of rudimentary diagnostic checks) to
#' disable the standard error bands for particularly ill-fitting linear models.
#'
#' This function will ignore interactions in your model, returning only the
#' first-order terms in the model's specification.
#'
#' @return \code{lmr_plot()} returns a faceted scatterplot as a
#' \pkg{ggplot2} object. The linear smoother is flat at 0 by definition and
#' is depicted by a black dashed line. The LOESS smoother is a blue line. You can
#' add cosmetic features to it after the fact. The function may spit warnings to
#' you related to the LOESS smoother, depending your data and whether you have
#' disabled the warnings in the function. I think these to be fine the extent to
#' which this is really just a visual aid and an informal diagnostic for the
#' linearity assumption in a specified model.
#'
#' @author Steven V. Miller
#'
#' @param mod a fitted model, ideally a simple linear model
#' @param se logical, defaults to \code{FALSE}. If \code{TRUE}, gives standard
#' error estimates with the assorted smoothers.
#' @param span a numeric, defaults to .75. An adjustment to the smoother. Higher
#' values permit smoother lines and might be warranted in the presence of
#' sparse pockets of the data.
#' @param smoother defaults to "loess", and is passed to the 'method' argument
#' for the non-linear smoother in `geom_smooth()`.
#' @param dummies logical, defaults to \code{FALSE}. If \code{FALSE}, removes
#' binary independent variables from the plot. If \code{TRUE}, facets appear for
#' binary independent variables. You should probably keep this as \code{FALSE}
#' for your own use cases.
#' @param warning logical, defaults to \code{TRUE}. If \code{TRUE},
#' the plot suppresses assorted warnings from the LOESS smoother that would
#' otherwise be cautioning you about things your eyes could otherwise see.
#' @param robust logical, defaults to \code{FALSE}. If \code{TRUE}, employs robust
#' smoothing in which large residuals are downweighted while fitting.
#' @param degree takes either 1 or 2 and passes argument to \code{geom_smooth()}
#' call in the function. 1 = linear local fits. 2 = quadratic local fits.
#' @param ... optional parameters, passed to the scatterplot in \code{lmr_plot()}
#' (\code{geom_point()}) component of this function. Useful if you want to make
#' the smoothers more legible against the points.
#'
#' @examples
#'
#' set.seed(8675309) # Don't need this updating every time...
#' x1 <- rnorm(500)
#' x2 <- rnorm(500)
#' e <- rnorm(500)
#' y <- 5 + .5*x1 + .5*x2 + e
#'
#' M1 <- lm(y ~ x1 + x2)
#'
#' lmr_plot(M1)
#' lmr_plot(M1, color="black", pch=21)
#'



#' @rdname lmr.plot
#' @export
#'
lmr_plot <- function(mod, smoother = "loess", se = FALSE, span = .75,
                     dummies = FALSE, warning = TRUE, degree = 2,
                     robust = FALSE, ...) {

  # modmatdat <- as.data.frame(model.matrix(mod))
  # modmatdat$`(Intercept)` <- NULL
  # modmatdat$.resid  <- resid(mod)
  # modmatdat <- modmatdat[,c(which(colnames(modmatdat)==".resid"),which(colnames(modmatdat)!=".resid"))]

  # dat <- data.frame(modmatdat[rep(seq_len(nrow(modmatdat)), times = ncol(modmatdat) - 1), 1, drop = FALSE],
  #                   var = rep(names(modmatdat)[-1], each = nrow(modmatdat)),
  #                   value = unlist(modmatdat[-1], use.names = FALSE),
  #                   row.names = NULL)

  modframe <- model.frame(mod)
  colnames(modframe)[1] <- ".resid"
  modframe$.resid <- resid(mod)

  if(dummies == FALSE) {

    modframe <- modframe[, sapply(modframe, function(col) length(na.omit(unique(col)))) > 2]

  }

  dat <- data.frame(modframe[rep(seq_len(nrow(modframe)), times = ncol(modframe) - 1), 1, drop = FALSE],
                    var = rep(names(modframe)[-1], each = nrow(modframe)),
                    value = unlist(modframe[-1], use.names = FALSE),
                    row.names = NULL)

  ggplot(dat, aes(.data$value, .data$.resid)) +
    # Create your facet now since the var variable is the particular x variable.
    # Make sure to set scale="free_x" because these x variables are all on different scales
    ggplot2::facet_wrap(~var, scale="free_x") +
    # scatterplot
    geom_point(...) +
    # linear smoother
    geom_smooth(method="lm", color="black", linetype = 'dashed', se = FALSE) +
    # smoother, with different color
    geom_smooth(method = smoother, color = "blue",
                se = se, span = span,
                method.args = list(degree = degree,
                                   family = if (robust) "symmetric" else "gaussian")) -> plot

  if(warning == TRUE) {
    class(plot) <- c("lmr.plot", class(plot))
  }


  return(plot)

}

#' Print method for class 'lmr.plot'
#'
#' @param x a ggplot object with this special 'lmr.plot' class
#' @param ... Additional arguments (passed to the scatterplot in \code{lmr.plot()}, not used in the print function
#' @keywords internal
#' @rdname lmr.plot
#' @export
print.lmr.plot <- function(x, ...) {
  class(x) <- setdiff(class(x), "lmr.plot")
  suppressWarnings(print(x, ...))
}
