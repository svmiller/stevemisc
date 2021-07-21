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


#' An Incomplete List of My Publications, All of Which You Should Cite
#'
#' These are data on my publications, barring a few things like book reviews and some forthcoming pieces.
#' I use these data to illustrate the \code{print_refs()} function. You should cite my publications more.
#'
#' @format A data frame the following 14 variables.
#' \describe{
#' \item{\code{CATEGORY}}{the entry type}
#' \item{\code{BIBTEXKEY}}{the unique entry key}
#' \item{\code{AUTHOR}}{a list of authors for this entry}
#' \item{\code{BOOKTITLE}}{the book title, if appropriate}
#' \item{\code{JOURNAL}}{the journal title, if appropriate}
#' \item{\code{NUMBER}}{the journal volume number, if appropriate}
#' \item{\code{PAGES}}{the range of page numbers, if appropriate}
#' \item{\code{PUBLISHER}}{the book publisher, if appropriate}
#' \item{\code{TITLE}}{the title of the publication}
#' \item{\code{VOLUME}}{the journal volume number, if appropriate}
#' \item{\code{YEAR}}{the year of publication, as a character. Publications with no year are assumed to be forthcoming}
#' \item{\code{DOI}}{a DOI, if I entered one}
#' }
#'
#' @details Cite my publications more, you goons. *Extremely Smokey Bear voice* Only YOU can jack my h-index to infinity.

"stevepubs"
