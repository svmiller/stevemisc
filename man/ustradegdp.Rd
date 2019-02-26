\name{ustradegdp}
\alias{ustradegdp}
\docType{data}
\title{
U.S. Trade-to-GDP Ratio, 1790-2018
}
\description{
A yearly data set on the U.S. trade/gdp ratio (as a percentage) from 1790-2018.
}
\usage{data("ustradegdp")}
\format{
  A data frame with 229 observations on the following 2 variables.
  \describe{
    \item{\code{year}}{a numeric vector for the year}
    \item{\code{tradegdp}}{a numeric vector for the trade/GDP ratio (as a percentage)}
  }
}
\details{
Data: Various sources (see especially: http://www.econdataus.com/tradeall.html). Post-1960 data come from the World Bank. 2017 and 2018 observations are armchair calculations based on U.S. Census Bureau data (trade) and IMF data (GDP).
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(ustradegdp)
}
\keyword{datasets}
