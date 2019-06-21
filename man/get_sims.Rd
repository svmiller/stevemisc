\name{get_sims}
\alias{get_sims}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Get Simulations from a merMod Object (with New Data)
}
\description{
This (should) be a flexible function that takes a merMod object (estimated from \pkg{lme4}, \pkg{blme}, etc.) and generates some quantities of interest when paired with new data of observations of interest.
}
\usage{
get_sims(model, newdata, nsim, seed)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{
A merMod object.
}
  \item{newdata}{
A data frame of some quantities of interest to be simulated.
}
  \item{nsim}{
Number of simulations to be run.
}
  \item{seed}{
A reproducible seed
}
}
\details{
Pretty sure I wrote this with glms in mind, FYI. Leans heavily on the \code{sim} function from \pkg{arm}.
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
Steven V. Miller
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
