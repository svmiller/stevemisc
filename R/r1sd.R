r1sd <- function(x, na = T) {
  return((x - mean(x, na.rm = na)) / (1 * sd(x, na.rm = na)))
}
