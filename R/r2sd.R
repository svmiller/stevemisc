#' Scale a vector by two standard deviations
#'
#' @description \code{r2sd} allows you to rescale a numeric vector such that the
#' ensuing output has a mean of 0 and a standard deviation of .5.
#'
#' @details By default, `na.rm` is set to TRUE. If you have missing data, the function will just pass
#' over them.
#'
#' Gelman (2008) argues that rescaling by two standard deviations puts regression inputs
#' on roughly the same scale no matter their original scale. This allows for some honest, if preliminary,
#' assessment of relative effect sizes from the regression output. This does that, but
#' without requiring the \code{rescale} function from \pkg{arm}.
#' I'm trying to reduce the packages on which my workflow relies.
#'
#' Importantly, I tend to rescale only the ordinal and interval inputs and leave the binary inputs as 0/1.
#' So, my \code{r2sd} function doesn't have any of the fancier if-else statements that Gelman's \code{rescale}
#' function has.
#'
#' @param x a numeric vector
#' @param na what to do with NAs in the vector. Defaults to TRUE (i.e. passes over the missing observations)
#'
#' @return The function returns a numeric vector rescaled with a mean of 0 and a
#' standard deviation of .5.
#'
#' @references Gelman, Andrew. 2008. "Scaling Regression Inputs by Dividing by Two Standard Deviations." \emph{Statistics in Medicine} 27: 2865--2873.
#'
#' @examples
#'
#' x <- rnorm(100)
#' r2sd(x)



r2sd <- function(x, na = TRUE) {
    return((x - mean(x, na.rm = na)) / (2 * sd(x, na.rm = na)))
}
