#' Bootstrap a Regression Model, the Bayesian Way
#'
#' @description \code{sbayesboot()} performs a Bayesian bootstrap of a regression model.
#'
#' @details The code underpinning \code{sbayesboot()} is largely derived from
#' code provided by Grant McDermott and Vincent Arel-Bundock. My approach here
#' takes the flexibility of McDermott's model-agnostic code (along with the
#' ease of specifying clusters) and combines it with Arel-Bundock's
#' `update()` approach to the actual bootstrapping. I may have screwed
#' something up, so feel free to point to cases where I did screw up.
#'
#' @param object a regression model object
#' @param reps how many bootstrap replicates the user wants. Defaults to 1000
#' @param seed set an optional seed for reproducibility
#' @param cluster an optional cluster for calibrating the weights
#' @param ... optional arguments
#'
#' @return `sbayesboot()` takes a fitted regression model and returns a matrix
#' of bootstrapped coefficients (with intercept). These could be easily
#' converted to a data frame for ease of summary.
#'
#' @author Grant McDermott, Vincent Arel-Bundock
#'
#'
#' @examples
#' \donttest{
#' M1 <- lm(mpg ~ disp + wt + hp, mtcars)
#'
#' # Default options
#'
#' BB1 <- sbayesboot(M1)
#'
#' # Cluster bootstrap on cylinder variable
#'
#' BB2 <- sbayesboot(M1, cluster=~cyl)
#' }

sbayesboot <- function(object, reps = 1000L, seed, cluster = NULL, ...) {

  if (missing(seed)) {

  } else {
    set.seed(seed)
  }

  Ymat = object$model[, 1]
  Xmat = model.matrix(object)

  fmat = NULL
  n_weights = nrow(Xmat)

  ## Have to do a bit of leg work to pull out the clusters and match to
  ## model matrix
  if (!is.null(cluster)) {

    if (inherits(cluster, "formula")) {
      cl_string = strsplit(paste0(cluster)[2], split = ' \\+ ')[[1]]
    } else {
      cl_string = paste(cluster)
    }
    if (!is.null(fmat) && all(cl_string %in% colnames(fmat))) {
      cl_mat = fmat[, cl_string]
    } else if (all(cl_string %in% colnames(Xmat))) {
      cl_mat = Xmat[, cl_string]
    } else {
      DATA = eval(object$call$data)
      if (all(cl_string %in% names(DATA))) {
        all_vars = sapply(list(Ymat, Xmat, fmat), colnames)
        if (inherits(all_vars, 'list')) all_vars = do.call('c', all_vars)
        all_vars = union(all_vars, cl_string)
        DATA = data.frame(DATA)[, intersect(colnames(DATA), all_vars)]
        DATA = DATA[complete.cases(DATA), ]
        cl_mat = model.matrix(~0+., DATA[, cl_string, drop=FALSE])
      } else {
        stop(paste0('Could not find ', cluster, '. Please provide a valid input.\n'))
      }
    }

    n_weights = nrow(unique(cl_mat))

    ## Keep track of cluster id for consistent weighting  within each
    ## cluster later on
    cl_mat <- as.data.frame(cl_mat)
    #cl_mat$cl_id = data.table::frank(cl_mat, ties.method = "dense")
    DDD <- unite(cl_mat, "ddd")
    DDD %>%
      mutate(cl_id = dense_rank(.data$ddd)) %>% select(.data$cl_id) -> DDD

    bind_cols(cl_mat, DDD) -> cl_mat

  }

  ## Pre-allocate space for efficiency
  wfits = matrix(0, reps, length(object$coefficients))

  for (i in 1:reps) {

    if (is.null(cluster)) {
      weights = rexp(n_weights, rate = 1)
    } else {
      # weights = cl_mat[, wt := rexp(1, rate = 1), by = cl_id][, wt]
      cl_mat %>%
        group_by(.data$cl_id) %>%
        mutate(wt = rexp(1, rate=1)) %>%
        ungroup() -> cl_mat

      weights <- cl_mat$wt
    }

    ## Normalise weights
    ## (Unnecessary? https://twitter.com/deaneckles/status/1487506960698200067)
    # weights = weights / sum(weights)

    ## Fit weighted reg
   # wfits[i, ] = lm.wfit(x = Xmat, y = Ymat, w = weights)$coefficients
    wfits[i, ] <- coef(update(object, weights = weights))
  }

  colnames(wfits) = colnames(Xmat)

  #class(wfits) = "data.frame"

  return(wfits)

}



# library(stevedata)
# na.omit(ESS9GB) %>%
#   mutate(immigdum = ifelse(immigsent < 10, 1, 0)) -> Dat
#
# M1 <- lm(immigsent ~ agea + female + eduyrs + uempla + hinctnta + lrscale, data=Dat)
# M1 <- glm(immigdum ~ agea + female + eduyrs + uempla + hinctnta + lrscale,
#           data=Dat, family=binomial(link='logit'))
# sbayesboot(M1, cluster=~region, seed=8675309) %>% as_tibble() %>%
#   gather(var, val) %>%
#   group_by(var) %>%
#   summarize(mean = mean(val),
#             lwr = quantile(val, .025),
#             upr = quantile(val, .975))
