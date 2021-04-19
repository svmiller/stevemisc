#' Bounded Normal (Really: Scaled Beta) Distribution
#'
#' @description \code{rbnorm()} is a function to randomly generate values from a bounded normal
#' (really: a scaled beta) distribution with specified mean, standard deviation, and upper/lower bounds.
#' I use this function to randomly generate data that we treat as interval for sake of getting
#' means and standard  deviations, but have discernible bounds (and even skew) to teach students
#' about things like random sampling and central limit theorem.
#'
#' @details I call it "bounded normal" when it's really a beta distribution. I'm aware of this. I took
#' much of this code from somewhere. I forget where.
#'
#' @param n the number of observations to simulate
#' @param mean a mean to approximate
#' @param sd a standard deviation to approximate
#' @param lowerbound a lower bound for the data to be generated
#' @param upperbound an upper bound for the data to be generated
#' @param round whether to round the values to whole integers. Defaults to FALSE
#' @param seed set an optional seed
#'
#' @return The function returns a vector of simulated data approximating the user-specified conditions.
#'
#' @examples
#'
#' library(tibble)
#'
#' tibble(x = rbnorm(10000, 57, 14, 0, 100))
#' tibble(x = rbnorm(10000, 57, 14, 0, 100, round = TRUE))
#' tibble(x = rbnorm(10000, 57, 14, 0, 100, seed = 8675309))


rbnorm <- function(n, mean, sd, lowerbound, upperbound, round = FALSE, seed) {
    range <- upperbound - lowerbound
    m <- (mean - lowerbound) / range
    s <- sd / range
    a <- (m^2 - m^3 - m * s^2) / s^2  # calculate alpha for rbeta
    b <- (m - 2 * m^2 + m^3 - s^2 + m * s^2) / s^2  # calculate beta for rbeta
    if (missing(seed)) {
    } else {
        set.seed(seed)
    }
    data <- rbeta(n, a, b)  # generate the data
    data <- lowerbound + data * range  # squeeze it within the bounds.
    if (round == FALSE) {
        return(data)
    }
    if (round == TRUE) {
        data <- round(data)
        return(data)
    }
}
