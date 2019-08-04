\name{ghp100k}
\alias{ghp100k}
\docType{data}
\title{
Yearly Rate of Gun Homicide per 100,000 People
}
\description{
This the yearly rate of gun homicides per 100,000 people in the population, selecting on "Western" countries of interest.
}
\usage{data("ghp100k")}
\format{
  A data frame with 561 observations on the following 5 variables.
  \describe{
    \item{\code{metric}}{a character vector (a constant for the metric in question)}
    \item{\code{country}}{a character vector for the country}
    \item{\code{year}}{a numeric vector for the year}
    \item{\code{ghp100k}}{a numeric vector for the estimated rate of gun homicide per 100,000 people}
    \item{\code{source}}{a character vector for the source (gunpolicy.org)}
  }
}
\details{
The reported, or calculated annual crude rate of completed, intentional homicide committed with a firearm, per 100,000 population, in years descending.

Where a jurisdiction's published count of 'annual homicide' includes cases of attempted (uncompleted) homicide, these figures have been disaggregated wherever possible.

In the United States, this category is confused by inaccurate and conflicting data published, suppressed or labelled as unreliable by the Centers for Disease Control and Prevention (CDC) and the Federal Bureau of Investigation (FBI). Suppression can result in zero values where in fact homicides did occur.

Incomplete classification by local agencies can also result in a significant proportion of events being categorised as 'unknown cause' or similar.

Before quoting these datasets, please follow the citation links for a description of the considerable differences between them and the reasons for data suppression.

Where a rate is calculated by GunPolicy.org, a matched population estimate is also cited.}

\source{
https://www.gunpolicy.org
}
\references{
https://www.gunpolicy.org
}
\examples{
data(ghp100k)
}
\keyword{datasets}
