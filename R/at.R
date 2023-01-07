#' Scoped Helper Verbs
#'
#' @description Scoped helper verbs included in this R Documentation file
#' allow for targeted commands on specified columns. They also rename
#' the ensuing output to conform to my preferred style. The commands here
#' are multiple and explained in the details section below.
#'
#' @details
#'
#' \code{center_at} is a wrapper for \code{mutate_at} and \code{rename_at} from
#' \pkg{dplyr}. It takes supplied vectors and effectively centers them from the
#' mean. It then renames these new variables to have a prefix of \code{c_}. It
#' is best used *without* a \code{group_by} preceding it. The underlying code is
#' identical to \code{within_at} in this same package, though it results in new
#' variables with a different prefix.
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
#' \code{within_at} is a wrapper for \code{mutate_at} and \code{rename_at} from
#' \pkg{dplyr}. It takes supplied vectors and effectively centers them from the
#' mean. It then renames these new variables to have a prefix of \code{w_}. It
#' is best used with a \code{group_by} preceding it on some kind of "subject",
#' with an eye toward ultimately including them as covariates in a panel model
#' to isolate so-called "within" effects.
#'
#'
#' @param data a data frame
#' @param x a vector, likely in your data frame
#' @param l The order of lags for calculating differences in \code{diff_at}.
#' Applicable only to \code{diff_at}.
#' @param na what to do with NAs in the vector. Defaults to TRUE
#' (i.e. passes over the missing observations). Not applicable to \code{diff_at}.
#'
#' @return The function returns a set of new vectors in a data frame after
#' performing relevant functions. The new vectors have distinct prefixes
#' corresponding with the action performed on them.
#'
#' @examples
#'
#' center_at(USArrests, c("Murder", "Assault"))
#'
#' diff_at(USArrests, c("Murder", "Assault"))
#'
#' r1sd_at(USArrests, c("Murder", "Assault"))
#'
#' r2sd_at(USArrests, c("Murder", "Assault"))
#'
#' # Note: best used with a group_by() preceding it.
#' within_at(USArrests, c("Murder", "Assault"))

#' @rdname at
#' @export
#'

center_at <- function(data, x, na=TRUE) {

  if(length(x) == 1) {
    stop("The use of a scoped helper verb like this requires more than one variable.")
  }

  data %>%
    mutate_at(vars(all_of(x)),
              list(c = ~. - mean(., na = na))) %>%
    rename_at(vars(contains("_c")),
              ~paste("c", gsub("_c", "", .), sep = "_") ) -> data
  return(data)

}



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

#' @rdname at
#' @export
#'

within_at <- function(data, x, na=TRUE) {

  if(length(x) == 1) {
    stop("The use of a scoped helper verb like this requires more than one variable.")
  }

  data %>%
    mutate_at(vars(all_of(x)),
              list(w = ~. - mean(., na = na))) %>%
    rename_at(vars(contains("_w")),
              ~paste("w", gsub("_w", "", .), sep = "_") ) -> data
  return(data)

}
