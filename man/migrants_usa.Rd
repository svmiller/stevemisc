\name{migrants_usa}
\alias{migrants_usa}
\docType{data}
\title{
U.S. Inbound/Outbound Migration Data, 1990-2017
}
\description{
This data set contains counts/estimates for the number of inbound migrants in the U.S as well as outbound migrants of American origin to other countries from 1990 to 2017.
}
\usage{data("migrants_usa")}
\format{
  A data frame with 3535 observations on the following 6 variables.
  \describe{
    \item{\code{year}}{a numeric vector for 1990, 1995, 2000, 2005, 2010, 2015, 2017}
    \item{\code{country}}{a character vector/constant for the United States}
    \item{\code{category}}{a character vector for whether the \code{count} is inbound to the U.S. from the \code{area} variable or outbound (i.e. American expats) to the  \code{area}  variable in a given year.}
    \item{\code{area}}{a character vector for the area of origin (if \code{category} == "Inbound") or destination for American migrants (if \code{category} == "Outbound")}
    \item{\code{count}}{a numeric vector for the count of inbound/outbound migrants}
    \item{\code{ccode}}{a numeric vector for the Correlates of War country code. This variable serves as a filter, of sorts, for if you want country-level information (e.g. inbound migration from Mexico to the U.S.) but want to contextualize it with more aggregate information (e.g. percentage of Western European migration to the U.S. that comes from the United Kingdom, or inbound migration from Mexico to the U.S. as percentage of total inbound migration).}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
United Nations Population Division (DESA)
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
library(stevemisc)
library(tidyverse)
data(migrants_usa)


migrants_usa \%>\%
  filter(category == "Inbound" & year == 2017) \%>\%
  mutate(propn = count/max(count, na.rm=T),
         labl = paste0(round(propn*100, 2),"\%")) \%>\%
  filter(!is.na(ccode)) \%>\%
  arrange(-count) \%>\%
  head(10) \%>\%
  ggplot(.,aes(reorder(area, -propn), propn)) + theme_steve_web() +
  geom_bar(stat="identity", alpha=0.8, color="black", fill="#619cff") +
  geom_text(aes(label=labl), vjust=-.5, colour="black",
            position=position_dodge(.9), size=4) +
  xlab("Country") + ylab("U.S. Migrant Population as Share of all Migrants of all Origins") +
  scale_y_continuous(labels=scales::percent) +
  labs(title = "Mexico Accounts for More Than a Quarter of U.S. Inbound Migration in 2017",
       subtitle = "Migration into the U.S. is still largely regional, though Asian countries are well-represented in this list.",
       caption = "Data: United Nations Population Division (DESA)")


migrants_usa \%>\%
  filter(category == "Outbound" & year == 2017) \%>\%
  mutate(propn = count/max(count, na.rm=T),
         labl = paste0(round(propn*100, 2),"\%")) \%>\%
  filter(!is.na(ccode)) \%>\%
  arrange(-count) \%>\%
  head(10) \%>\%
  ggplot(.,aes(reorder(area, -propn), propn)) + theme_steve_web() +
  geom_bar(stat="identity", alpha=0.8, color="black", fill="#619cff") +
  geom_text(aes(label=labl), vjust=-.5, colour="black",
            position=position_dodge(.9), size=4) +
  xlab("Country") + ylab("U.S. Migrant Population as Share of all Migrants of all Expat Americans") +
  scale_y_continuous(labels=scales::percent) +
  labs(title = "Likewise: Almost 30\% of All American Expats are Residing in Mexico",
       subtitle = "Generally, U.S. outbound migration follows to places where FDI is abundant, which may explain why Europe is well-represented on this list.",
       caption = "Data: United Nations Population Division (DESA)")

}
\keyword{datasets}
