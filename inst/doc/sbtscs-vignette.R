## ------------------------------------------------------------------------
btscs <- function (data, event, tvar, csunit, pad.ts = FALSE){
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
    if (pad.ts) {
        sp <- lapply(sp, function(x) x[match(seq(min(x[[tvar]], 
            na.rm = T), max(x[[tvar]], na.rm = T)), x[[tvar]]), 
            ])
        for (i in 1:length(sp)) {
            if (any(is.na(sp[[i]][[event]]))) {
                sp[[i]][[event]][which(is.na(sp[[i]][[event]]))] <- 1
            }
            if (any(is.na(sp[[i]][[tvar]]))) {
                sp[[i]][[tvar]] <- seq(min(sp[[i]][[tvar]], na.rm = T), 
                  max(sp[[i]][[tvar]], na.rm = T))
            }
            if (any(is.na(sp[[i]][[csunit]]))) {
                sp[[i]][[csunit]][which(is.na(sp[[i]][[csunit]]))] <- mean(sp[[i]][[csunit]], 
                  na.rm = T)
            }
        }
    }
    sp <- lapply(1:length(sp), function(x) {
        cbind(sp[[x]], data.frame(spell = spells(sp[[x]][[event]])))
    })
    data <- do.call(rbind, sp)
    if (!pad.ts) {
        if (any(is.na(data$orig_order))) {
            data <- data[-which(is.na(data$orig_order)), ]
        }
        data <- data[data$orig_order, ]
    }
    else {
        data <- data[order(data[[csunit]], data[[tvar]]), ]
    }
    invisible(data)
}

library(RCurl)
library(tidyverse)

data <- getURL("https://raw.githubusercontent.com/svmiller/gml-mid-data/master/gml-ndy.csv")
NDY <- read.csv(text = data) %>% tbl_df()

NDY %>%
    mutate(midongoing = ifelse(is.na(midongoing),0, 1),
           midonset = ifelse(is.na(midonset), 0, 1),
           dyad = as.numeric(paste0("1",sprintf("%03d", ccode1), 
                                    sprintf("%03d", ccode2)))) %>%
    arrange(dyad,year) %>%
    select(ccode1, ccode2, dyad, year, midongoing, midonset, dispnum3) %>%
  as.data.frame() -> NDY

# this_wont_work <- btscs(NDY, "midongoing", "year", "dyad")
#  Error in if (x[j] == 0 & x[(j - 1)] == 0) { : 
# missing value where TRUE/FALSE needed 


## ------------------------------------------------------------------------
library(stevemisc)
NDYpy <- sbtscs(NDY, midongoing, year, dyad) %>% tbl_df()
head(NDYpy)

## ------------------------------------------------------------------------
NDY %>% filter(ccode1 <= 110) -> Guyana1

system.time(PY1 <- sbtscs(Guyana1, midongoing, year, dyad))
system.time(PY2 <- btscs(Guyana1, "midongoing", "year", "dyad"))
identical(PY1$spell, PY2$spell)

