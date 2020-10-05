make_scale <- function(x, max, min, ...) {
  ((max - min) * (x - min(x))) / (max(x) - min(x)) + min
}
