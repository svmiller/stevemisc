get_sims <- function(model, newdata, nsim, seed){
  # require(arm)
  set.seed(seed)
  arguments <- as.list(match.call())
  modelsim <- arm::sim(model, n.sims=nsim)
  mm.dat = model.matrix(terms(model),newdata)
  outputfull<-NULL
  for(i in (1:nsim)) {
    output <- NULL
    yi <- mm.dat %*% coef(modelsim)$fixef[i,]
    sim<-rep(i, length (yi))
    output<-cbind(yi, sim)
    outputfull<-rbind (outputfull, output)
  }
    outputfull<- as_tibble(outputfull)
names (outputfull)<-c("y", "sim")
  return(outputfull)

}
