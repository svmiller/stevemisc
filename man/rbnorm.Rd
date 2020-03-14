\name{rbnorm}
\alias{rbnorm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Bounded Normal (Really: Scaled Beta) Distribution
}
\description{
This is a function to randomly generate values from a bounded normal (really: a scaled beta) distribution with specified mean, standard deviation, and upper/lower bounds. I use this function to randomly generate data that we treat as interval for sake of getting means and standard  deviations, but have discernible bounds (and even skew) to teach students about things like random sampling and central limit theorem.
}
\usage{
rbnorm(n, mean, sd, lowerbound, upperbound, round = FALSE, seed)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{
Number of observations to generate.
}
  \item{mean}{
A set mean
}
  \item{sd}{
A set standard deviation.
}
  \item{lowerbound}{
A lower bound on the data to generate. I typically go with 0 here for illustration.
}
  \item{upperbound}{
An upper bound on the data to generate. I typically go with 100 here for illustration.
}
  \item{round}{
Should the values be rounded to whole integers? Defaults to no rounding in the absence of this parameter.
}
  \item{seed}{
OPTIONAL. set seed for the simulations.
}
}
\details{
There are no defaults for the mean and standard deviation. You must set those.
}
\value{

}
\references{

}
\author{
Steven V. Miller
}
\note{
I'm sure I ganked this from somewhere. I forget where.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
Data <- rbnorm(10000, 57, 14, 0, 100)
%\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
