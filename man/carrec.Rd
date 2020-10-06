\name{carrec}
\alias{carrec}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Recode a Variable
}
\description{
This recodes a numeric vector, character vector, or factor according to fairly simple recode specifications that former Stata users will appreciate. Yes, this is ganked from John Fox's \code{recode} function in his \pkg{car} package. I'm going with \code{carrec} (i.e. shorthand for \code{car::recode}, phoenetically here: "car-wreck") for this package, with an additional shorthand of \code{carr} that does the same thing.

The goal here is to minimize the number of function clashes with multiple packages that I use in my workflow. For example: \pkg{car}, \pkg{dplyr}, and \pkg{Hmisc} all have \code{recode} functions. I rely on the \pkg{car} package just for this function, but it conflicts with some other \pkg{tidyverse} functions that are vital to my workflow.
}
\usage{
carrec(var, recodes, as_fac, as_num = TRUE, levels)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{var}{
numeric vector, character vector, or factor
}
  \item{recodes}{
  character string of recode specifications: see below, but former Stata users will find this stuff familiar.
}
  \item{as_fac}{
return a factor; default is \code{TRUE} if \code{var} is a factor, \code{FALSE} otherwise.
}
  \item{as_num}{
if \code{TRUE} (which is the default) and \code{as.factor} is \code{FALSE}, the result will be coerced to a numeric if all values in the result are numeric. This should be what you want in 99\% of applications for regression analysis.
}
  \item{levels}{
an optional argument specifying the order of the levels in the returned factor; the default is to use the sort order of the level names.
}
}
\details{
Recode specifications appear in a character string, separated by semicolons (see the examples below), of the form input=output. If an input value satisfies more than one specification, then the first (from left to right) applies. If no specification is satisfied, then the input value is carried over to the result. NA is allowed on input and output.
}
\value{
a recoded vector the same length as \code{var}.
}

\author{John Fox \email{jfox@mcmaster.ca}}

\references{
  Fox, J. and Weisberg, S. (2019)
  \emph{An R Companion to Applied Regression}, Third Edition, Sage.
}

\note{
I ganked this from the \pkg{car} package. I hope I've made that abundantly clear by now.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}

\examples{

library(stevemisc)
x <- seq(1,10)
carrec(x,"0=0;1:2=1;3:5=2;6:10=3")
}
