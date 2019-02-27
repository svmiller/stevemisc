\name{aluminum_premiums}
\alias{aluminum_premiums}
\docType{data}
\title{
LME Aluminum Premiums Data, Jan. 2018-Jan.2019
}
\description{
A near daily data set on the price of aluminum premiums (USD/MT) for LME in the U.S., Western Europe, East Asia, and Southeast Asia.
}
\usage{data("aluminum_premiums")}
\format{
  A data frame with 1120 observations on the following 3 variables.
  \describe{
    \item{\code{date}}{a Date}
    \item{\code{group}}{a factor with levels \code{East Asia} \code{Southeast Asia} \code{United States} \code{Western Europe}}
    \item{\code{price}}{a numeric vector for the price of the LME aluminum premium}
  }
}
\details{
LME aluminum premiums (monthly contracts going out to 15 months) work alongside LME aluminum contracts to allow market participants to hedge the all-in price and physically deliver or receive premium aluminium warrants in non-queued LME premium warehouses. The data may not be perfect for this exercise but they're available.
}
\source{
LME Group
}
\references{
LME Group
}
\examples{
data(aluminum_premiums)

}
\keyword{datasets}
