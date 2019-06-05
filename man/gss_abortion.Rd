\name{gss_abortion}
\alias{gss_abortion}
\docType{data}
\title{
The Justifiability of Abortion Under Various Circumstances (GSS, 1972-2018)
}
\description{
This is a toy data set derived from the General Social Survey that I intend to use as illustration for mixed effects modeling as equivalent to one-paramater (Rasch) model.
}
\usage{data("gss_abortion")}
\format{
  A data frame with 64814 observations on the following 9 variables.
  \describe{
    \item{\code{id}}{a numeric identifier for each unique respondent in a given year}
    \item{\code{year}}{a numeric vector for the year of the GSS survey}
    \item{\code{abany}}{a numeric vector that equals 1 if the respondent thinks abortion should be legal for any reason. 0 indicates no support for abortion in this circumstance.}
    \item{\code{abdefect}}{a numeric vector that equals 1 if the respondent thinks abortion should be legal if there is a serious defect in the fetus. 0 indicates no support for abortion in this circumstance.}
    \item{\code{abnomore}}{a numeric vector that equals 1 if the respondent thinks abortion should be legal if a woman is pregnant but wants no more children. 0 indicates no support for abortion in this circumstance.}
    \item{\code{abhlth}}{a numeric vector that equals 1 if the respondent thinks abortion should be legal if a pregnant woman's health is in danger. 0 indicates no support for abortion in this circumstance.}
    \item{\code{abpoor}}{a numeric vector that equals 1 if the respondent thinks abortion should be legal if a pregnant woman is poor and cannot afford more children. 0 indicates no support for abortion in this circumstance.}
    \item{\code{abrape}}{a numeric vector that equals 1 if the respondent thinks abortion should be legal if the woman became pregnant because of a rape. 0 indicates no support for abortion in this circumstance.}
    \item{\code{absingle}}{a numeric vector that equals 1 if the respondent thinks abortion should be legal if a pregnant woman is single and does not want to marry the man who impregnated her. 0 indicates no support for abortion in this circumstance.}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
General Social Survey, 1972-2018
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(gss_abortion)
## maybe str(gss_abortion) ; plot(gss_abortion) ...
}
\keyword{datasets}
