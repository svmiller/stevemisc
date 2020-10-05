r2sd <- function(x, na = T) {
    return((x - mean(x, na.rm = na)) / (2 * sd(x, na.rm = na)))
}
