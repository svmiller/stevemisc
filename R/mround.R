#' Multiply a Number by 100 and Round It (By Default: 2)
#'
#' @description \code{mround()} is a convenience function I wrote for my annotating bar charts that I make.
#' Assuming a proportion variable, \code{mround()} will multiply each value by 100 and round it for presentation.
#' By default, it rounds to two. The user can adjust this.
#'
#' @details This is a sister function of \code{make_perclab()} in the same package. This, however, won't add a percentage sign.
#'
#' @param x a numeric vector
#' @param d the number of decimal points to which the user wants to round. If this is not set, it rounds to two decimal points.
#'
#' @return The function takes a numeric vector, multiplies it by 100, rounds it (to two digits by default), and returns it
#' to the user.
#'
#' @examples
#'
#' x <- runif(100)
#' mround(x)
#' mround(x, 2) # same as above
#' mround(x, 3)

mround <- function(x, d = 2) {
    return(round((x * 100), d))
}
