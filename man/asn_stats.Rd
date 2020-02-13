\name{asn_stats}
\alias{asn_stats}
\docType{data}
\title{
Aviation Safety Network Statistics, 1942-2019
}
\description{
These are yearly counts on air accidents and fatalities, including measures for corporate jet accidents and hijackings. The hijackings are of particular interest to me, at least from a historical terrorism perspective.
}
\usage{data("asn_stats")}
\format{
  A data frame with 78 observations on the following 7 variables.
  \describe{
    \item{\code{year}}{a numeric vector}
    \item{\code{airacc}}{a numeric vector for the number of airliner accidents}
    \item{\code{airfatal}}{a numeric vector for the number of fatalities from airliner accidents}
    \item{\code{corpjetacc}}{a numeric vector for the number of corporate jet accidents}
    \item{\code{corpjetfatal}}{a numeric vector for the number of fatalities from corporate jet accidents}
    \item{\code{hijack}}{a numeric vector for the number of hijackings/skyjackings}
    \item{\code{hijackfatal}}{a numeric vector for the number of fatalities from hijackings/skyjackings}
  }
}
\details{
All fatality estimates exclude ground fatalities. All accidents are hull-loss accidents. The airliner figures are for those flights with at least 14 passengers.
}
\source{
Aviation Safety Network, a service provided by the Flight Safety Foundation
}
\references{
https://aviation-safety.net/statistics/period/stats.php?cat=H2
}
\examples{
data(asn_stats)
}
\keyword{datasets}
