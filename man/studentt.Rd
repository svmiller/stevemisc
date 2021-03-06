% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/studentt.R
\name{studentt}
\alias{studentt}
\alias{dst}
\alias{pst}
\alias{qst}
\alias{rst}
\title{The Student-t Distribution (Location-Scale)}
\usage{
dst(x, df, mu, sigma)

pst(q, df, mu, sigma)

qst(p, df, mu, sigma)

rst(n, df, mu, sigma)
}
\arguments{
\item{x, q}{a vector of quantiles}

\item{df}{a vector of degrees of freedom}

\item{mu}{a vector for the location value}

\item{sigma}{a vector of scale values}

\item{p}{Vector of probabilities.}

\item{n}{Number of samples to draw from the distribution.}
}
\value{
\code{dst()} returns the density. \code{pst()} returns the distribution function. \code{qst()} returns the quantile function.
\code{rst()} returns random numbers.
}
\description{
These are density, distribution function, quantile function and random generation
for the Student-t distribution with location \code{mu}, scale \code{sigma},
and degrees of freedom \code{df}. Base R gives you the so-called "standard" Student-t
distribution, with just the varying degrees of freedom. This generalizes that standard
Student-t to the three-parameter version.
}
\details{
This is a simple hack taken from Wikipedia. It's an itch I've been wanting to scratch for a while. I can probably
generalize this outward to allow the tail and log stuff, but I wrote this mostly for the random number generation. Right now,
I haven't written this to account for the fact that sigma should be non-negative, but that's on the user to know that (for now).
}
\seealso{
\code{\link[stats:TDist]{TDist}}
}
