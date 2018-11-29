\name{clemsontemps}
\alias{clemsontemps}
\docType{data}
\title{
Daily Clemson Temperature Data, 1930-Present
}
\description{
This data set contains daily temperatures (highs) for Clemson, South Carolina from Jan. 1, 1930 to, right now, Dec. 31, 2017. The goal is to update this periodically with new data for as long as I live in this town.
}
\usage{data("clemsontemps")}
\format{
  A data frame with 32412 observations on the following 13 variables.
  \describe{
    \item{\code{date}}{a Date}
    \item{\code{datatype}}{TMAX, or max temperatures}
    \item{\code{station}}{Station identifier for NOAA}
    \item{\code{value}}{the daily high in Celsius*10. I don't know why NOAA did this but there you go.}
    \item{\code{fl_m}}{a character vector}
    \item{\code{fl_q}}{a character vector}
    \item{\code{fl_so}}{a character vector}
    \item{\code{fl_t}}{a character vector}
    \item{\code{year}}{The year}
    \item{\code{month}}{The month, as numeric (1-12)}
    \item{\code{day}}{The day, as numeric (1-31)}
    \item{\code{yd}}{The day in the year, which runs from 1 (Jan. 1), to a max of 366 (i.e. Dec. 31 in leap years)}
    \item{\code{tmax}}{The daily high, adjusted to Fahrenheit.}
  }
}
\details{
Data obtained from NOAA, via the rnoaa package.
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(clemsontemps)
}
\keyword{datasets}
