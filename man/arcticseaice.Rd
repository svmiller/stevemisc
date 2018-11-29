\name{arcticseaice}
\alias{arcticseaice}
\docType{data}
\title{
Arctic Sea Ice Extent Data, 1901-2015
}
\description{
This data set from Connelly et al. (2017) measures the Arctic sea ice extent in 10^6 square kilometers. It includes lower bounds and upper bounds on annual averages.
}
\usage{data("arcticseaice")}
\format{
  A data frame with 115 observations on the following 4 variables.
  \describe{
    \item{\code{Year}}{Year}
    \item{\code{Annual}}{Annual Sea Ice Extent (10^6 sq km)}
    \item{\code{lb_annual}}{Annual Sea Ice Extent (10^6 sq km) (lower bound)}
    \item{\code{ub_annual}}{Annual Sea Ice Extent (10^6 sq km) (upper bound)}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
Connolly et al. (2017), ''Re-calibration of Arctic sea ice extent datasets using Arctic surface air temperature records''. *Hydrological Sciences Journal* 62(8): 1317--40.
}
\examples{
data(arcticseaice)
}
\keyword{datasets}
