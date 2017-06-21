\name{sample_mids}
\alias{sample_mids}
\docType{data}
\title{
Sample MIDs
}
\description{
This is a sample of MIDs from the Gibler-Miller-Little MID data (see: Gibler et al., 2016). Data are clearly illustrative, so I wouldn't try to do serious inference on it.
}
\usage{data("sample_mids")}
\format{
  A data frame with 489 observations on the following 6 variables.
  \describe{
    \item{\code{ccode1}}{Correlates of War (CoW) code for first state (recall: non-directed).}
    \item{\code{ccode2}}{Correlates of War (CoW) code for second state (recall: non-directed).}
    \item{\code{dyad}}{Unique identifier for dyad (e.g. 1002020, 1002031, 1750770).}
    \item{\code{year}}{Year of observation.}
    \item{\code{midongoing}}{Is there a MID ongoing in the observation year? (1 = yes; 0 = no)}
    \item{\code{midonset}}{Is there a unique MID onset in the observation year? (1 = yes; 0 = no)}
    \item{\code{dispnum3}}{Where applicable, the Correlates of War (CoW) MID identifier.}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
Gibler, Douglas M., Steven V. Miller, and Erin K. Little. 2016. "An Analysis of the Militarized Interstate Dispute (MID) Dataset, 1816-2001." \emph{International Studies Quarterly} 60(4): 719-730.
}
\examples{
data(sample_mids)

}
\keyword{datasets}
