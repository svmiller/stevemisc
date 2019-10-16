\name{sugar_prices}
\alias{sugar_prices}
\docType{data}
\title{
IMF Primary Commodity Price Data for Sugar, 1980-present
}
\description{
This is primary commodity price data for sugar globally, in the U.S., and in Europe for every month from 1980 to (roughly) the present. Prices are nominal U.S. cents per pound and are not seasonally adjusted.
}
\usage{data("sugar_prices")}
\format{
  A data frame with 1302 observations on the following 3 variables.
  \describe{
    \item{\code{date}}{a Date}
    \item{\code{group}}{a character vector for the group (Global, United States, Europe)}
    \item{\code{value}}{a numeric vector for the price in U.S. cents per pound (NSA, nominal)}
  }
}
\details{
The price data for Europe do not appear to be updated as regularly as the global and U.S. prices. Thus, the last month in the data for Europe are June 2017.
}
\source{
International Monetary Fund (Primary Commodity Prices)
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(sugar_prices)

}
\keyword{datasets}
