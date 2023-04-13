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


#' French Leader-Years, 1874-2015
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
#' come from the GML MID data (v. 2.2.1). Leader data come from Archigos (v. 4.1).
#'
#' @references
#'
#' Goemans, Henk E., Kristian Skrede Gleditsch, and Giacomo Chiozza. 2009. "Introducing Archigos: A Dataset of Political Leaders"
#' \emph{Journal of Peace Research} 46(2): 269--83.
#'
#' Gibler, Douglas M., Steven V. Miller, and Erin K. Little. 2016. “An Analysis of the Militarized
#' Interstate Dispute (MID) Dataset, 1816-2001.” International Studies Quarterly 60(4): 719-730.

"fra_leaderyears"


#' German Dyad-Years, 1816-2020
#'
#' These are data generated in \pkg{peacesciencer} for all German (and Prussian) dyad-years from 1816 to 2020. These
#' are going to be useful in stress-testing what "peace spell" calculations may look like when there is a huge gap
#' in between years. In the Correlates of War context, Germany disappears from the international system from 1945 to 1990. It'll
#' also serve as a nice test for making sure spell calculations don't misbehave in the context of missing data. In this application,
#' there are no data for disputes between 2011 and 2020, but the dyad-years include 2011 to 2020.
#'
#' @format A data frame with 11174 observations on the following 6 variables.
#' \describe{
#' \item{\code{dyad}}{a unique identifier for the dyad}
#' \item{\code{ccode1}}{the Correlates of War state code for Germany (255)}
#' \item{\code{ccode2}}{the Correlates of War state code for the other state in the dyad}
#' \item{\code{year}}{an observation year for the dyad}
#' \item{\code{gmlmidongoing}}{was there an ongoing inter-state dispute in the dyad-year?}
#' \item{\code{gmlmidonset}}{was there a new inter-state dispute onset in the dyad-year}
#' }
#'
#' @details
#'
#' Data are generated in the development version (scheduled release of v. 0.7) of \pkg{peacesciencer}. Conflict data
#' come from the GML MID data (v. 2.2.1).
#'
#' @references
#'
#' Gibler, Douglas M., Steven V. Miller, and Erin K. Little. 2016. “An Analysis of the Militarized
#' Interstate Dispute (MID) Dataset, 1816-2001.” International Studies Quarterly 60(4): 719-730.

"gmy_dyadyears"



#' United States Militarized Interstate Disputes (MIDs)
#'
#' This is a non-directed dyad-year data set for militarized interstate disputes involving
#' the United States. I created these to illustrate the \code{sbtscs()} function.
#'
#' @format A data frame with 14586 observations on the following 6 variables.
#' \describe{
#' \item{\code{dyad}}{a unique identifier for the dyad}
#' \item{\code{ccode1}}{the Correlates of War state code for the United States (2)}
#' \item{\code{ccode2}}{the Correlates of War state code for the other state in the dyad}
#' \item{\code{year}}{an observation year for the dyad}
#' \item{\code{midongoing}}{was there an ongoing inter-state dispute in the dyad-year?}
#' \item{\code{midonset}}{was there a new inter-state dispute onset in the dyad-year}
#' }
#'
#' @details
#'
#' Data were generated some time ago. Rare cases where there were multiple disputes ongoing
#' in a given dyad-year were first whittled by isolating 1) unique dispute onsets. Thereafter,
#' the data select the 2) highest fatality, then 3) the highest hostility level, and then 4)
#' the longer dispute, until 5) just picking whichever one came first. There are no duplicate non-directed dyad-year observations.
#'
#' @references
#'
#' Gibler, Douglas M., Steven V. Miller, and Erin K. Little. 2016. “An Analysis of the Militarized
#' Interstate Dispute (MID) Dataset, 1816-2001.” International Studies Quarterly 60(4): 719-730.

"usa_mids"

#' Map Quiz Wrong Guesses Across Five Intro to IR Courses
#'
#' This is a simple data set that records every wrong guess for map quiz
#' assignments I gave in my intro to IR class at Clemson University across
#' five semesters.
#'
#' @format A data frame with 1772 observations on the following 8 variables.
#' \describe{
#' \item{\code{class}}{an ordered factor of the semester in which the wrong
#' guess was recorded by a student. Levels include "Spring 2018", "Fall 2018",
#' "Spring 2019", "Fall 2019", and "Spring 2020."}
#' \item{\code{students}}{the number of students in the class taking the
#' map quiz.}
#' \item{\code{region}}{the region map on which the country was located.
#' Values include "Europe", "Africa", "Asia", "Latin America", and "MENA."
#' "MENA" is short for "Middle East and North Africa."}
#' \item{\code{country}}{the country I asked the student to correctly
#' identify}
#' \item{\code{guess}}{the country that was the actual state incorrectly
#' guessed by the student}
#' \item{\code{ccode1}}{the Correlates of War state code for
#' the state I wanted the student to identify in \code{country}.}
#' \item{\code{ccode2}}{the Correlates of War state code for the
#' state that is the wrong guess for the state in \code{guess}}
#' \item{\code{mindist}}{the minimum distance (in kilometers) between
#' \code{country} and \code{guess}}}
#'
#' @details
#'
#' Students can always not make a guess and be wrong, which explains the
#' \code{NA}s in the data. Students were given five
#' separate numbered maps and prompted to identify 10 countries each on
#' them. The maps never changed across five semesters, nor did the prompts.
#' Use these data as you see fit. Obviously, FERPA considerations mean I
#' can't share anything else of potential value here.
#'

"map_quiz"


#' Charitable Contributions Panel Data
#'
#' This is a toy panel data set on charitable contributions across 10 years for
#' 47 taxpayers. It's useful for illustrating the estimation of panel models.
#'
#' @format A data frame with 470 observations on the following 8 variables.
#' \describe{
#' \item{\code{subject}}{a numeric identifier for the subject}
#' \item{\code{time}}{a numeric time identifier, as a simple integer from 1 to 10}
#' \item{\code{charity}}{the sum of cash and other property contributions, excluding carry-overs from previous years}
#' \item{\code{income}}{adjusted gross income}
#' \item{\code{price}}{1 minus the marginal income tax rate, which is defined on income prior to contributions}
#' \item{\code{age}}{a dummy variable that equals 1 if the respondent is over 64, 0 otherwise}
#' \item{\code{ms}}{a dummy variable that equals 1 if the respondent is married, 0 otherwise}
#' \item{\code{deps}}{the number of claimed dependents, as an integer}}
#'
#' @details
#'
#' Frees (2003) is the nominal source for these data, as they appear as toy data
#' sets for use in his book. He in turn cites Banerjee and Frees (1995), though
#' this citation may have been meant for a 1997 article in *Journal of the
#' American Statistical Association*. The
#' actual source for these data as I obtained them is Gujarati (2012). The
#' underlying source of the raw data are supposedly the 1979-1988
#' *Statistics of Income* Panel of Individual Tax Returns. Given the opacity of
#' the data, and its temporal limitations, these data should only be used for
#' illustration and not inference.
#'
#' The charitable contributions variable and income variables are very clearly
#' log-transformed. Banerjee and Price (1997) seem to imply the price variable
#' is as well.
#'
"charitable_contributions"
