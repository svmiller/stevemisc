#' Set the Only Reproducible Seed That Matters
#'
#' @description \code{jenny()} sets a reproducible seed of 8675309. It is the only reproducible seed you should use.
#'
#' @details \code{jenny()} comes with some additional perks if you have the \pkg{emo} package installed. The package
#' is optional.
#'
#' @param x a vector
#'
#' @return When `x` is not specified or is 8675309, the function sets a reproducible seed of 8675309 and returns
#' a nice message congratulating you for it. If `x` is not 8675309, the function sets no reproducible seed and
#' gently admonishes you for wasting its time.
#'
#' @examples
#'
#' jenny() # will work and reward you for it
#' jenny(12345) # will not work and will result in a stern message

jenny <- function(x = 8675309) {
  if(missing(x)) {
    set.seed(x)
    message("Jenny, I got your number...")
  } else {
    message("Why are you using this function with some other reproducible seed...")
  }
}

#Enhances: emo
# Additional_repositories: https://github.com/hadley/emo
# if(requireNamespace("emo", quietly = TRUE)) {
#   message(paste0(emo::ji("music"), " Jenny, I got your number..."))
# } else {
#   message("Jenny, I got your number...")
# }
