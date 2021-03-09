#' Make Percentage Label for Proportion and Add Percentage Sign
#'
#' @description \code{make_perclab()} takes a proportion, multiplies it by 100, optionally rounds it, and pastes a percentage sign next ot it.
#'
#' @details This function is useful if you're modeling proportions in something like a bar chart
#' (for which proportions are more flexible) but want to label each bar as a percentage. The function here is mostly cosmetic.
#'
#' @param x a numeric vector
#' @return The function takes a proportion, multiplies it by 100, (optionally) rounds it to a set decimal point, and pastes a percentage sign next to it.
#'
#' @examples
#'
#' x <- runif(100)
#' make_perclab(x)


make_perclab <- function(x, n = 2) {
    return(paste0(round((x * 100), n), "%"))
}
