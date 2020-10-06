\name{show_ranef}
\alias{show_ranef}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Get caterpillar plot of random effects from lme4 model.
}
\description{
Useful if you want to explore variation among different levels of a random effect in a mixed effects model.
}
\usage{
show_ranef(data, grp, reorder = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
Fitted model (i.e. a \code{merMod} object)
}
  \item{grp}{
What particular random effect do you want? Put it in quotes.
}
  \item{reorder}{
Optional argument. Default is \code{TRUE}, which ``re-orders'' the intercepts by the original value in the data. If \code{FALSE}, the ensuing caterpillar plot defaults to ggplot's default method of ordering the levels of the random effect: by their estimated conditional mode.
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
library(lme4) # No point in using this function w/o lme4
data(sleepstudy)

M1 <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy)
show_ranef(M1, "Subject")
}
