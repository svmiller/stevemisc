\name{oecd_forecasts}
\alias{oecd_forecasts}
\docType{data}
\title{
OECD Long-Term GDP Forecast
}
\description{
The OECD has long-term forecasts (up to 2060) of total gross domestic product. Here's that data.
}
\usage{data("oecd_forecasts")}
\format{
  A data frame with 3437 observations on the following 4 variables.
  \describe{
    \item{\code{country}}{a character vector (iso3c)}
    \item{\code{indicator}}{a character vector (a constant: GDP total forecast)}
    \item{\code{year}}{a numeric vector for the year}
    \item{\code{value}}{GDP (or future long-term forecast) in millions USD, denominated in missions USD 2010 PPP.}
  }
}
\details{
For in-class illustration. Values likely to change if you download newer versions of the data (check reference section for exact date.)
}
\source{
OECD Outlook No 95 - May 2014 - Long-term baseline projections provided by  Organisation for Economic Co-operation and Development (OECD)
}
\references{
}
\examples{
data(oecd_forecasts)
}
\keyword{datasets}
