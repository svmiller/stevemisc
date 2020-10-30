\name{r1sd}
\alias{r1sd}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Rescale Vector by One Standard Deviation
}
\description{
I don't like how clunky it is to do a rescale in base R. So, here's a function for it.
}
\usage{
r1sd(x, na = T)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
 A numeric vector
}
  \item{na}{
What to do with missing values in the vector? By default, I ignore them. If you set this to \code{FALSE}, everything will come back with \code{NA} if there is a missing value in the vector. If you ignore the \code{na} field altogether and run something like \code{r1sd(x)}, the \code{na.rm=TRUE} is assumed to be what you wanted.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
A standardized vector
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
r1sd(x)
}
