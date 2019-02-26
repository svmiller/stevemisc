\name{ustradegdp}
\alias{ustradegdp}
\docType{data}
\title{
U.S. Trade-to-GDP Ratio, 1790-2018
}
\description{
A yearly data set on the U.S. trade/gdp ratio (as a percentage) from 1790-2018. Data focus primarily on merchandise imports/exports.
}
\usage{data("ustradegdp")}
\format{
  A data frame with 229 observations on the following 7 variables.
  \describe{
    \item{\code{year}}{a numeric vector for year}
    \item{\code{gdp}}{U.S. GDP (nominal, millions)}
    \item{\code{gdpb}}{U.S. GDP (nominal, billions)}
    \item{\code{pop}}{Population size of the U.S. (thousands)}
    \item{\code{impo}}{The value of U.S. imports (in billions USD)}
    \item{\code{expo}}{The value of U.S. exports (in billions USD)}
    \item{\code{balance}}{exports - imports}
  }
}
\details{
Data: Various sources (see especially: http://www.econdataus.com/tradeall.html). Post-1989 data come from the U.S. Census Bureau. 2018 GDP comes from IMF. 2018 population estimate comes from U.S. Census Bureau
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
