\name{ukg_eeri}
\alias{ukg_eeri}
\docType{data}
\title{
United Kingdom Effective Exchange Rate Index Data, 1990-2018
}
\description{
This is a (near) daily data set on the effective exchange rate index for the United Kingdom's pound sterling from 1990 to 2018. The data are indexed, such that 100 equals the monthly average in January 2005. This is useful for illustrating devaluations in the pound after Black Wednesday, the financial crisis, and, more recently, Brexit.
}
\usage{data("ukg_eeri")}
\format{
  A data frame with 7330 observations on the following 2 variables.
  \describe{
    \item{\code{date}}{a Date}
    \item{\code{eeri}}{a numeric vector for the effective exchange rate index (Jan. 2005 = 100)}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
Bank of England
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(ukg_eeri)
}
\keyword{datasets}
