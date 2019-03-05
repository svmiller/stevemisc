\name{mvprod}
\alias{mvprod}
\docType{data}
\title{
List of Countries by Motor Vehicle Production, 1950-2017
}
\description{
Data, largely from Organisation Internationale des Constructeurs d'Automobiles (OICA), on motor vehicle production in various countries (and the world totals) from 1950 to 2017 at various intervals. Tallies include production of passenger cars, light commercial vehicles, minibuses, trucks, buses and coaches.
}
\usage{data("mvprod")}
\format{
  A data frame with 1072 observations on the following 3 variables.
  \describe{
    \item{\code{country}}{a character vector for the country. Note: this also includes world totals as well. Subset out "World" if you'd like.}
    \item{\code{year}}{a numeric vector for year. Values include: 1950, 1960, 1970, 1980, 1990, 1995, 2000, 2005, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017}
    \item{\code{mvprod}}{a numeric vector for total motor vehicles produced in a given year.}
  }
}
\details{
This is a Wikipedia web-scraping job. See: https://en.wikipedia.org/wiki/List_of_countries_by_motor_vehicle_production
}
\source{
Organisation Internationale des Constructeurs d'Automobiles (OICA)
}
\references{
}
\examples{
library(tidyverse)
library(stevemisc)
data(mvprod)

mvprod %>%
  filter(country %in% c("South Korea", "Brazil")) %>%
  rename(Country = country) %>%
  mutate(value = mvprod/1000,
         lbl = prettyNum(round(value), ",")) %>%
  ggplot(.,aes(as.factor(year), value, fill=Country)) +
  theme_steve_web() +
  geom_bar(stat="identity", position = "dodge", color="black") +
  scale_y_continuous(labels = scales::comma) +
  xlab("Year") + ylab("Motor Vehicle Production (in Thousands)") +
  geom_text(aes(label=lbl, group=Country), color="black",
            position=position_dodge(width=.9), size=3, vjust = -.5, family="Open Sans") +
  labs(title = "It Didn't Take That Long For South Korea's Motor Vehicle Production to Outpace Brazil",
       subtitle = "South Korea's model found an audience abroad, producing products for foreign consumption in contrast to Brazil's domestic focus.",
       caption = "Data: Organisation Internationale des Constructeurs d'Automobiles, among other sources.\nNote: production includes figures for passenger cars, light commercial vehicles, minibuses, trucks, buses and coaches.\nProduction is later defined in the 21st century as where vehicle was assembled.") +
  scale_fill_manual(values=c("#009B3A", "#C60C30"))


}
\keyword{datasets}
