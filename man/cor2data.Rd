\name{cor2data}
\alias{cor2data}
\title{
Simulate Data from Correlation Matrix
}
\description{
A function to simulate data from a correlation matrix. This is useful for illustrating some theoretical properties of regressions when population parameters are known and set a priori.
}
\usage{
cor2data(cor, n, seed)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{cor}{
A properly correlation matrix (of class \code{matrix}).
}
  \item{n}{
Number of observations to simulate
}
  \item{seed}{
An optional parameter to set a seed. Omitting this generates new simulations every time.
}
}
\details{

}

\references{
%% ~put references to the literature/web site here ~
}
\author{
Steven V. Miller
}
\note{

}

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}

\examples{
vars = c("control", "treat", "instr", "e")
Correlations <- matrix(cbind(1, 0.001, 0.001, 0.001,
                             0.001, 1, 0.85, -0.5,
                             0.001, 0.85, 1, 0.001,
                             0.001, -0.5, 0.001, 1),nrow=4)
rownames(Correlations) <- colnames(Correlations) <- vars

Data <- cor2data(Correlations, 1000, 8675309)
}
