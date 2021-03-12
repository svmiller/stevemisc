#' Create "peace years" or "spells" by cross-sectional unit
#'
#' @description \code{sbtscs()} allows you to create spells ("peace years" in
#' the international conflict context) between observations of some event. This
#' will allow the researcher to better model temporal dependence in binary time-series
#' cross-section ("BTSCS") models.
#'
#' @details I should confess outright, and it should be obvious to anyone
#' who looks at the code, that I liberally copy from Dave Armstrong's
#' \code{btscs()} function in the \pkg{DAMisc} package. I offer two such improvements.
#' One, the \code{btscs()} function chokes when a large number of cross-sectional units
#' have no recorded "event." I don't know why this happens but it does. Further, "tidying"
#' up the code by leaning on \pkg{dplyr} substantially speeds up computation. Incidentally,
#' this concerns the same cross-sectional units with no recorded events that can choke the
#' \code{btscs()} function in large numbers.
#'
#' @return \code{sbtscs()} takes a data frame and returns the data frame with a new variable
#' named \code{spell}.
#'
#' @author David A. Armstrong, Steven V. Miller
#'
#' @references Armstrong, Dave. 2016. ``\pkg{DAMisc}: Dave Armstrong's Miscellaneous Functions.''
#' \emph{R package version 1.4-3}.
#'
#' Miller, Steven V. 2017. ``Quickly Create Peace Years for BTSCS Models with \code{sbtscs} in \code{stevemisc}.''
#' \url{http://svmiller.com/blog/2017/06/quickly-create-peace-years-for-btscs-models-with-stevemisc/}
#'
#' @param data the data set with which you are working
#' @param event some event (0, 1) for which you want spells or peace years
#' @param tvar the time variable (e.g. a year)
#' @param csunit the cross-sectional unit (likely a dyad if you're doing boilerplate international conflict stuff)
#' @param pad_ts should time-series be filled when panels are unbalanced/have gaps? Defaults to FALSE.
#'
#' @examples
#' \dontrun{
#' library(dplyr)
#' library(stevemisc)
#' data(usa_mids)
#'
#' # notice: no quotes
#' sbtscs(usa_mids, midongoing, year, dyad)
#' }
#'

sbtscs <- function(data, event, tvar, csunit, pad_ts = FALSE) {
    tvar <- enquo(tvar)
    event <- enquo(event)
    csunit <- enquo(csunit)
    data <- arrange(data, !!csunit, !!tvar)
    sumevents <- data %>%
        group_by(!!csunit) %>%
        mutate(tot = sum(!!event))
    noevents <- sumevents %>%
        group_by(!!csunit) %>%
        filter(.data$tot == 0) %>%
        mutate(spell = seq_along(!!tvar) - 1)
    data <- sumevents %>%
        group_by(!!csunit) %>%
        filter(.data$tot > 0) %>%
        as.data.frame()
    tvar <- quo_name(tvar)
    event <- quo_name(event)
    csunit <- quo_name(csunit)
    # Taken from Dave Armstrong's DAMisc package.
    data$orig_order <- 1:nrow(data)
    data <- data[order(data[[csunit]], data[[tvar]]), ]
    spells <- function(x) {
        tmp <- rep(0, length(x))
        runcount <- 0
        for (j in 2:length(x)) {
            if (x[j] == 0 & x[(j - 1)] == 0) {
                tmp[j] <- runcount <- runcount + 1
            }
            if (x[j] != 0 & x[(j - 1)] == 0) {
                tmp[j] <- runcount + 1
                runcount <- 0
            }
            if (x[j] == 0 & x[(j - 1)] != 0) {
                tmp[j] <- runcount <- 0
            }
        }
        tmp
    }
    sp <- split(data, data[[csunit]])
    if (pad_ts) {
        sp <- lapply(sp, function(x) x[match(seq(min(x[[tvar]], na.rm = T), max(x[[tvar]], na.rm = T)),
            x[[tvar]]), ])
        for (i in 1:length(sp)) {
            if (any(is.na(sp[[i]][[event]]))) {
                sp[[i]][[event]][which(is.na(sp[[i]][[event]]))] <- 1
            }
            if (any(is.na(sp[[i]][[tvar]]))) {
                sp[[i]][[tvar]] <- seq(min(sp[[i]][[tvar]], na.rm = T), max(sp[[i]][[tvar]], na.rm = T))
            }
            if (any(is.na(sp[[i]][[csunit]]))) {
                sp[[i]][[csunit]][which(is.na(sp[[i]][[csunit]]))] <- mean(sp[[i]][[csunit]], na.rm = T)
            }
        }
    }
    sp <- lapply(1:length(sp), function(x) {
        cbind(sp[[x]], data.frame(spell = spells(sp[[x]][[event]])))
    })
    data <- do.call(rbind, sp)
    if (!pad_ts) {
        if (any(is.na(data$orig_order))) {
            data <- data[-which(is.na(data$orig_order)), ]
        }
        data <- data[data$orig_order, ]
    } else {
        data <- data[order(data[[csunit]], data[[tvar]]), ]
    }
    data$orig_order <- NULL
    data <- bind_rows(data, noevents)
    data$tot <- NULL
    data <- as_tibble(data[order(data[[csunit]], data[[tvar]]), ])
    return(data)
}
