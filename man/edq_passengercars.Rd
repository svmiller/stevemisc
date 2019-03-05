\name{edq_passengercars}
\alias{edq_passengercars}
\docType{data}
\title{
Export Quality Data for Passenger Cars, 1963-2014
}
\description{
Data from the International Monetary Fund for the export quality and unit/trade value of passenger cars for all available countries and years from 1963 to 2014.
}
\usage{data("edq_passengercars")}
\format{
  A data frame with 60424 observations on the following 6 variables.
  \describe{
    \item{\code{country}}{a character vector for the country/area.}
    \item{\code{ccode}}{a numeric vector for the Correlates of War country code.}
    \item{\code{category}}{a factor with levels \code{Export Quality Index}, \code{Export quality 95 percent interval - lower bound}, \code{Export quality 95 percent interval - upper bound} \code{Unit value of exports}, \code{Unit value 95 percent interval - lower bound}, \code{Unit value 95 percent interval - upper bound}, \code{Trade value of exports}}
    \item{\code{type}}{a factor with levels \code{51. Transport equipment, Passenger cars}. This is a constant. I just felt like making it a factor.}
    \item{\code{year}}{a numeric vector for the year}
    \item{\code{value}}{a numeric vector for the value of the particular category.}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(edq_passengercars)
library(tidyverse)

edq_passengercars \%>\%
  filter(ccode \%in\% c(140, 732)) \%>\%
  filter(category == "Export Quality Index") \%>\%
  rename(Country = country) \%>\%
  ggplot(.,aes(year, value, color=Country, group=Country,linetype=Country)) +
  theme_steve_web() +
  geom_line(size=1.1) +
  scale_x_continuous(breaks=seq(1964, 2014, by =2)) +
  scale_color_manual(values=c("#009B3A", "#C60C30")) +
  xlab("Year") + ylab("Export Quality Index") +
  labs(title = "South Korean Passenger Automobiles Surpassed Brazil's Autos in Export Quality Early into the 1970s",
       subtitle = "South Koreas's first foray into the distant foreign market may have been Guam (through Hyundai) but cracking the U.S. market soon set it apart from Brazil.",
       caption = "Data: International Monetary Fund")

}
\keyword{datasets}
