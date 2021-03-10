#' Scale a vector by one standard deviation
#'
#' @description \code{r1sd} allows you to rescale a numeric vector such that the
#' ensuing output has a mean of 0 and a standard deviation of 1.
#'
#' @details This is a convenience function since the default `rescale()` function
#' has some additional weirdness that is not welcome for my use cases. By default,
#' `na.rm` is set to TRUE.
#'
#' @param x a numeric vector
#' @param na what to do with NAs in the vector. Defaults to TRUE (i.e. passes over the missing observations)
#'
#' @return The function returns a numeric vector rescaled with a mean of 0 and a
#' standard deviation of 1.
#'
#' @examples
#'
#' x <- rnorm(100)
#' r1sd(x)



r1sd <- function(x, na = TRUE) {
  return((x - mean(x, na.rm = na)) / (1 * sd(x, na.rm = na)))
}
