\name{fakeAPI}
\alias{fakeAPI}
\docType{data}
\title{
Hypothetical (Fake) Data on Academic Performance
}
\description{
This is a hypothetical universe of schools in a given territorial unit, patterned off the \code{apipop} data available in the \code{survey} package.
}
\usage{data("fakeAPI")}
\format{
  A data frame with 10000 observations on the following 8 variables.
  \describe{
    \item{\code{uid}}{a numeric vector as a unique identifier for schools}
    \item{\code{schooltype}}{a character vector for school type. E = elementary school. M = middle school. H = high school}
    \item{\code{county}}{a character vector for the county, named after an Ohio State All-American. ``County'' incidence is weighted by how many All-American honors the Ohio State player had. It's my fake data. You make your own if you have a problem with it.}
    \item{\code{community}}{a character vector for the school's community, either rural, suburban, or urban.}
    \item{\code{api}}{a numeric vector vector an academic performance index for the school}
    \item{\code{meals}}{a numeric vector for the percentage of school students eligible for subsidized meals}
    \item{\code{colgrad}}{a numeric vector for the percentage of school parents with college degrees}
    \item{\code{fullqual}}{a numeric vector for the percentage of the school with teachers that are fully qualified}
    \item{\code{sbase}}{a numeric vector for some base differences between schools, patterned off the school type means for \code{api00} in the \code{apipop} data.}
    \item{\code{cbase}}{a numeric vector for some base differences between counties, randomly drawn from a uniform distribution}
    \item{\code{e}}{a numeric vector for random errors}
  }
}
\details{

}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{

Data generated as follows:

## library(survey)
## library(stevemisc)
## library(tidyverse)
## data(api, package="survey")
##
##
## library(rvest)
##
##
## # https://www.sports-reference.com/cfb/schools/ohio-state/all-america.html
##
## jenny()
## read_html("https://www.sports-reference.com/cfb/schools/ohio-state/all-america.html") %>%
##  html_table() %>% .[[1]] %>%
##  filter(Player != "Player") %>% tbl_df() %>%
##  select(Player, Count) %>%
##  mutate(Count = as.numeric(Count),
##         perc = Count/sum(Count),
##         cbase = runif(n(), -80, 80)) -> AAs
##
##
##
## cormatrix <- cor(apipop %>%
##                    select(meals, col.grad, full) %>% na.omit)
##
## nobs <- 2e4
##
## jenny()
## corvectors(cbind(runif(nobs, 0, 100),
##                 rbnorm(nobs, 20.73, 14.14, 0, 100),
##                 rbnorm(nobs, 87.52, 12.93, 0, 100)), cormatrix) %>% as.data.frame() %>% tbl_df() %>%
##  rename(meals = V1, colgrad = V2, fullqual = V3) %>%
##  mutate(schooltype = sample(c("E","M","H"), nobs, replace=TRUE, prob=c(.75, .15, .10)),
##         community = sample(c("Urban", "Suburban", "Rural"), 1e4, replace=TRUE, prob=c(.31, .55, .14)),
##         county = sample(AAs$Player, nobs, replace=TRUE, prob=AAs$perc),
##         e = rnorm(nobs, 0, 2),
##         uid = seq(1:n())) %>%
##  left_join(., AAs %>% rename(county = Player) %>% select(county, cbase)) %>%
##  mutate(sbase = case_when(schooltype == "E" ~ 8,
##                          schooltype == "M" ~ -8,
##                          schooltype == "H" ~ -30)) %>%
##  mutate(api = 600 + sbase + cbase +- 2.7*meals + 1.21*colgrad + 2*fullqual + e) %>%
##  select(uid, schooltype, county, community, api, meals, colgrad, fullqual, sbase, cbase, e) -> fakeAPI
}
\keyword{datasets}
