#' Some Labeled Data in the European Social Survey (Round 9)
#'
#' These are data to illustrate labeled data and how to process them with
#' \code{get_var_info()} in this package.
#'
#' @format A data frame with 109 observations on the following 4 variables.
#' \describe{
#' \item{\code{essround}}{a numeric constant}
#' \item{\code{edition}}{another numeric constant}
#' \item{\code{cntry}}{a character vector (with label) for the country in the data}
#' \item{\code{netusoft}}{a numeric vector (with label) for self-reported internet consumption of a respondent}
#' }
#'
#' @details Data are condensed summaries from the raw data. They amount to every unique combination of country and
#' self-reported internet consumption. The data are here to illustrate the \code{get_var_info()} function in this package.

"ess9_labelled"
