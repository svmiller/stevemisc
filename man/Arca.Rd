\name{Arca}
\alias{Arca}
\docType{data}
\title{
NYSE Arca Steel Index data, 2017--present
}
\description{
Daily data on the NYSE Arca Steel Index
}
\usage{data("Arca")}
\format{
  A data frame with 791 observations on the following 5 variables.
  \describe{
    \item{\code{date}}{a Date}
    \item{\code{close}}{a numeric vector for the closing price}
    \item{\code{open}}{a numeric vector for the opening price}
    \item{\code{high}}{a numeric vector for the daily high in trading}
    \item{\code{low}}{a numeric vector for the daily low in trading}
  }
}
\details{
Ganked from investing.com
}
\source{
https://www.investing.com/indices/arca-steel-historical-data
}
\references{

}
\examples{
data(Arca)
}
\keyword{datasets}
