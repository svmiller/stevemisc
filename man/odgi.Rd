\name{odgi}
\alias{odgi}
\docType{data}
\title{
Ozone Depleting Gas Index Data, 1992-2018
}
\description{
The NOAA Earth System Research Laboratory has an ozone depleting gas index (ODGI) data set from 1992 to 2018. This dataset summarizes Table 1 and Table 2 from its website in a tidy/long format. The primary interest here (for my purposes) is the ODGI indices (including the new 2012 measure). The data set includes constituent greenhouse gases/chlorines as well in parts per trillion. The primary use here is for in-class illustration.
}
\usage{data("odgi")}
\format{
  A data frame with 756 observations on the following 4 variables.
  \describe{
    \item{\code{Year}}{the year of observation}
    \item{\code{Area}}{categorical for Antarctic or Mid-latitudes}
    \item{\code{Category}}{categorical, whether for the particular greenhouse gas (e.g. CFC-11, CFC-12, CH3Cl) or the ODGI measures of interest to me.}
    \item{\code{Value}}{a numeric vector}
  }
}
\details{
I'm working under the assumption that the constituent gases in \code{Value} is measured in parts per trillion while the ODGI measures are a separate index measure. Use with caution.
}
\source{
https://www.esrl.noaa.gov/gmd/odgi/
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(odgi)
}
\keyword{datasets}
