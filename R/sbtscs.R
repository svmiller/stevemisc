#' Create 'Peace Years' by cross-sectional unit
#'
#' @param data Data set with which you are working.
#' @param event Some event (binary) for which you want peace years.
#' @param tvar The time variable (likely the year).
#' @param csunit The cross-sectional unit (likely a dyad, if you're doing IR stuff).
#'

sbtscs <- function(data, event, tvar, csunit, pad_ts = FALSE) {
    require(dplyr)
    tvar <- dplyr::enquo(tvar)
    event <- dplyr::enquo(event)
    csunit <- dplyr::enquo(csunit)
    data <- dplyr::arrange(data, !!csunit, !!tvar)
    sumevents <- data %>%
        group_by(!!csunit) %>%
        mutate(tot = sum(!!event))
    noevents <- sumevents %>%
        group_by(!!csunit) %>%
        filter(tot == 0) %>%
        mutate(spell = seq_along(!!tvar) - 1)
    data <- sumevents %>%
        group_by(!!csunit) %>%
        filter(tot > 0) %>%
        as.data.frame()
    tvar <- dplyr::quo_name(tvar)
    event <- dplyr::quo_name(event)
    csunit <- dplyr::quo_name(csunit)
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
