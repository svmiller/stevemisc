get_sims <- function(model, newdata, nsim, seed) {
    if (missing(seed)) {

    } else {
        set.seed(seed)
    }
    modelsim <- arm::sim(model, n.sims = nsim)
    modmat <- model.matrix(terms(model), newdata)
    the_sims <- tibble::tibble(y = numeric(), sim = numeric())
    for (i in (1:nsim)) {
        if (is(model, "lm") == TRUE | is(model, "glm") == TRUE) {
            yi <- modmat %*% coef(modelsim)[i, ]
        } else {
            # assuming it's merMod
            yi <- modmat %*% coef(modelsim)$fixef[i, ]
        }
        sim <- rep(i, length(yi))
        hold_me <- suppressMessages(tibble::as_tibble(cbind(yi, sim)))
        names(hold_me) <- c("y", "sim")
        the_sims <- dplyr::bind_rows(the_sims, hold_me)
    }
    return(the_sims)
}
