\name{theme_steve}
\alias{theme_steve}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Steve's preferred ggplot theme
}
\description{
I prefer this default theme for ggplot2, which is basically \code{theme_bw()} with me tweaking little things around it.
}
\usage{
theme_steve()
}
%- maybe also 'usage' for other objects documented here.
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

library(ggplot2) # no point in using this function without it.

Data <- data.frame(x = rnorm(100), y = rnorm(100, 2.5))

ggplot(Data, aes(x,y)) + geom_line() + theme_steve() +
ggtitle("A Nonsense Graph with Steve's Preferred ggplot Theme") +
labs(caption="Looks pretty, though. Right?")


}
