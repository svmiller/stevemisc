#' Generate Week of the Month from a Date
#'
#' @description \code{wom()} is a convenience function I use for constructing
#' calendars in \pkg{ggplot2}. It takes a date and returns, as a numeric
#' vector, the week of the month for the date given to it.
#'
#' @details \code{wom()} assumes Sunday is the start of the week. This can
#' assuredly be customized later in this function, but right now the assumption
#' is Sunday is the start of the week (and not Monday, as it might be in
#' other contexts).
#'
#' @param x a date

#' @return  \code{wom()} is a convenience function I use for constructing
#' calendars in \pkg{ggplot2}. It takes a date and returns, as a numeric
#' vector, the week of the month for the date given to it.
#'
#' @examples
#'
#' wom(as.Date("2022-01-01"))
#'
#' wom(Sys.Date())

wom <- function(x) {
  first <- as.Date(paste(format(x, "%Y"), format(x, "%m"), "01", sep="-"))
  first <- as.numeric(format(first, "%w"))+1

  return((as.numeric(format(x, "%d")) +(first-2)) %/% 7+1)
}


