#' Filter a Data Frame of Citations and Return the Entries as a Character
#'
#' @description \code{filter_refs()} is a convenience function I wrote for
#' filtering a data frame of citations returning the entries as a valid
#' `.bib` entry (as a character vector). I wrote this for more easily passing
#' on citations to the `print_refs()` function also included in this package.
#'
#' @details \code{filter_refs()} assumes some familiarity with `BibTeX`, `.bib`
#' entries, and depends on the \pkg{bib2df} package.
#'
#' @param bibdat a data frame of citations, like the one created by the
#' \pkg{bib2df} package
#' @param criteria criteria, specified as a character vector, by which to
#' filter the data frame of citations
#' @param type the particular type of citation entry on which to filter.
#' Defaults to "bibtexkey" (which filters based on a column of unique citation
#' keys). When `type == "year"`, the function filters on a character vector of
#' years.

#' @return  \code{filter_refs()} takes a data frame of citations, like the one
#' created by the \pkg{bib2df} package, and returns a character vector
#' (amounting to a valid `.bib` entry) of citations the user wants. This can
#' then be easily passed to the `print_refs()` function also included in this
#' package.
#'
#' @examples
#' # Based on `stevepubs` configuration, filter on `BIBTEXKEY` where
#' # the citation key matches one of these.
#' filter_refs(stevepubs, c("miller2017etst", "miller2017etjc", "miller2013tdpi"))
#'
#' # Based on `stevepubs` configuration, filter on `YEAR` where
#' # the publication year is 2017, 2018, 2019, 2020, or 2021.
#' filter_refs(stevepubs, c(2017:2021), type = "year")

filter_refs <- function(bibdat, criteria, type = "bibtexkey") {
  if(type == "bibtexkey") {
  hold_this <- subset(bibdat, bibdat$BIBTEXKEY %in% criteria)
  } else if (type == "year") {
  hold_this <- subset(bibdat, bibdat$YEAR %in% criteria)
  }
  return_this <- capture.output(df2bib(hold_this))
  return(return_this)
}

