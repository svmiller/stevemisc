\name{steves_clothes}
\alias{steves_clothes}
\docType{data}
\title{
Steve's (Professional) Clothes, as of Jan. 6, 2019
}
\description{
I cobbled together this data set of the professional clothes (polos, long-sleeve dress shirts, pants) in my closet, largely for illustration on the origins of apparel in the U.S. for an intro lecture on trade.
}
\usage{data("steves_clothes")}
\format{
  A data frame with 70 observations on the following 4 variables.
  \describe{
    \item{\code{type}}{Type of clothing}
    \item{\code{brand}}{The brand of clothing (e.g. Apt. 9, Saddlebred)}
    \item{\code{color}}{The color of the article of clothing}
    \item{\code{origin}}{The country that produced the garment.}
  }
}
\details{
If you must know, I do most of my clothes shopping at major retailers in the U.S. (mostly Belk, J.C. Penney, and Kohl's). If that's you as well, the odds are good the distribution of my clothes will closely resemble yours.)
}
\source{
Steve's closet.
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(steves_clothes)
## maybe str(steves_clothes) ; plot(steves_clothes) ...
}
\keyword{datasets}
