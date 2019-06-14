\name{uniondensity}
\alias{uniondensity}
\docType{data}
\title{
Cross-National Rates of Trade Union Density
}
\description{
Cross-national data on relative size of the trade unions and predictors in 20 countries. This is a data set of interest to replicating Western and Jackman (1994), who themselves were addressing a debate between Wallerstein and Stephens on which of two highly collinear predictors (\code{size}, \code{concen}) explains trade union density (\code{union}). Data (and R documentation) are derived from Simon Jackman's pscl package, just tidied up a bit.
}
\usage{data("uniondensity")}
\format{
  A data frame with 20 observations on the following 5 variables.
  \describe{
    \item{\code{country}}{a character vector for the country}
    \item{\code{union}}{a numeric vector for the percentage of the total number of wage and salary earners plus the unemployed who are union members, measured between 1975 and 1980, with most of the data drawn from 1979.}
    \item{\code{left}}{a numeric vector tapping the extent to which parties of the left have controlled governments since 1919, due to Wilensky (1981).}
    \item{\code{size}}{a numeric vector measuring the log of labor force size, defined as the number of wage and salary earners, plus the unemployed.}
    \item{\code{concen}}{a numeric vector measuring the percentage of employment, shipments, or production accounted for by the four largest enterprises in a particular industry, averaged over industries (with weights proportional to the size of the industry) and the resulting measure is normalized such that the United States scores a 1.0, and is due to Pryor (1973). Some of the scores on this variable are imputed using procedures described in Stephens and Wallerstein (1991, 945). }
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
Pryor, Frederic. 1973. Property and Industrial Organization in Communist and Capitalist Countries. Bloomington: Indiana University Press.

Stephens, John and Michael Wallerstein. 1991. Industrial Concentration, Country Size and Trade Union Membership. American Political Science Review 85:941-953.

Western, Bruce and Simon Jackman. 1994. Bayesian Inference for Comparative Research. American Political Science Review 88:412-423.

Wilensky, Harold L. 1981. Leftism, Catholicism, Democratic Corporatism: The Role of Political Parties in Recemt Welfare State Development. In The Development of Welfare States in Europe and America, ed. Peter Flora and Arnold J. Heidenheimer. New Brunswick: Transaction Books.
}
\references{
Jackman, Simon. 2009. Bayesian Analysis for the Social Sciences. Wiley: Hoboken, New Jersey.
}
\examples{
data(uniondensity)
## maybe str(uniondensity) ; plot(uniondensity) ...
}
\keyword{datasets}
