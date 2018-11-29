\name{sealevels}
\alias{sealevels}
\docType{data}
\title{
Global Average Absolute Sea Level Change, 1880–2015
}
\description{
These data describe how sea level has changed over time, in both relative and absolute terms. Absolute sea level change refers to the height of the ocean surface regardless of whether nearby land is rising or falling.
}
\usage{data("sealevels")}
\format{
  A data frame with 136 observations on the following 5 variables.
  \describe{
    \item{\code{year}}{The year of observation}
    \item{\code{adjlev}}{CSIRO - Adjusted sea level (inches)}
    \item{\code{lb}}{CSIRO - Lower error bound (inches)}
    \item{\code{ub}}{CSIRO - Upper error bound (inches)}
    \item{\code{adjlev_noaa}}{NOAA - Adjusted sea level (inches)}
  }
}
\details{

}
\source{
https://www.epa.gov/climate-indicators/climate-change-indicators-sea-level
}
\references{
CSIRO (Commonwealth Scientific and Industrial Research Organisation). 2015 update to data originally published in: Church, J.A., and N.J. White. 2011. Sea-level rise from the late 19th to the early 21st century. Surv. Geophys. 32:585–602. www.cmar.csiro.au/sealevel/sl_data_cmar.html.

NOAA (National Oceanic and Atmospheric Administration). 2016. Laboratory for Satellite Altimetry: Sea level rise. Accessed June 2016. www.star.nesdis.noaa.gov/sod/lsa/SeaLevelRise/LSA_SLR_timeseries_global.php.
}
\examples{
data(sealevels)
}
\keyword{datasets}
