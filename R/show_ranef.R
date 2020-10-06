show_ranef <- function(data, grp, reorder = TRUE) {
  require(ggplot2)
  require(broom.mixed)
  data <- augment(ranef(data, condVar = TRUE))
  if (reorder) {
    data <- data[data$grp == grp, ]
    data$level <- as.character(data$level)
  } else {
    }
  ggplot(data[data$grp == grp, ], aes(estimate, level, xmin = lb, xmax = ub)) +
    geom_errorbarh(height = 0) +
    geom_vline(xintercept = 0, lty = 2) +
    geom_point() +
    facet_wrap(~variable, scale = "free_x") +
    ylab("Levels of the Random Effect") +
    xlab("Estimated Intercept")
}
