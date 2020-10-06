\name{smvrnorm}
\alias{smvrnorm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Simulate from a Multivariate Normal Distribution
}
\description{
Produces one or more samples from a multivariate normal distribution.
}
\usage{
smvrnorm(n = 1, mu, sigma, tol = 1e-06, empirical = FALSE, eispack = FALSE, seed)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{the number of samples required.}
  \item{mu}{a vector giving the means of the variables.}
  \item{sigma}{a positive-definite symmetric matrix specifying the
    covariance matrix of the variables.}
  \item{tol}{tolerance (relative to largest variance) for numerical lack
    of positive-definiteness in \code{Sigma}.}
  \item{empirical}{logical. If true, mu and Sigma specify the empirical
    not population mean and covariance matrix.}
  \item{eispack}{logical: values other than \code{FALSE} are an error.}
  \item{seed}{set seed for (optional) reproducibility}
}
\details{
 This is just a port/plagiarism of \code{mvrnorm} from the MASS package. I elect to plagiarize/port it because the MASS package conflicts with a lot of things in my workflow, especially \code{select}.
}

\references{
 B. D. Ripley (1987) \emph{Stochastic Simulation.} Wiley. Page 98.
}
\author{
%%  ~~who you are~~
}
\note{
Causes creation of the dataset \code{.Random.seed} if it does
  not already exist, otherwise its value is updated.
}

\examples{
library(stevemisc)
Sigma <- matrix(c(10,3,3,2),2,2)
Sigma
var(smvrnorm(n = 1000, rep(0, 2), Sigma))
var(smvrnorm(n = 1000, rep(0, 2), Sigma, empirical = TRUE))
}
