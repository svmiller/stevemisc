\name{cardkrieger1994mwe}
\alias{cardkrieger1994mwe}
\docType{data}
\title{
Minimum Wages and Employment: A Case Study of the Fast-Food Industry in NJ and PA
}
\description{
This is a toy data set, derived from the Card and Krieger (1994) study, for assessing causal effects of mininum wage laws. This particular data set is just cobbled from Imai's book.
}
\usage{data("cardkrieger1994mwe")}
\format{
  A data frame with 358 observations on the following 8 variables.
  \describe{
    \item{\code{chain}}{a factor with levels \code{burgerking} \code{kfc} \code{roys} \code{wendys}}
    \item{\code{location}}{a factor with levels \code{centralNJ} \code{northNJ} \code{PA} \code{shoreNJ} \code{southNJ}}
    \item{\code{b_wage}}{mean wages before the minimum wage change in NJ}
    \item{\code{a_wage}}{mean wages after the minimum wage change in NJ}
    \item{\code{b_full}}{full-time workers before the minimum wage change in NJ}
    \item{\code{a_full}}{full-time workers after the minimum wage change in NJ}
    \item{\code{b_part}}{part-time workers before the minimum wage change in NJ}
    \item{\code{a_part}}{part-time workers after the minimum wage change in NJ}
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
library(tidyverse)
library(stevemisc)
data(cardkrieger1994mwe)
}
\keyword{datasets}
