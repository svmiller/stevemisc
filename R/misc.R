#' Find Non-Matching Elements
#'
#' @description \code{%nin%} finds non-matching elements in a given vector. It is the negation of \code{%in%}.
#'
#' @details This is a simple negation of \code{%in%}. I use it mostly for columns in a data frame.
#'
#' @param a a vector (character, factor, or numeric)
#' @param b a vector (character, factor, or numeric)
#'
#' @return \code{%nin%} finds non-matching elements and returns one of two things, depending on the use. For two simple vectors,
#' it will report what matches and what does not. For comparing a vector within a data frame, it has the effect of reporting the rows
#' in the data frame that do not match the supplied (second) vector.
#'
#' @name %nin%
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
#' @internal
#' @noRd

"%nin%" <- function(a, b) {
  !a %in% b
}

#' Convert data frame to tibble
#'
#' @description \code{tbl_df()} ensures legacy compatibility with some of my scripts since the function is deprecated in \code{dplyr}.
#'
#' @internal
#' @noRd

tbl_df <- tibble::as_tibble

jenny <- function(x = 8675309) {
  if(missing(x)) {
    set.seed(x)
  if("emo" %in% rownames(installed.packages())) {
    message(paste0(emo::ji("music"), " Jenny, I got your number..."))
  } else {
    message("Jenny, I got your number...")
  }
  } else {
    message("Why are you using this function with some other reproducible seed...")
  }
}
