#' Find Non-Matching Elements
#'
#' @description \code{\%nin\%} finds non-matching elements in a given vector. It is the negation of \code{\%in\%}.
#'
#' @details This is a simple negation of \code{\%in\%}. I use it mostly for columns in a data frame.
#'
#' @param a a vector (character, factor, or numeric)
#' @param b a vector (character, factor, or numeric)
#'
#' @return \code{\%nin\%} finds non-matching elements and returns one of two things, depending on the use. For two simple vectors,
#' it will report what matches and what does not. For comparing a vector within a data frame, it has the effect of reporting the rows
#' in the data frame that do not match the supplied (second) vector.
#'
#' @examples
#'
#' library(tibble)
#' library(dplyr)
#'
#' # Watch this subset stuff
#'
#' dat <- tibble(x = seq(1:10), d = rnorm(10))
#' filter(dat, x %nin% c(3, 6, 9))
#'
#' @rdname nin
#' @export

`%nin%` <- function(a, b) {
  !a %in% b
}

#' Convert data frame to tibble
#'
#' @description \code{tbl_df()} ensures legacy compatibility with some of my scripts since the function is deprecated in \pkg{dplyr}.
#'
#' @param ... optional parameters, but don't put anything here. It's just there to quell CRAN checks.
#'
#' @examples
#'
#' tbl_df(mtcars)
#' tbl_df(iris)
#'
#' @export

tbl_df <- function(...) tibble::as_tibble(...)


