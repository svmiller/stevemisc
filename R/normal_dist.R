#' Make and annotate a normal distribution with \pkg{ggplot2}
#'
#' @description \code{normal_dist()} is a convenience function for making a plot of a normal distribution
#' with annotated areas underneath the normal curve.
#'
#' @details The normal distribution is a standard normal distribution with a mean of 0 and a standard deviation of 1.
#'
#' @param curvecolor What color should the curve itself be. Any \pkg{ggplot2}-recognized format should do here.
#' @param fillcolor What color should the area underneath the curve be. Any \pkg{ggplot2}-recognized format should do here.
#' @param fontfamily Font family for labeling areas underneath the curve. OPTIONAL. You can omit this if you'd like.
#'
#' @return The function returns a fancy plot of a normal distribution annotated with areas underneath the hood. Note that
#' whatever color is supplied in \code{fillcolor} is automatically lightened for areas further from the center of the druve.
#'
#' @examples
#'
#' library(stevemisc)
#' normal_dist("blue","red")
#' normal_dist("purple","orange")

normal_dist <- function(curvecolor, fillcolor, fontfamily) {
    if (missing(fontfamily)) {
        ggplot(data.frame(x = c(-4, 4)), aes(.data$x)) +
            stat_function(fun = dnorm,
                          xlim = c(qnorm(.05), abs(qnorm(.05))), size = 0,
                          geom = "area", fill = fillcolor, alpha = 0.5) +
            stat_function(fun = dnorm,
                          xlim = c(qnorm(.025), abs(qnorm(.025))), size = 0,
                          geom = "area", fill = fillcolor, alpha = 0.4) +
            stat_function(fun = dnorm,
                          xlim = c(qnorm(.005), abs(qnorm(.005))), size = 0,
                          geom = "area", fill = fillcolor, alpha = 0.3) +
            geom_segment(x = 1, y = 0, xend = 1, yend = dnorm(1, 0, 1),
                         color = "white", linetype = "dashed") +
            geom_segment(x = -1, y = 0, xend = -1, yend = dnorm(1, 0, 1),
                         color = "white", linetype = "dashed") +
            annotate(geom = "text", x = 0, y = 0.2,
                     label = "68%", size = 4.5, color = "white") +
            geom_segment(x = -0.15, y = .2, xend = -.99, yend = .2,
                         color = "white",
                         arrow = arrow(length = unit(0.15, "cm"))) +
            geom_segment(x = 0.15, y = .2, xend = .99, yend = .2,
                         color = "white",
                         arrow = arrow(length = unit(0.15, "cm"))) +
            annotate(geom = "text", x = 0, y = 0.1,
                     label = "90%", size = 4.5, color = "white") +
            geom_segment(x = -0.15, y = .1, xend = -1.64, yend = .1,
                         color = "white",
                         arrow = arrow(length = unit(0.15, "cm"))) +
            geom_segment(x = 0.15, y = .1, xend = 1.64, yend = .1,
                         color = "white",
                         arrow = arrow(length = unit(0.15, "cm"))) +
            annotate(geom = "text", x = 0, y = 0.05,
                     label = "95%", size = 4.5, color = "white") +
            geom_segment(x = -0.15, y = .05, xend = -1.95, yend = .05,
                         color = "white",
                         arrow = arrow(length = unit(0.15, "cm"))) +
            geom_segment(x = 0.15, y = .05, xend = 1.95, yend = .05,
                         color = "white",
                         arrow = arrow(length = unit(0.15, "cm"))) +
            annotate(geom = "text", x = 0, y = 0.01,
                     label = "99%", size = 4.5, color = "white") +
            geom_segment(x = -0.15, y = .01, xend = -2.57, yend = .01,
                         color = "white",
                         arrow = arrow(length = unit(0.15, "cm"))) +
            geom_segment(x = 0.15, y = .01, xend = 2.57, yend = .01,
                         color = "white",
                         arrow = arrow(length = unit(0.15, "cm"))) +
            stat_function(fun = dnorm, color = curvecolor, size = 1.5) +
            scale_x_continuous(breaks = c(-4, -2.58, -1.96, -1.645, -1, 0,
                                        1, 1.645, 1.96, 2.58, 4))
    } else {
        ggplot(data.frame(x = c(-4, 4)), aes(.data$x)) +
            stat_function(fun = dnorm,
                          xlim = c(qnorm(.05), abs(qnorm(.05))), size = 0,
                          geom = "area", fill = fillcolor, alpha = 0.5) +
            stat_function(fun = dnorm,
                          xlim = c(qnorm(.025), abs(qnorm(.025))), size = 0,
                          geom = "area", fill = fillcolor, alpha = 0.4) +
            stat_function(fun = dnorm,
                          xlim = c(qnorm(.005), abs(qnorm(.005))), size = 0,
                          geom = "area", fill = fillcolor, alpha = 0.3) +
            geom_segment(x = 1, y = 0, xend = 1, yend = dnorm(1, 0, 1),
                         color = "white", linetype = "dashed") +
            geom_segment(x = -1, y = 0, xend = -1, yend = dnorm(1, 0, 1),
                         color = "white", linetype = "dashed") +
            annotate(geom = "text", x = 0, y = 0.2,
                     label = "68%", size = 4.5, color = "white",
                     family = fontfamily) +
            geom_segment(x = -0.15, y = .2, xend = -.99, yend = .2,
                         color = "white",
                         arrow = arrow(length = unit(0.15, "cm"))) +
            geom_segment(x = 0.15, y = .2, xend = .99, yend = .2,
                         color = "white",
                         arrow = arrow(length = unit(0.15, "cm"))) +
            annotate(geom = "text", x = 0, y = 0.1,
                     label = "90%", size = 4.5, color = "white",
                     family = fontfamily) +
            geom_segment(x = -0.15, y = .1, xend = -1.64, yend = .1,
                         color = "white",
                         arrow = arrow(length = unit(0.15, "cm"))) +
            geom_segment(x = 0.15, y = .1, xend = 1.64, yend = .1,
                         color = "white",
                         arrow = arrow(length = unit(0.15, "cm"))) +
            annotate(geom = "text", x = 0, y = 0.05,
                     label = "95%", size = 4.5, color = "white",
                     family = fontfamily) +
            geom_segment(x = -0.15, y = .05, xend = -1.95, yend = .05,
                         color = "white",
                         arrow = arrow(length = unit(0.15, "cm"))) +
            geom_segment(x = 0.15, y = .05, xend = 1.95, yend = .05,
                         color = "white",
                         arrow = arrow(length = unit(0.15, "cm"))) +
            annotate(geom = "text", x = 0, y = 0.01,
                     label = "99%", size = 4.5, color = "white",
                     family = fontfamily) +
            geom_segment(x = -0.15, y = .01, xend = -2.57, yend = .01,
                         color = "white",
                         arrow = arrow(length = unit(0.15, "cm"))) +
            geom_segment(x = 0.15, y = .01, xend = 2.57, yend = .01,
                         color = "white",
                         arrow = arrow(length = unit(0.15, "cm"))) +
            stat_function(fun = dnorm, color = curvecolor, size = 1.5) +
            scale_x_continuous(breaks = c(-4, -2.58, -1.96, -1.645, -1, 0,
                                        1, 1.645, 1.96, 2.58, 4))
    }
}
