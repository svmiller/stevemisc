get_sims <- function(model, newdata, nsim, seed){
  # require(arm)
  if(missing(seed)) {

  } else {
    set.seed(seed)
  }
  modelsim <- arm::sim(model, n.sims=nsim)
  MM = model.matrix(terms(model),newdata)
  Sims <- tibble(y = numeric(),
                 sim = numeric())
  for(i in (1:nsim)) {
    output <- NULL
    if (is(model,"lm") == TRUE | is(model,"glm") == TRUE) {
      yi <- MM %*% coef(modelsim)[i,] }
    else { # assuming it's merMod
      yi <- MM %*% coef(modelsim)$fixef[i,]
    }
    sim<-rep(i, length (yi))
    hold_me <- suppressMessages(as_tibble(cbind(yi, sim))) %>% rename(y = V1)
    Sims <- bind_rows(Sims, hold_me)
  }
  return(Sims)

}

