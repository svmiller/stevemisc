\name{sbtscs}
\alias{sbtscs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Create 'peace years' by cross-sectional unit
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
sbtscs(data, event, tvar, csunit, pad_ts = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
Data set with which you are working.
}
  \item{event}{
Some event (binary) for which you want peace years.
  }
  \item{tvar}{
  The time variable (likely the year).
  }
  \item{csunit}{
  The cross-sectional unit (likely a dyad, if you're doing IR stuff).
  }
  \item{pad_ts}{Should time-series be filled when panels are unbalanced/have gaps.}
}
\details{
I should confess outright, and it should be obvious to anyone who looks at the code, that I liberally copy from Dave Armstrong's \code{btscs} function in the \code{DAMisc} package. I offer two such improvements. One, the \code{btscs} function chokes when a large number of cross-sectional units have no recorded "event." I don't know why this happens but it does. Further, "tidying" up the code by leaning on \code{dplyr} substantially speeds up computation. Incidentally, this concerns the same cross-sectional units with no recorded events that can choke the \code{btscs} function in large numbers.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
Armstrong, Dave. 2016. ``DAMisc: Dave Armstrong's Miscellaneous Functions.'' \emph{R package version 1.4-3}. \href{https://cran.r-project.org/web/packages/DAMisc/index.html}{https://CRAN.R-project.org/package=DAMisc}
}
\author{
David A. Armstrong
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

library(tidyverse) # load tidyverse. tidyverse uber alles
library(stevemisc)
data(usa_mids)

# notice: no quotes, contra DAMisc's btscs
usa_mids <- as_tibble(sbtscs(usa_mids, midongoing, year, dyad))

usa_mids

}
