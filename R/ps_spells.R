#' Create "spells" by cross-sectional unit, even more generally
#'
#' @description \code{ps_spells()} allows you to create spells ("peace years" in
#' the international conflict context) between observations of some event. This
#' will allow the researcher to better model temporal dependence in binary time-series
#' cross-section ("BTSCS") models. The function is one of three in this package, and the contents
#' of this function are partly ported from the \code{add_duration()} function in the \pkg{spduration}
#' package. That function, unlike the other two I offer here, works much better where panels are decidedly
#' imbalanced.
#'
#' @details This function is derived from \code{add_duration()}  in the \pkg{spduration}
#' package. See documentation there for more information. I thank Andreas Beger for the blessing to port parts of
#' it here.
#'
#' @return \code{ps_spells()} takes a data frame and returns the data frame with a new variable
#' named \code{spell}.
#'
#' @author Andreas Beger, Steven V. Miller
#'
#' @references
#'
#' Beger, Andreas, Daina Chiba, Daniel W. Hill, Jr, Nils W. Metternich, Shahryar Minhas and Michael D. Ward. 2018.
#' ``\pkg{spduration}: Split-Population and Duration (Cure) Regression.'' \emph{R package version 0.17.1}.
#'
#' @param data the data set with which you are working
#' @param event some event (0, 1) for which you want spells
#' @param tvar the time variable (e.g. a year)
#' @param csunit the cross-sectional unit (e.g. a dyad or leader)
#' @param time_type what type of time-unit are the data? Right now, this will only work with years but support for months and days are forthcoming. Don't do anything with this argument just yet.
#' @param ongoing  If \code{TRUE}, successive 1s are considered ongoing events
#' and treated as \code{NA} after the first 1. If \code{FALSE}, successive 1s
#' are all treated as failures. Defaults to \code{FALSE}.
#'
#' @examples
#' \donttest{
#' One <- ps_btscs(usa_mids, midongoing, year, dyad)
#' Two <- ps_spells(usa_mids, midongoing, year, dyad)
#' identical(One, Two)
#' }
#'


ps_spells <- function (data, event, tvar, csunit, time_type = "year", ongoing = FALSE) {


  supported_time_types <- c("year")
  if (!time_type %in% supported_time_types) {
    stop("Right now, there is only support for calculating spells for yearly events (time_type = 'year'). This will change in the future.")
  }


  data_class <- class(data)

  data <- as.data.frame(data)

  tvar_enquo <- enquo(tvar)
  event_enquo <- enquo(event)
  csunit_enquo <- enquo(csunit)


  tvar <- quo_name(tvar_enquo)
  event <- quo_name(event_enquo)
  csunit <- quo_name(csunit_enquo)

  # check for missing keys
  if (any(is.na(data[, c(event)]))) {
    stop("There are NAs in the event variable and this function will not work in the presence of those NAs. In all likelihood, you're wanting peace spells for conflict data and you have observation years around the available temporal domain of that conflict data. Please subset the data you have to just those years with available observations in the event before continuing.")
  }

  if (any(is.na(data[, c(csunit)]))) {
    stop("The cross-sectional unit identifier has NAs and this function will not work in the presence of those NAs. Please inspect your data before continuing.")
  }

  if (any(is.na(data[, c(tvar)]))) {
    stop("The time variable has NAs and this function will not work in the presence of those NAs. Please inspect your data before continuing.")
  }

  # check that y is binary and has failures
  if (!all(unique(data[, event]) %in% c(0, 1))) {
    stop(paste(event, "must be binary (0, 1)"))
  } else if (all(data[,  event]==0)) {
    stop(paste0("No failures occur in data (", substitute(data), "[, \"", event,
                "\"])"))
  }


  data$orig_order <- 1:nrow(data)
  data$temp_date <- as.Date(paste0(data[[tvar]], "-06-30"))
  keep <- c(event, csunit, tvar, "orig_order", "temp_date")
  res <- data[order(data[, csunit], data[, tvar]), keep]

  if (ongoing==TRUE) {
    failure <- function(x) return(c(x[1], pmax(0, diff(x))))
    res$failure <- unlist(by(res[, event], res[, csunit], failure))
    res$ongoing <- ifelse(res[, event]==1 & res$failure==0, 1, 0)
    res$failure <- ifelse(res$ongoing==1, NA, res$failure)
  } else {
    res$failure <- res[, event]
    res$ongoing <- 0
  }

  res$temp.t <- res[, tvar]

  res <- res %>% group_by(!!csunit_enquo) %>%
    mutate(end = max(.data$temp.t)) %>% ungroup()

  # Mark end of a spell
  # A spell can end because 1) failure, 2) right-censor for last observation-period, or 3) the csunit exits.

  res %>%
    mutate(end.spell = case_when(
      end == .data$temp.t ~ 1,
      .data$failure == 1 ~ 1,
      TRUE ~ 0
    )) -> res

  spellIDhelper <- ifelse(is.na(res$end.spell), 0, res$end.spell)

  # Create spellID
  res$spellID <- rev(cumsum(rev(spellIDhelper)))
  res$spellID <- ifelse(res$ongoing==1, NA, res$spellID)

  # Was there a failure at the end of a spell?
  failedspells <- res$spellID[res$failure==1 & res$ongoing==0]
  helper <- cbind(failedspells, 0)
  colnames(helper) <- c("spellID", "cured")

  # Create duration variable, need to order by spell ID and date!!!!
  helper <- 1 - res$ongoing
  res <- res[order(res$spellID, res[, tvar]), ]
  res <- as.data.frame(res)
  res$duration[!is.na(res$spellID)] <- unlist(
    by(helper[!is.na(res$spellID)], res$spellID[!is.na(res$spellID)], cumsum) )
  res$spell <- res$duration - 1 ## previous duration


  # We're done, so let's put everything back where it was

  res <- subset(res, select=c("orig_order", "spell"))

  left_join(data, res) -> data

  data$temp_date <- NULL
  data$orig_order <- NULL

  class(data) <- data_class

  return(data)
}
