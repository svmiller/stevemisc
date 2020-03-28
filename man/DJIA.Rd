\name{DJIA}
\alias{DJIA}
\docType{data}
\title{
Dow Jones Industrial Average Data, 1885-2019
}
\description{
This data set contains the value of the Dow Jones Industrial Average on daily close for all available dates (to the best of my knowledge) from 1885 to 2019. Extensions to 2020 and beyond shouldn't be too difficult with existing packages.
}
\usage{data("DJIA")}
\format{
  A data frame with 36951 observations on the following 2 variables.
  \describe{
    \item{\code{date}}{a Date}
    \item{\code{djia}}{a numeric vector for the value of the Dow Jones Industrial Average at daily close.}
  }
}
\details{
Observations before October 7, 1896 are from the single Dow Jones Average. Observations from October 7, 1896 to July 30, 1914 are from the first DJIA. Observations before the 1914 closure of the first DJIA in July 1914 come from MeasuringWorth. Observations from its reopening in Dec. 12, 1914 to January 28, 1985 come from Pinnacle Systems. Observations from January 29, 1985 to the most recent observation come from a \code{quantmod} call.
}
\source{
}
\references{
Samuel H. Williamson, 'Daily Closing Value of the Dow Jones Average, 1885 to Present,' MeasuringWorth, 2019.

Jeffrey A. Ryan and Joshua M. Ulrich, 'quantmod: Quantitative Financial Modelling Framework,' 2018.
}
\examples{
data(DJIA)
}
\keyword{datasets}
