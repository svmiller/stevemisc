#' Scoped Helper Verbs
#'
#' @description Scoped helper verbs included in this R Documentation file
#' allow for targeted commands on specified columns. They also rename
#' the ensuing output to conform to my preferred style. The commands here
#' are multiple and explained in the details section below.
#'
#' @details
#'
#' \code{r1sd_at} is a wrapper for \code{mutate_at} and \code{rename_at} from
#' \pkg{dplyr}. It both rescales the supplied vectors to new vectors and renames
#' the vectors to each have a prefix of \code{s_}. Note the rescaling here is
#' just by one standard deviation and not two.
#'
#' \code{r2sd_at} is a wrapper for \code{mutate_at} and \code{rename_at} from
#' \pkg{dplyr}. It both rescales the supplied vectors to new vectors and renames
#' the vectors to each have a prefix of \code{z_}. Note the rescaling here is by
#' two standard deviations and not one.
#'
#'
#'
#' By default, `na.rm` is set to TRUE. If you have missing data, the function will just pass
#' over them.
#'
#' Gelman (2008) argues that rescaling by two standard deviations puts regression inputs
#' on roughly the same scale no matter their original scale. This allows for some honest, if preliminary,
#' assessment of relative effect sizes from the regression output. This does that, but
#' without requiring the \code{rescale} function from \pkg{arm}.
#' I'm trying to reduce the packages on which my workflow relies.
#'
#' Importantly, I tend to rescale only the ordinal and interval inputs and leave the binary inputs as 0/1.
#' So, my \code{r2sd} function doesn't have any of the fancier if-else statements that Gelman's \code{rescale}
#' function has.
#'
#' @param data a data frame
#' @param x a vector, likely in your data frame
#' @param l The order of lags for calculating differences in \code{diff_at}.
#' Applicable only to \code{diff_at}.
#' @param na what to do with NAs in the vector. Defaults to TRUE
#' (i.e. passes over the missing observations). Not applicable to \code{diff_at}.
#'
#' @return The function returns a numeric vector rescaled with a mean of 0 and a
#' standard deviation of .5.
#'
#' @references Gelman, Andrew. 2008. "Scaling Regression Inputs by Dividing by Two Standard Deviations." \emph{Statistics in Medicine} 27: 2865--2873.
#'
#' @examples
#'
#' data.frame(x = cumsum(rnorm(10)),
#'            y = cumsum(rnorm(10)),
#'            group = sample(c("A", "B"))) -> Example
#'
#' # Note: this works in a group_by() context, which you should do in a case like this.
#' diff_at(Example, c("x", "y"))
#'
#' r1sd_at(Example, c("x", "y"))
#'
#' r2sd_at(Example, c("x", "y"))


#' @rdname at
#' @export
#'

diff_at <- function(data, x, l=1) {

  if(length(x) == 1) {
    stop("The use of a scoped helper verb like this requires more than one variable.")
  }

  if(l == 1) {
    prefix <- "d"
  } else {
    prefix <- paste0("d",l)
  }

  data %>%
    mutate_at(vars(all_of(x)),
              list(tmp = ~(.) - lag(., l))) %>%
    rename_at(vars(contains("_tmp")),
              ~paste(prefix, gsub("_tmp", "", .), sep = "_") ) -> data
  return(data)

}


#' @rdname at
#' @export
#'

r1sd_at <- function(data, x, na=TRUE) {

  if(length(x) == 1) {
    stop("The use of a scoped helper verb like this requires more than one variable.")
  }

  data %>%
    mutate_at(vars(all_of(x)),
              list(s = ~r1sd(., na=na))) %>%
    rename_at(vars(contains("_s")),
              ~paste("s", gsub("_s", "", .), sep = "_") ) -> data
  return(data)

}

#' @rdname at
#' @export
#'

r2sd_at <- function(data, x, na=TRUE) {

  if(length(x) == 1) {
    stop("The use of a scoped helper verb like this requires more than one variable.")
  }

  data %>%
    mutate_at(vars(all_of(x)),
              list(z = ~r2sd(., na=na))) %>%
    rename_at(vars(contains("_z")),
              ~paste("z", gsub("_z", "", .), sep = "_") ) -> data
  return(data)

}
