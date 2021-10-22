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
#' @format A data frame with the following 14 variables.
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


#' French Leader Years, 1874-2015
#'
#' These are data generated in \pkg{peacesciencer} for all French leader-years from 1874 to 2015. I'm going to use
#' these data for stress-testing the calculation of so-called "peace spells" for data that are decidedly imbalanced,
#' as these are.
#'
#' @format A data frame with 255 observations on the following 10 variables.
#' \describe{
#' \item{\code{obsid}}{the unique observation ID in the Archigos data}
#' \item{\code{ccode}}{the Correlates of War state code for France (220)}
#' \item{\code{leader}}{a name---typically last name---for the leader}
#' \item{\code{year}}{an observation year for the leader}
#' \item{\code{startdate}}{the start date for the leader's period in office}
#' \item{\code{enddate}}{the end date for the leader's period in office}
#' \item{\code{gmlmidongoing}}{was there an ongoing inter-state dispute for the leader?}
#' \item{\code{gmlmidonset}}{was there a new inter-state dispute onset for the leader?}
#' \item{\code{gmlmidongoing_init}}{was there an ongoing inter-state dispute for the leader that the leader initiated?}
#' \item{\code{gmlmidonset_init}}{was there a new inter-state dispute onset for the leader that the leader initiated?}
#' }
#'
#' @details
#'
#' Data are generated in the development version (scheduled release of v. 0.7) of \pkg{peacesciencer}. Conflict data
#' come from the GML MID data. Leader data come from Archigos.
#'
#' @references
#'
#' Goemans, Henk E., Kristian Skrede Gleditsch, and Giacomo Chiozza. 2009. "Introducing Archigos: A Dataset of Political Leaders"
#' \emph{Journal of Peace Research} 46(2): 269--83.
#'
#' Gibler, Douglas M., Steven V. Miller, and Erin K. Little. 2016. “An Analysis of the Militarized
#' Interstate Dispute (MID) Dataset, 1816-2001.” International Studies Quarterly 60(4): 719-730.

"fra_leaderyears"
