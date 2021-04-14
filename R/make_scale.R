#' Rescale Vector to Arbitrary Minimum and Maximum
#'
#' @description \code{make_scale()} will rescale any vector to have a user-defined minimum and maximum.
#'
#' @details This function is useful if you wanted to do some kind of minimum-maximum rescaling of a variable
#' on some given scale, prominently rescaling to a minimum of 0 and a maximum of 1 (thinking ahead to a regression).
#' The function is flexible enough for any minimum or maximum.
#'
#' @param x a numeric vector
#' @param minim a desired numeric minimum
#' @param maxim a desired numeric maximum
#'
#' @return The function takes a numeric vector and returns a rescaled version of it with the observed (desired) minimum, the observed (desired)
#' maximum, and rescaled values between both extremes.
#'
#' @examples
#'
#' x <- runif(100, 1, 100)
#' make_scale(x, 2, 5) # works
#' make_scale(x, 5, 2) # results in message
#' make_scale(x, 0, 1) # probably why you're using this.

make_scale <- function(x, minim, maxim) {
  if ( minim >= maxim) {
    message("The desired minimum should not be greater than or equal to the desired maximum. Try again.")
  } else {
  ((maxim - minim) * (x - min(x))) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE)) + minim
}
}
