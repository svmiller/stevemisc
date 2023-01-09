#' Scoped Helper Verbs
#'
#' @description Scoped helper verbs included in this R Documentation file
#' allow for targeted commands on specified columns. They also rename
#' the ensuing output to conform to my preferred style. The commands here
#' are multiple and explained in the details section below.
#'
#' @details
#'
#'
#' \code{center_at} is a wrapper for \code{mutate_at} and \code{rename_at} from
#' \pkg{dplyr}. It takes supplied vectors and effectively centers them from the
#' mean. It then renames these new variables to have a prefix of \code{c_}. The
#' default prefix ("c") can be changed by way of an argument in the function.
#'
#' \code{diff_at} is a wrapper for \code{mutate_at} and \code{rename_at} from
#' \pkg{dplyr}. It takes supplied vectors and creates differences from the
#' previous value recorded above it. It then renames these new variables to have
#' a prefix of \code{d_} (in the case of a first difference), or something like
#' \code{d2_} in the case of second differences, or \code{d3_} in the case of
#' third differences (and so on). The exact prefix depends on the \code{l}
#' argument, which communicates the order of lags you want. It defaults to 1. The
#' default prefix ("d") can be changed by way of an argument in the function.
#'
#' \code{group_mean_center_at} is a wrapper for \code{mutate} and \code{across}
#' in \pkg{dplyr}. It takes supplied vectors and centers an (assumed) group mean
#' of the variables from an (assumed) total population mean of the variables
#' provided to it. It then returns the new variables with a prefix, whose default
#' is \code{b_}. This prefix communicates, if you will, a kind of "between"
#' variable in the panel model context, in juxtaposition to "within" variables
#' in the panel model context.
#'
#' \code{mean_at} is a wrapper for \code{mutate_at} and \code{rename_at} from
#' \pkg{dplyr}. It takes supplied vectors and creates a variable communicating
#' the mean of the variable. It then renames these new variables to have a
#' prefix of \code{mean_}. This default prefix ("mean") can be changed by way of
#' an argument in the function.
#'
#' \code{r1sd_at} is a wrapper for \code{mutate_at} and \code{rename_at} from
#' \pkg{dplyr}. It both rescales the supplied vectors to new vectors and renames
#' the vectors to each have a prefix of \code{s_}. Note the rescaling here is
#' just by one standard deviation and not two. The default prefix ("s") can be
#' changed by way of an argument in the function.
#'
#' \code{r2sd_at} is a wrapper for \code{mutate_at} and \code{rename_at} from
#' \pkg{dplyr}. It both rescales the supplied vectors to new vectors and renames
#' the vectors to each have a prefix of \code{z_}. Note the rescaling here is by
#' two standard deviations and not one. The default prefix ("z") can be
#' changed by way of an argument in the function.
#'
#'
#' These functions will fail in the absence of a character vector of a length
#' of one. In which case, you should think about using some other \pkg{dplyr}
#' verb on its own.
#'
#'
#' @param data a data frame
#' @param x a vector, likely in your data frame
#' @param l The order of lags for calculating differences in \code{diff_at}.
#' Applicable only to \code{diff_at}.
#' @param na what to do with NAs in the vector. Defaults to TRUE
#' (i.e. passes over the missing observations). Not applicable to \code{diff_at}.
#' @param prefix Allows the user to rename the prefix of the new variables.  Each
#' function has defaults (see details section).
#' @param mean_prefix Applicable only to \code{group_mean_center_at}. Specifies
#' the prefix of the (assumed) total population mean variables. Default is "mean",
#' though the user can change this as they see fit.
#'
#' @return The function returns a set of new vectors in a data frame after
#' performing relevant functions. The new vectors have distinct prefixes
#' corresponding with the action performed on them.
#'
#' @examples
#'
#' Example <- data.frame(category = c(rep("A", 5),
#'                                    rep("B", 5),
#'                                    rep("C", 5)),
#'                       x = runif(15), y = rnorm(15))
#'
#' center_at(Example, c("x", "y"))
#'
#' diff_at(Example, c("x", "y"))
#'
#' diff_at(Example, c("x", "y"), l=3)
#'
#' mean_at(Example, c("x", "y"))
#'
#' group_mean_center_at(mean_at(Example, c("x", "y")), c("x", "y"))
#' # ^ Alternatively, a better way:
#' # Example %>%
#' #   mean_at(c("x", "y")) %>%
#' #   group_by(category) %>%
#' #   group_mean_center_at(c("x", "y"))
#'
#' r1sd_at(Example, c("x", "y"))
#'
#' r2sd_at(Example, c("x", "y"))


#' @rdname at
#' @export
#'

center_at <- function(data, x, prefix = "c", na=TRUE) {

  if(length(x) == 1) {
    stop("The use of a scoped helper verb like this requires more than one variable.")
  }

  data %>%
    mutate_at(vars(all_of(x)),
              list(tmp = ~. - mean(., na = na))) %>%
    rename_at(vars(contains("_tmp")),
              ~paste(prefix, gsub("_tmp", "", .), sep = "_") ) -> data
  return(data)

}



#' @rdname at
#' @export
#'

diff_at <- function(data, x, l=1, prefix = "d") {

  if(length(x) == 1) {
    stop("The use of a scoped helper verb like this requires more than one variable.")
  }

  if(l == 1) {
    prefixx <- prefix
  } else {
    prefixx <- paste0(prefix,l)
  }

  data %>%
    mutate_at(vars(all_of(x)),
              list(tmp = ~(.) - lag(., l))) %>%
    rename_at(vars(contains("_tmp")),
              ~paste(prefixx, gsub("_tmp", "", .), sep = "_") ) -> data
  return(data)

}


#' @rdname at
#' @export
#'
#'

group_mean_center_at <- function(data, x, mean_prefix = "mean",
                                 prefix = "b", na = TRUE) {

  are_means_there <- paste0("mean_", x)

  if (!all(i <- are_means_there %in% colnames(data))) {
    stop("The (assumed) total population means are not present in the data. Did you want to run a global mean_at() first, perhaps?")
  }

  if(length(x) == 1) {
    stop("The use of a scoped helper verb like this requires more than one variable.")
  }

  if(is.grouped_df(data) == FALSE) {
   warning("The absence of a grouping factor means you're going to be subtracting a mean from itself. It's up to you if you want to do that. You probably didn't want that, but I did it anyway. I'm just bringing that to your attention.")
  }

  mp <- paste0(mean_prefix, "_")
  nvp <- paste0(prefix,"_{.col}")

  data %>%
    mutate(across(all_of(x), ~
                    mean(., na.rm=T) - get(str_c(mp, cur_column())), .names = nvp)) -> data

  return(data)

}

#' @rdname at
#' @export
#'

mean_at <- function(data, x, prefix = "mean", na=TRUE) {

  if(length(x) == 1) {
    stop("The use of a scoped helper verb like this requires more than one variable.")
  }

  data %>%
    mutate_at(vars(all_of(x)),
              list(tmp = ~mean(., na = na))) %>%
    rename_at(vars(contains("_tmp")),
              ~paste(prefix, gsub("_tmp", "", .), sep = "_") ) -> data
  return(data)

}



#' @rdname at
#' @export
#'

r1sd_at <- function(data, x, prefix = "s", na=TRUE) {

  if(length(x) == 1) {
    stop("The use of a scoped helper verb like this requires more than one variable.")
  }

  data %>%
    mutate_at(vars(all_of(x)),
              list(tmp = ~r1sd(., na=na))) %>%
    rename_at(vars(contains("_tmp")),
              ~paste(prefix, gsub("_tmp", "", .), sep = "_") ) -> data
  return(data)

}

#' @rdname at
#' @export
#'

r2sd_at <- function(data, x, prefix = "z", na=TRUE) {

  if(length(x) == 1) {
    stop("The use of a scoped helper verb like this requires more than one variable.")
  }

  data %>%
    mutate_at(vars(all_of(x)),
              list(tmp = ~r2sd(., na=na))) %>%
    rename_at(vars(contains("_tmp")),
              ~paste(prefix, gsub("_tmp", "", .), sep = "_") ) -> data
  return(data)

}

#' #' @rdname at
#' #' @export
#' #'
#'
#' within_at <- function(data, x, na=TRUE) {
#'
#'   if(length(x) == 1) {
#'     stop("The use of a scoped helper verb like this requires more than one variable.")
#'   }
#'
#'   data %>%
#'     mutate_at(vars(all_of(x)),
#'               list(w = ~. - mean(., na = na))) %>%
#'     rename_at(vars(contains("_w")),
#'               ~paste("w", gsub("_w", "", .), sep = "_") ) -> data
#'   return(data)
#'
#' }


# \code{within_at} is a wrapper for \code{mutate_at} and \code{rename_at} from
# \pkg{dplyr}. It takes supplied vectors and effectively centers them from the
# mean. It then renames these new variables to have a prefix of \code{w_}. It
# is best used with a \code{group_by} preceding it on some kind of "subject",
# with an eye toward ultimately including them as covariates in a panel model
# to isolate so-called "within" effects. Its underlying functionality is
# effectively identical to \code{center_at} and the distinctions between the two
# are the different prefixes and different intended uses/contexts.
