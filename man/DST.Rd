\name{DST}
\alias{DST}
\docType{data}
\title{
Casualties/Fatalities in the U.S. for Drunk-Driving, Suicide, and Terrorism, 1970-2018.
}
\description{
These are fatalities (and, in the case of terrorism, casualties as well) for drunk-driving, suicide, and acts of terrorism in the U.S. spanning 1970 to 2018. Only one of these is sufficiently important to command public attention despite being the least severe public bad. Wanna guess which one?
}
\usage{data("DST")}
\format{
  A data frame with 49 observations on the following 5 variables.
  \describe{
    \item{\code{year}}{a numeric vector for the year}
    \item{\code{nkill}}{a numeric vector for the number killed in acts of terrorism}
    \item{\code{terrtotal}}{a numeric vector for the number killed or wounded in acts of terrorism}
    \item{\code{suicides}}{a numeric vector for the number of suicides}
    \item{\code{ddfat}}{a numeric vector for the number of drunk-driving fatalities}
  }
}
\details{
Following my own work in \emph{Political Research Quarterly}, terror incidents with unknown fatalities or number wounded were imputed to be 1. In those cases, the GTD has reason to believe at least one person died or was wounded, but doesn't know how many. GTD is weird about 1993, so perhaps treat those observations with some care (though it does well to capture the WTC bombing that year). Suicides include only those who passed, not those who survived a suicide attempt. Drunk-driving fatalities seem to include those who were killed in a drunk-driving accident despite not being drunk themselves.
}
\source{
Global Terrorism Database (Sept. 2019 update), Centers for Disease Control, U.S. Department of Transportation
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(DST)

}
\keyword{datasets}
