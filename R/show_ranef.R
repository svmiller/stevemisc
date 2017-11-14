show_ranef <- function(data, grp, reorder = TRUE){
  require(broom)
  # https://stackoverflow.com/questions/34344599/a-caterpillar-plot-of-just-the-significant-random-effects-from-a-mixed-effects
  augment.ranef.mer <- function(x,
                                ci.level=0.9,
                                reorder=TRUE,
                                order.var=1) {
    tmpf <- function(z) {
      if (is.character(order.var) && !order.var %in% names(z)) {
        order.var <- 1
        warning("order.var not found, resetting to 1")
      }
      ## would use plyr::name_rows, but want levels first
      zz <- data.frame(level=rownames(z),z,check.names=FALSE)
      if (reorder) {
        ## if numeric order var, add 1 to account for level column
        ov <- if (is.numeric(order.var)) order.var+1 else order.var
        zz$level <- reorder(zz$level, zz[,order.var+1], FUN=identity)
      }
      ## Q-Q values, for each column separately
      qq <- c(apply(z,2,function(y) {
        qnorm(ppoints(nrow(z)))[order(order(y))]
      }))
      rownames(zz) <- NULL
      pv   <- attr(z, "postVar")
      cols <- 1:(dim(pv)[1])
      se   <- unlist(lapply(cols, function(i) sqrt(pv[i, i, ])))
      ## n.b.: depends on explicit column-major ordering of se/melt
      zzz <- cbind(reshape2::melt(zz,id.vars="level",value.name="estimate"),
                   qq=qq,std.error=se)
      ## reorder columns:
      subset(zzz,select=c(variable, level, estimate, qq, std.error))
    }
    dd <- plyr::ldply(x,tmpf,.id="grp")
    ci.val <- -qnorm((1-ci.level)/2)
    transform(dd,
              p=2*pnorm(-abs(estimate/std.error)), ## 2-tailed p-val
              lb=estimate-ci.val*std.error,
              ub=estimate+ci.val*std.error)
  }
  require(ggplot2)
  data <- augment(ranef(data,condVar=TRUE))
  if(reorder) {
    data <- data[data$grp == grp,]
    data$level <- as.character(data$level)
  }
  else {}
  ggplot(data[data$grp == grp,],aes(estimate, level,xmin=lb,xmax=ub))+
    geom_errorbarh(height=0)+
    geom_vline(xintercept=0,lty=2)+
    geom_point()+facet_wrap(~variable,scale="free_x") +
    ylab("Levels of the Random Effect") +
    xlab("Estimated Intercept")
}
