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

#' Convert data frame to an object of class "tibble"
#'
#' @description \code{tbl_df()} ensures legacy compatibility with some of my scripts since the function is deprecated in \pkg{dplyr}.
#' \code{to_tbl()} also added for fun.
#'
#' @param ... optional parameters, but don't put anything here. It's just there to quell CRAN checks.
#' @rdname tbl_df
#'
#' @return This function takes a data frame and turns it into a tibble.
#'
#' @examples
#'
#' tbl_df(mtcars)
#' tbl_df(iris)
#'
#' @export

tbl_df <- function(...) tibble::as_tibble(...)

#' @rdname tbl_df
#' @export

to_tbl <- function(...) tibble::as_tibble(...)

#' Reorganize a factor after "re-leveling" it
#'
#' @description \code{fct_reorg()} is a \pkg{forcats} hack that reorganizes a factor after re-leveling it. It has been
#' situationally useful in my coefficient plots over the years.
#'
#' @details Solution comes by way of this issue on Github: \url{https://github.com/tidyverse/forcats/issues/45}
#'
#' @return This function takes a character or factor vector and first re-levels it before re-coding certain values. The end
#' result is a factor.
#'
#' @param fac a character or factor vector
#' @param ... optional parameters to be supplied to \pkg{forcats} functions.
#' @rdname fct_reorg
#' @examples
#'
#' x<-factor(c("a","b","c"))
#' fct_reorg(x, B="b", C="c")
#'
#' @export


fct_reorg <- function(fac, ...) {
  dots <- unname(list(...))

  fac <- do.call("fct_relevel", c(list(fac), dots))
  fac <- fct_recode(fac, ...)
  fac

}
