#' Reverse code a numeric variable
#'
#' @description \code{revcode} allows you to reverse code a numeric variable. If, say,
#' you have a Likert item that has values of 1, 2, 3, 4, and 5, the function inverts
#' the scale so that 1 = 5, 2 = 4, 3 = 3, 4 = 2, and 5 = 1.
#'
#' @details This function passes over NAs you may have in your variable. It does assume,
#' reasonably might I add, that the observed values include both the minimum and the maximum.
#' This is usually the case in a discrete ordered-categorical variable (like a Likert item).
#'
#' @param x a numeric vector
#'
#' @return The function returns a numeric vector that reverse codes the the
#' numeric vector that was supplied to it.
#'
#' @examples
#'
#' data.frame(x1 = rep(c(1:7, NA), 2),
#'       x2 = c(1:10, 1:4, NA, NA),
#'      x3 = rep(c(1:4), 4)) -> example_data
#'
#' library(dplyr)
#' library(magrittr)
#'
#' example_data %>% mutate_at(vars("x1", "x2", "x3"), ~revcode(.))

revcode <- function(x) {
  len <- length(na.omit(unique(x)))+1
  return((x*-1) + len)
}
