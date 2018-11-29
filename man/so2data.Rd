\name{so2data}
\alias{so2data}
\docType{data}
\title{
Sulfur Dioxide Trends, 1980-2017
}
\description{
This data set contains yearly observations by the Environmental Protection Agency on the concentration of sulfur dioxide in parts per billion, based on 42 sites. I use this for in-class illustration. Note that the national standard is 75ppb.
}
\usage{data("so2data")}
\format{
  A data frame with 38 observations on the following 5 variables.
  \describe{
    \item{\code{year}}{The year of observation}
    \item{\code{meanppb}}{The mean concentration of sulfur dioxide in the air based on 42 trend sites, in parts per billion}
    \item{\samp{numtrendsites}}{The number of trend sites, a constant of 42}
    \item{\samp{lb}}{Lower bound estimate (10th percentile)}
    \item{\samp{ub}}{Upper bound estimate (90th percentile)}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(so2data)

}
\keyword{datasets}
