\name{osu_results}
\alias{osu_results}
\docType{data}
\title{
Ohio State Football Results, 1913-2017
}
\description{
This is a data set, scraped from cfbstats.com, of Ohio State football results from 1913 to 2017.
}
\usage{data("osu_results")}
\format{
  A data frame with 1072 observations on the following 26 variables.
  \describe{
    \item{\code{season}}{The football season. Note: bowl games played the following "year" count toward the preceding season (e.g. 2010 Rose Bowl for the 2009 season).}
    \item{\code{g}}{The order in the schedule the game was played for a given season. A season-opening game will always be 1, though later schedules feature more games.}
    \item{\code{date}}{The exact date the game was played.}
    \item{\code{month}}{The month of the game.}
    \item{\code{year}}{The year the game was played, this will almost always overlap with season, though most Ohio State bowl games are played in the year after the season.}
    \item{\code{day}}{The day the game was played, as a numeric vector.}
    \item{\code{dayname}}{The day the game was played, as a character vector.}
    \item{\code{postseason}}{Was this a postseason game? 0 = no, 1 = yes.}
    \item{\code{school}}{school == "Ohio State"}
    \item{\code{osurank}}{Ohio State's AP rank entering the game.}
    \item{\code{vs}}{A character vector, where @ = a road game, N = a neutral site game, and missing values indicate a home game.}
    \item{\code{opponent}}{Name of the opponent.}
    \item{\code{opprank}}{AP rank of the opponent}
    \item{\code{conf}}{The conference of the opponent at the time the game was played}
    \item{\code{confrec}}{Recoded conferences, standardized (mostly) to current conferences (e.g. Pac-10 = Pac-12).}
    \item{\code{outcome}}{The outcome of the game. W = Ohio State won. T = Ohio State tied its opponent. L = Ohio State lost to its opponent, which always sucks.}
    \item{\code{pts}}{The points Ohio State scored.}
    \item{\code{opp}}{The points Ohio State's opponent scored.}
    \item{\code{w}}{A running count of Ohio State wins in a season after the game's result.}
    \item{\code{l}}{A running count of Ohio State losses in a season after the game's result.}
    \item{\code{t}}{A running count of Ohio State's ties in a season after the game's result. Note: games could no longer end in ties starting with the 1996 season.}
    \item{\code{streak}}{A character vector communicating W/L/T streaks for Ohio State after the game's result.}
    \item{\code{notes}}{A character vector communicating notes about a game, most of which concern post-season game names or location of a neutral-site game.}
    \item{\code{tv}}{A character vector communicating the broadcaster of the game, which is available in more recent years.}
    \item{\code{time}}{A character vector communicating kickoff time, which is available in more recent years.}
    \item{\code{ohioopp}}{Was the opponent an Ohio opponent? 0 = no. 1 = yes}
  }
}
\details{
Ohio State had to vacate all wins from the 2010 season, so you can keep that in mind.
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(osu_results)
}
\keyword{datasets}
