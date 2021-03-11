\name{usa_mids}
\alias{usa_mids}
\docType{data}
\title{
United States Militarized Interstate Disputes (MIDs)
}
\description{
This is a non-directed dyad-year data set for militarized interstate disputes involving the United States. I use this to illustrate the \code{sbtscs()} function.
}
\usage{data("usa_mids")}
\format{
  A data frame with 14586 observations on the following 6 variables.
  \describe{
    \item{\code{dyad}}{a numeric vector for a unique dyad-identifier}
    \item{\code{ccode1}}{a numeric vector for the lower Correlates of War country code in the dyad (i.e. \code{ccode1} == 2)}
    \item{\code{ccode2}}{a numeric vector for the other Correlates of War country code in the dyad (i.e. not involving the United States)}
    \item{\code{year}}{a numeric vector for the year}
    \item{\code{midongoing}}{a numeric vector for whether there is a dispute ongoing in the dyad-year}
    \item{\code{midonset}}{a numeric vector for whether there is a unique dispute onset in the dyad-year}
  }
}
\details{
Rare cases where there were multiple disputes ongoing in a given dyad-year were first whittled by isolating 1) unique dispute onsets. Thereafter, the data select the 2) highest fatality, then 3) the highest hostility level, and then 4) the longer dispute, until 5) just picking whichever one came first. There are no duplicate non-directed dyad-year observations.
}
\source{
Gibler, Douglas M., Steven V. Miller, and Erin K. Little. 2016. "An Analysis of the Militarized Interstate Dispute (MID) Dataset, 1816-2001." International Studies Quarterly 60(4): 719-730.
}
\references{
Miller, Steven V. 2017. "Quickly Create Peace Years for BTSCS Models with \code{sbtscs()} in \code{stevemisc}." \url{http://svmiller.com/blog/2017/06/quickly-create-peace-years-for-btscs-models-with-stevemisc/}
}
\examples{
data(usa_mids)
}
\keyword{datasets}
