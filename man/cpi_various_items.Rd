\name{cpi_various_items}
\alias{cpi_various_items}
\docType{data}
\title{
Consumer Price Index for Various Items, Jan. 2000-Dec. 2018
}
\description{
These data contain price indices for various items for the general urban consumer. Categories include medical services, college tuition, college textbooks, child care, housing, food and beverages, all items (i.e. general CPI), new vehicles, apparel, and televisions. The base period in \code{value} is the 1982-4 average but the base period in \code{cpi} is Jan. 2000.
}
\usage{data("cpi_various_items")}
\format{
  A data frame with 2257 observations on the following 10 variables.
  \describe{
    \item{\code{year}}{a numeric vector for year}
    \item{\code{period}}{a character vector for the month}
    \item{\code{periodName}}{a character vector for the month, spelled out}
    \item{\code{latest}}{is the observation the latest on record (i.e. is it from Dec. 2018)?}
    \item{\code{value}}{the price index. Base: 1982-4}
    \item{\code{footnotes}}{a character vector for any footnotes}
    \item{\code{seriesID}}{a character vector for the series ID on the Bureau of Labor Statistics}
    \item{\code{date}}{a Date}
    \item{\code{Category}}{a factor with levels \code{Medical Services}, \code{College Tuition}, \code{College Textbooks}, \code{Child Care}, \code{Housing}, \code{All Items}, \code{Food/Beverages}, \code{New Vehicles}, \code{Apparel}, \code{Televisions}}
    \item{\code{cpi}}{the price index. Base: Jan. 2000.}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
Bureau of Labor Statistics, via the \code{blscrapeR} package.
}
\references{
Inspiration: http://www.aei.org/publication/chart-of-the-day-century-price-changes-1997-to-2017/
}
\examples{
data(cpi_various_items)
## maybe str(cpi_various_items) ; plot(cpi_various_items) ...
}
\keyword{datasets}
