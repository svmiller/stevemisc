% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cor2data.R
\name{cor2data}
\alias{cor2data}
\title{Simulate Data from Correlation Matrix}
\usage{
cor2data(cor, n, seed)
}
\arguments{
\item{cor}{A correlation matrix (of class \code{matrix})}

\item{n}{A number of observations to simulate}

\item{seed}{An optional parameter to set a seed. Omitting this generates new simulations every time.}
}
\value{
\code{cor2data()} returns a data frame where all observations are simulated from a standard
normal distribution, but with those pre-set correlations.
}
\description{
A function to simulate data from a correlation matrix.
This is useful for illustrating some theoretical properties of
regressions when population parameters are known and set in advance.
}
\examples{
vars <- c("control", "treat", "instr", "e")
Correlations <- matrix(cbind(1, 0.001, 0.001, 0.001,
                             0.001, 1, 0.85, -0.5,
                            0.001, 0.85, 1, 0.001,
                           0.001, -0.5, 0.001, 1),nrow=4)

rownames(Correlations) <- colnames(Correlations) <- vars

cor2data(Correlations, 1000, 8675309)

}
\author{
Steven V. Miller
}
