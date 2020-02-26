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
  A data frame with 36698 observations on the following 2 variables.
  \describe{
    \item{\code{date}}{a Date}
    \item{\code{djia}}{a numeric vector for the value of the Dow Jones Industrial Average at daily close.}
  }
}
\details{
Observations before October 7, 1896 are from the single Dow Jones Average. Observations from October 7, 1896 to July 30, 1914 are from the first DJIA. Missing observations (since 1985) imputed from a call from quantmod, which scraped the DJIA since 1985.
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
