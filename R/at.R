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
#' \code{diff_at} is a wrapper for \code{mutate} and \code{across} from
#' \pkg{dplyr}. It takes supplied vectors and creates differences from the
#' previous value recorded above it. It then renames these new variables to have
#' a prefix of \code{d_} (in the case of a first difference), or something like
#' \code{d2_} in the case of second differences, or \code{d3_} in the case of
#' third differences (and so on). The exact prefix depends on the \code{o}
#' argument, which communicates the order of lags you want. It defaults to 1. The
#' default prefix ("d") can be changed by way of an argument in the function,
#' though the naming convention will omit a numerical prefix for first
#' differences.
#'
#' \code{group_mean_center_at} is a wrapper for \code{mutate} and \code{across}
#' in \pkg{dplyr}. It takes supplied vectors and centers an (assumed) group mean
#' of the variables from an (assumed) total population mean of the variables
#' provided to it. It then returns the new variables with a prefix, whose default
#' is \code{b_}. This prefix communicates, if you will, a kind of "between"
#' variable in the panel model context, in juxtaposition to "within" variables
#' in the panel model context.
#'
#' \code{lag_at} is a wrapper for \code{mutate} and \code{across} from
#' \pkg{dplyr}. It takes supplied vector(s) and creates lag variables from them.
#' These new variables have a prefix of \code{l[o]_} where \code{o} corresponds
#' to the order of the lag (specified by an argument in the function, which
#' defaults to 1). This default prefix ("l") can be changed by way of an
#' another argument in the function.
#'
#' \code{log_at} is a wrapper for \code{mutate} and \code{across} from
#' \pkg{dplyr}. It takes supplied vectors and creates a variable that takes
#' a natural logarithmic transformation of them. It then renames these new
#' variables to have a prefix of \code{ln_}. This default prefix ("ln") can be
#' changed by way of an argument in the function. Users can optionally specify
#' that they want to add 1 to the vector before taking its natural logarithm,
#' which is a popular thing to do when positive reals have naturally occurring
#' zeroes.
#'
#' \code{mean_at} is a wrapper for \code{mutate} and \code{across} from
#' \pkg{dplyr}. It takes supplied vectors and creates a variable communicating
#' the mean of the variable. It then renames these new variables to have a
#' prefix of \code{mean_}. This default prefix ("mean") can be changed by way of
#' an argument in the function.
#'
#' \code{r1sd_at} is a wrapper for \code{mutate} and \code{across} from
#' \pkg{dplyr}. It both rescales the supplied vectors to new vectors and renames
#' the vectors to each have a prefix of \code{s_}. Note the rescaling here is
#' just by one standard deviation and not two. The default prefix ("s") can be
#' changed by way of an argument in the function.
#'
#' \code{r2sd_at} is a wrapper for \code{mutate} and \code{across} from
#' \pkg{dplyr}. It both rescales the supplied vectors to new vectors and renames
#' the vectors to each have a prefix of \code{z_}. Note the rescaling here is by
#' two standard deviations and not one. The default prefix ("z") can be
#' changed by way of an argument in the function.
#'
#' All functions, except for \code{lag_at}, will fail in the absence of a
#' character vector of a length of one. They are intended to work across multiple
#' columns instead of just one. If you are wanting to create one new variable,
#' you should think about using some other \pkg{dplyr} verb on its own.
#'
#'
#' @param data a data frame
#' @param x a vector, likely in your data frame
#' @param o The order of lags for calculating differences or lags in
#' \code{diff_at} or \code{lag_at}. Applicable only to these functions.
#' @param na a logical about whether missing values should be ignored in the
#' creation of means and re-scaled variables. Defaults to TRUE (i.e. pass
#' over/remove missing observations). Not applicable to \code{diff_at},
#' \code{lag_at}, and \code{log_at}.
#' @param prefix Allows the user to rename the prefix of the new variables.  Each
#' function has defaults (see details section).
#' @param mean_prefix Applicable only to \code{group_mean_center_at}. Specifies
#' the prefix of the (assumed) total population mean variables. Default is "mean",
#' though the user can change this as they see fit.
#' @param plus_1 Applicable only to \code{log_at}. If TRUE, adds 1 to the
#' variables prior to log transformation. If FALSE, performs logarithmic
#' transformation on variables no matter whether 0 occurs (i.e. 0s will
#' come back as -Inf). Defaults to FALSE.
#' @param .by a selection of columns by which to group the operation. Defaults
#' to NULL. This will eventually become a standard feature of the functions
#' as this operator moves beyond the experimental in \pkg{dplyr}. The argument
#' is not applicable to \code{log_at} (why would it be) and is optional for all
#' functions except \code{group_mean_center_at}. \code{group_mean_center_at}
#' must have something specified for grouped mean-centering.
#'
#' @return The function returns a set of new vectors in a data frame after
#' performing relevant functions. The new vectors have distinct prefixes
#' corresponding with the action performed on them.
#'
#' @examples
#'
#' set.seed(8675309)
#' Example <- data.frame(category = c(rep("A", 5),
#'                                    rep("B", 5),
#'                                    rep("C", 5)),
#'                       x = runif(15), y = runif(15),
#'                       z = sample(1:20, 15, replace=TRUE))
#'
#' my_vars <- c("x", "y", "z")
#' center_at(Example, my_vars)
#'
#' diff_at(Example, my_vars)
#'
#' diff_at(Example, my_vars, o=3)
#'
#' lag_at(Example, my_vars)
#'
#' lag_at(Example, my_vars, o=3)
#'
#' log_at(Example, my_vars)
#'
#' log_at(Example, my_vars, plus_1 = TRUE)
#'
#' mean_at(Example, my_vars)
#'
#' r1sd_at(Example, my_vars)
#'
#' r2sd_at(Example, my_vars)


#' @rdname at
#' @export
#'

center_at <- function(data, x, prefix = "c", na=TRUE, .by=NULL) {

  by <- enquo(.by)

  if(length(x) == 1) {
    stop("The use of a scoped helper verb like this requires more than one variable.")
  }

  # data %>%
  #   mutate_at(vars(all_of(x)),
  #             list(tmp = ~. - mean(., na = na))) %>%
  #   rename_at(vars(contains("_tmp")),
  #             ~paste(prefix, gsub("_tmp", "", .), sep = "_") ) -> data


  data %>%
    mutate(across(all_of(x),
                  ~(.) - mean(., na = na),
                  .names = paste0(prefix,"_{.col}")),
           .by = !!by) -> data

  return(data)

}



#' @rdname at
#' @export
#'

diff_at <- function(data, x, o=1, prefix = "d", .by = NULL) {

  by <- enquo(.by)

  if(length(x) == 1) {
    stop("The use of a scoped helper verb like this requires more than one variable.")
  }

  if(o == 1) {
    prefixx <- prefix
  } else {
    prefixx <- paste0(prefix,o)
  }

  # data %>%
  #   mutate_at(vars(all_of(x)),
  #             list(tmp = ~(.) - lag(., o))) %>%
  #   rename_at(vars(contains("_tmp")),
  #             ~paste(prefixx, gsub("_tmp", "", .), sep = "_") ) -> data

  data %>%
    mutate(across(all_of(x),
                  ~(.) - lag(., o),
                  .names = paste0(prefixx,"_{.col}")),
           .by = !!by) -> data


  return(data)

}


#' @rdname at
#' @export
#'
#'

group_mean_center_at <- function(data, x, mean_prefix = "mean",
                                 prefix = "b", na = TRUE, .by) {

  by <- enquo(.by)

  are_means_there <- paste0(mean_prefix,"_", x)

  if (!all(i <- are_means_there %in% colnames(data))) {
    stop("The (assumed) total population means are not present in the data. Did you want to run a global mean_at() first, perhaps?")
  }

  if(length(x) == 1) {
    stop("The use of a scoped helper verb like this requires more than one variable.")
  }

  # if(is.grouped_df(data) == FALSE) {
  #   warning("The absence of a grouping factor means you're going to be subtracting a mean from itself. It's up to you if you want to do that. You probably didn't want that, but I did it anyway. I'm just bringing that to your attention.")
  # }

  mp <- paste0(mean_prefix, "_")
  nvp <- paste0(prefix,"_{.col}")
  nvp_check <- paste0(prefix, "_", x)

  data %>%
    mutate(across(all_of(x), ~
                    mean(., na.rm=T) - get(str_c(mp, cur_column())), .names = nvp),
           .by = !!by) -> data

  # data %>%
  #   filter_at(nvp_check, ~. != 0) -> check_this
  #
  # if(nrow(check_this) == 0) {
  #   warning("The ensuing output for these variables you created are all 0, indicating you subtracted a thing from a different version of itself in this function. Are you sure these mean variables aren't themselves actually group means? Check your code more carefully.")
  # }

  return(data)

}

#' @rdname at
#' @export
#'

lag_at <- function(data, x, prefix = "l", o=1, .by=NULL) {

  by <- enquo(.by)

  # https://gist.github.com/RJHKnight/22dbe5a3ef1d2701afd48370a1f1742c
  lag_fn <- list()
  lags <- 1:o

  for(i in lags) {

    func <- function(x, i) {
      force(i)
      return(
        function(x) {
          return(dplyr::lag(x, i))
        }
      )}

    lag_fn[[i]] <- func(x, i)
  }


  data %>%
    mutate(across(all_of(x), lag_fn,
                  .names = paste0(prefix,"{.fn}_{.col}")),
           .by = !!by) -> data

  return(data)
}

#' @rdname at
#' @export
#'

log_at <- function(data, x, prefix = "ln", plus_1 = FALSE) {

  if(length(x) == 1) {
    stop("The use of a scoped helper verb like this requires more than one variable.")
  }

  if(plus_1 == FALSE) {
  data %>%
    mutate_at(vars(all_of(x)),
              list(tmp = ~log(.))) %>%
    rename_at(vars(contains("_tmp")),
              ~paste(prefix, gsub("_tmp", "", .), sep = "_") ) -> data
    } else { # assuming you want log1p
      data %>%
        mutate_at(vars(all_of(x)),
                  list(tmp = ~log1p(.))) %>%
        rename_at(vars(contains("_tmp")),
                  ~paste(prefix, gsub("_tmp", "", .), sep = "_") ) -> data
  }

  return(data)
}



#' @rdname at
#' @export
#'

mean_at <- function(data, x, prefix = "mean", na=TRUE, .by=NULL) {

  by <- enquo(.by)

  if(length(x) == 1) {
    stop("The use of a scoped helper verb like this requires more than one variable.")
  }

  # data %>%
  #   mutate_at(vars(all_of(x)),
  #             list(tmp = ~mean(., na = na))) %>%
  #   rename_at(vars(contains("_tmp")),
  #             ~paste(prefix, gsub("_tmp", "", .), sep = "_") ) -> data

  data %>%
    mutate(across(all_of(x),
                  ~mean(., na = na),
                  .names = paste0(prefix,"_{.col}")),
           .by = !!by) -> data

  return(data)

}



#' @rdname at
#' @export
#'

r1sd_at <- function(data, x, prefix = "s", na=TRUE, .by=NULL) {

  by <- enquo(.by)

  if(length(x) == 1) {
    stop("The use of a scoped helper verb like this requires more than one variable.")
  }

  # data %>%
  #   mutate_at(vars(all_of(x)),
  #             list(tmp = ~r1sd(., na=na))) %>%
  #   rename_at(vars(contains("_tmp")),
  #             ~paste(prefix, gsub("_tmp", "", .), sep = "_") ) -> data

  data %>%
    mutate(across(all_of(x),
                  ~r1sd(., na = na),
                  .names = paste0(prefix,"_{.col}")),
           .by = !!by) -> data

  return(data)

}

#' @rdname at
#' @export
#'

r2sd_at <- function(data, x, prefix = "z", na=TRUE, .by=NULL) {

  by <- enquo(.by)

  if(length(x) == 1) {
    stop("The use of a scoped helper verb like this requires more than one variable.")
  }

  # data %>%
  #   mutate_at(vars(all_of(x)),
  #             list(tmp = ~r2sd(., na=na))) %>%
  #   rename_at(vars(contains("_tmp")),
  #             ~paste(prefix, gsub("_tmp", "", .), sep = "_") ) -> data

  data %>%
    mutate(across(all_of(x),
                  ~r2sd(., na = na),
                  .names = paste0(prefix,"_{.col}")),
           .by = !!by) -> data


  return(data)

}
