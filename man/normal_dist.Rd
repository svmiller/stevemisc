\name{normal_dist}
\alias{normal_dist}
\title{
Make a normal distribution in R and ggplot
}
\description{
This makes a normal distribution in ggplot, with areas labeled underneath the curve for 68\%, 90\%, 95\%, and 99\%.
}
\usage{
normal_dist(curvecolor, fillcolor, fontfamily)
}
\arguments{
  \item{curvecolor}{
Defines the color at the top of the curve. Any \code{ggplot2}-recognized format should do here.
}
  \item{fillcolor}{
Defines the color at the top of the curve. Any \code{ggplot2}-recognized format should do here.
}
  \item{fontfamily}{
font family for labeling areas underneath the curve. OPTIONAL. You can omit this if you'd like.
}
}
\details{
Requires \code{ggplot2} or \code{tidyverse}, which I'm going to assume you've loaded into your session.
}
\value{

}
\references{

}
\author{
Steven V. Miller
}
\note{
I'm not great with writing functions. I wish I knew of an easier way to make the \code{fontfamily} argument optional.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
library(tidyverse)
library(stevemisc)

normal_dist("blue","red")
}
