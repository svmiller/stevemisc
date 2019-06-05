\name{make_scale}
\alias{make_scale}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Make a User-Defined (Re-)Scaled Variable
}
\description{
Rescale a vector to be on a different scale.
}
\usage{
make_scale(x, max, min, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A vector to be rescaled
}
  \item{max}{
What should the max observation of this rescaled variable be?
}
  \item{min}{
What should the minimum observation of this rescaled variable be?
}
  \item{\dots}{
Optional arguments
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, max, min, ...)
((max - min) * (x - min(x)))/(max(x) - min(x)) + min
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
