r2sd <- function(x, na.rm=T) {return ((x-mean(x,na.rm=na.rm))/(2*sd(x, na.rm=na.rm)))}
