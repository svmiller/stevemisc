#' Get a caterpillar plot of random effects from a mixed model
#'
#' @description \code{show_ranef()} allows a user estimating a mixed model to quickly
#' plot the random intercepts (with conditional variances) of a given random effect
#' in a mixed model. In cases where there is a random slope over the intercept, the function
#' plots the random slope as another caterpillar plot (as another facet)
#'
#' @details This function is a simple wrapper in which \code{broom.mixed} and, obviously
#' \code{ggplot2} are doing the heavy lifting.
#'
#' @return \code{show_ranef()} returns a caterpillar plot of the random intercepts from a given
#' mixed model. If \code{broom.mixed::augment()} can process it, this function should work just fine.
#'
#' @author Steven V. Miller
#'
#' @param data a fitted mixed model with random intercepts
#' @param grp What random intercept/slopes do you want to see as a caterpillar plot? Declare it as a character
#' @param reorder optional argument. DEFAULT is TRUE, which ``re-orders'' the intercepts by the
#' original value in the data. If FALSE, the ensuing caterpillar plot defaults to a default method of ordering
#' the levels of the random effect by their estimated conditional mode.
#'
#' @examples
#'
#' library(lme4)
#' library(stevemisc)
#' data(sleepstudy)
#'
#' M1 <- lmer(Reaction ~ Days + (Days | Subject), data=sleepstudy)
#' show_ranef(M1, "Subject")
#' show_ranef(M1, "Subject", reorder=FALSE)
#'

show_ranef <- function(data, grp, reorder = TRUE) {
  data <- augment(ranef(data, condVar = TRUE))
  if (reorder) {
    data <- data[data$grp == grp, ]
    data$level <- as.character(data$level)
  } else {
    }
  ggplot(data[data$grp == grp, ], aes(.data$estimate, .data$level, xmin = .data$lb, xmax = .data$ub)) +
    geom_errorbarh(height = 0) +
    geom_vline(xintercept = 0, lty = 2) +
    geom_point() +
    ggplot2::facet_wrap(~variable, scale = "free_x") +
    ylab("Levels of the Random Effect") +
    xlab("Estimated Intercept")
}

# Something to look at for later: https://fishandwhistle.net/slides/rstudioconf2020/#1
