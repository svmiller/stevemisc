\name{r2sd}
\alias{r2sd}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Rescale Vector by Two Standard Deviations
}
\description{
Gelman (2008) argues that rescaling by two standard deviations puts regression inputs on roughly the same scale no matter their original scale. This allows for some honest, if preliminary, assessment of relative effect sizes from the regression output. This does that, but without requiring the \code{rescale} function from \pkg{arm}. I'm trying to reduce the packages on which my workflow relies.

Importantly, I tend to rescale only the ordinal and interval inputs and leave the binary inputs as 0/1. So, my \code{r2sd} function doesn't have any of the fancier elseifs that Gelman's \code{rescale} function has.
}
\usage{
r2sd(x, na.rm = T)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
 A numeric vector
}
  \item{na.rm}{
What to do with missing values in the vector? By default, I ignore them. If you set this to \code{FALSE}, everything will come back with \code{NA} if there is a missing value in the vector.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
A standardized vector
}

\references{Andrew Gelman. 2008.
    \dQuote{Scaling Regression Inputs by Dividing by Two Standard Deviations}.
    \emph{Statistics in Medicine} 27: 2865--2873.
    \url{http://www.stat.columbia.edu/~gelman/research/published/standardizing7.pdf}
}

\author{
Steven V. Miller
}

\note{

}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
x <- rnorm(100, 50, 3)
r2sd(x)
}
