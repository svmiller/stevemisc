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
