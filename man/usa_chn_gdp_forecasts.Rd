\name{usa_chn_gdp_forecasts}
\alias{usa_chn_gdp_forecasts}
\docType{data}
\title{
United States-China GDP and GDP Forecasts, 1960-2050
}
\description{
This is a toy data set to examine the time in which we should expect China to overtake the United States in total gross domestic product (GDP). It includes an OECD long-term GDP forecast from 2014, and forecasts from the \code{forecast} package in R (\code{f_}) and from the \code{prophet} package in R (\code{p_}).
}
\usage{data("usa_chn_gdp_forecasts")}
\format{
  A data frame with 182 observations on the following 15 variables.
  \describe{
    \item{\code{Country}}{a character vector for the United States or China}
    \item{\code{year}}{a numeric vector for the year (1960-2050)}
    \item{\code{p_yhat}}{yhat from a prophet forecast}
    \item{\code{p_yhat_lwr}}{lower bound of yhat from a prophet forecast}
    \item{\code{p_yhat_upr}}{upper bound of yhat from a prophet forecast}
    \item{\code{p_trend}}{trend from a prophet forecast}
    \item{\code{p_trend_lwr}}{lower bound of the trend from a prophet forecast}
    \item{\code{p_trend_upr}}{upper bound of the trend from a prophet forecast}
    \item{\code{gdp}}{observed GDP, made available to the World Bank and OECD national accounts data. Available from 1960 to 2017.}
    \item{\code{f_gdp}}{forecasted GDP from 2018 to 2050, from the forecast package}
    \item{\code{f_lo80}}{lower bound (80\%) forecasted GDP from 2018 to 2050, from the forecast package}
    \item{\code{f_hi80}}{upper bound (80\%) forecasted GDP from 2018 to 2050, from the forecast package}
    \item{\code{f_lo95}}{lower bound (95\%) forecasted GDP from 2018 to 2050, from the forecast package}
    \item{\code{f_hi95}}{upper bound (95\%) forecasted GDP from 2018 to 2050, from the forecast package}
    \item{\code{oecd_ltgdpf}}{long-term GDP forecast from the OECD via the OECD Outlook No 95 - May 2014.}
  }
}
\details{
Forecasts from the forecast package and prophet package are rudimentary and bare minimum forecasts based on previous values to that point.
}
\source{
OECD Outlook No 95 - May 2014 - Long-term baseline projections provided by  Organisation for Economic Co-operation and Development (OECD)
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(usa_chn_gdp_forecasts)
}
\keyword{datasets}
