normal_dist <- function(curvecolor, fillcolor, fontfamily) {
    if (missing(fontfamily)) {
        ggplot(data.frame(x = c(-4, 4)), aes(x)) +
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
        ggplot(data.frame(x = c(-4, 4)), aes(x)) +
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
