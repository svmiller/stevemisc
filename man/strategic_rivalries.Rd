\name{strategic_rivalries}
\alias{strategic_rivalries}
\docType{data}
\title{
Strategic Rivalries, 1494-2010
}
\description{
A simple summary of all strategic (inter-state) rivalries from Thompson and Dreyer (2012).
}
\usage{data("strategic_rivalries")}
\format{
  A data frame with 197 observations on the following 10 variables.
  \describe{
    \item{\code{rivalryno}}{a numeric vector for the rivalry number}
    \item{\code{rivalryname}}{a character vector for the rivalry name}
    \item{\code{sidea}}{a character vector for the first country in the rivalry}
    \item{\code{sideb}}{a character vector for the second country in the rivalry}
    \item{\code{styear}}{a numeric vector for the start year of the rivalry}
    \item{\code{endyear}}{a numeric vector for the end year of the rivalry}
    \item{\code{region}}{a character vector for the region of the rivalry, per Thompson and Dreyer (2012)}
    \item{\code{type1}}{a character vector for the primary type of the rivalry (spatial, positional, ideological, or interventionary)}
    \item{\code{type2}}{a character vector for the secondary type of the rivalry, if applicable (spatial, positional, ideological, or interventionary)}
    \item{\code{type3}}{a character vector for the tertiary type of the rivalry, if applicable (spatial, positional, ideological, or interventionary)}
  }
}
\details{
Information gathered from the appendix of Thompson and Dreyer (2012). Ongoing rivalries are right-bound at 2010, the date of publication for Thompson and Dreyer's handbook. Users are free to change this if they like.
}

\references{
Thompson, William R. and David Dreyer. 2012. Handbook of International Rivalries. CQ Press.
}
\examples{
data(strategic_rivalries)
}
\keyword{datasets}
