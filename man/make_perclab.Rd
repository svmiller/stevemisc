\name{make_perclab}
\alias{make_perclab}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Make Percentage Label for Proportion and Add Percentage Sign
}
\description{
This takes a proportion, multiplies it by 100, (optionally) rounds it to a set decimal point, and pastes a percentage sign next to it. This function is useful if you're modeling proportions in ggplot as a bar chart (for which proportions are more flexible) but want to label each bar as a percentage
}
\usage{
make_perclab(x, n)
}

\arguments{
  \item{x}{
A numeric vector, ideally between 0 and 1.
}
  \item{n}{
Optionally rounds a numeric vector to a set number of decimal points. Defaults to zero in the absence of a value.
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

x <- dnorm(rnorm(10))
y <- make_perclab(x, 2)

data.frame(x,y)

}
