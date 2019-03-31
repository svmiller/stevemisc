\name{imf_coffee_data}
\alias{imf_coffee_data}
\docType{data}
\title{
IMF Primary Commodity Price Data for Coffee (Arabica, Robustas), 1980-present
}
\description{
This is primary commodity price data for coffee (Arabica, Robustas) from 1980 to the present, periodically updated since FRED has stopped keeping track of these data in 2017.
}
\usage{data("imf_coffee_data")}
\format{
  A data frame with 470 observations on the following 4 variables.
  \describe{
    \item{\code{period}}{a character vector corresponding to the year-month, from IMF for posterity}
    \item{\code{date}}{a Date corresponding to the IMF period}
    \item{\code{arabica}}{the price (monthly average) of mild Arabica, via International Coffee Organization data, in nominal US cents per pound}
    \item{\code{robustas}}{the price (monthly average) of Robustas, via International Coffee Organization data, in nominal US cents per pound}
  }
}
\details{
The IMF says adds these prices are global and the New York cash price, ex-dock.
}
\source{
International Monetary Fund (Primary Commodity Prices), International Coffee Organization
}
\references{

}
\examples{
data(imf_coffee_data)
}
\keyword{datasets}
