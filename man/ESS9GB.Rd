\name{ESS9GB}
\alias{ESS9GB}
\docType{data}
\title{
What Do We Know About British Attitudes Toward Immigration?
}
\description{
This is a replication data set to accompany a blog post and presentation to students at the University of Nottingham on March 2020.
}
\usage{data("ESS9GB")}
\format{
  A data frame with 1905 observations on the following 15 variables.
  \describe{
    \item{\code{name}}{a character for the name of the survey}
    \item{\code{essround}}{a numeric for the ESS round}
    \item{\code{edition}}{a character for the particular edition of the ESS round}
    \item{\code{idno}}{a numeric/unique identifier}
    \item{\code{cntry}}{a character vector for the country (i.e. the UK)}
    \item{\code{region}}{a character vector for the region of the UK the respondent lives}
    \item{\code{brncntr}}{a numeric vector for if the respondent was born in the UK}
    \item{\code{stintrvw}}{a Date for the interview start date}
    \item{\code{endintrvw}}{a Date for the interview end date}
    \item{\code{imbgeco}}{a numeric vector for if respondent thinks immigrants are generally good or bad for UK's economy. Higher values = good}
    \item{\code{imueclt}}{a numeric vector for if respondent thinks immigrants enrich or undermine UK's culture. Higher values = enrich more than undermine}
    \item{\code{imwbcnt}}{a numeric vector for if respondent thinks immigrants make UK a better place to live. Higher values = better place to live}
    \item{\code{immigsent}}{a numeric vector for immigration sentiment (i.e. \code{imbgeco + imueclt + imwbcnt}). Higher values = more pro-immigration sentiment}
    \item{\code{agea}}{a numeric vector for the respondent's age in years}
    \item{\code{female}}{a numeric vector for whether the respondent is a woman}
    \item{\code{eduyrs}}{a numeric vector for total years of education for the respondent}
    \item{\code{uempla}}{a numeric vector for whether the respondent is currently unemployed but seeking work}
    \item{\code{hinctnta}}{a numeric vector for household income in deciles}
    \item{\code{lrscale}}{a numeric vector for the ideology of the respondent on an 11-point [0:10] scale}
  }
}
\details{
See: svmiller.com/blog for accompanying blog post/analysis of these data.
}
\source{
European Social Survey, Round 9
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(ESS9GB)
}
\keyword{datasets}
