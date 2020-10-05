squeeze_blanks <- function(text) {
    gsub(" *", "", text)
}

# I took these out: lo being -Inf and hi being Inf.
# They didn't seem to do anything

carrec <- function(var, recodes, as_fac, as_num = TRUE, levels) {
    recodes <- gsub("\n|\t", " ", recodes)
    rec_list <- rev(strsplit(recodes, ";")[[1]])
    is_fac <- is.factor(var)
    if (missing(as_fac))
      as_fac <- is_fac
    if (is.fac)
        var <- as.character(var)
    result <- var
    for (term in rec_list) {
        if (0 < length(grep(":", term))) {
            range <- strsplit(strsplit(term, "=")[[1]][1], ":")
            low <- try(eval(parse(text = range[[1]][1])), silent = TRUE)
            if (class(low) == "try-error") {
                stop("\n  in recode term: ", term, "\n  message: ", low)
            }
            high <- try(eval(parse(text = range[[1]][2])), silent = TRUE)
            if (class(high) == "try-error") {
                stop("\n  in recode term: ", term, "\n  message: ", high)
            }
            target <- try(eval(parse(text = strsplit(term, "=")[[1]][2])),
                          silent = TRUE)
            if (class(target) == "try-error") {
                stop("\n  in recode term: ", term, "\n  message: ", target)
            }
            result[(var >= low) & (var <= high)] <- target
        } else if (0 < length(grep("^else=", squeeze_blanks(term)))) {
            target <- try(eval(parse(text = strsplit(term, "=")[[1]][2])),
                          silent = TRUE)
            if (class(target) == "try-error") {
                stop("\n  in recode term: ", term, "\n  message: ", target)
            }
            result[1:length(var)] <- target
        } else {
            set <- try(eval(parse(text = strsplit(term, "=")[[1]][1])),
                       silent = TRUE)
            if (class(set) == "try-error") {
                stop("\n  in recode term: ", term, "\n  message: ", set)
            }
            target <- try(eval(parse(text = strsplit(term, "=")[[1]][2])),
                          silent = TRUE)
            if (class(target) == "try-error") {
                stop("\n  in recode term: ", term, "\n  message: ", target)
            }
            for (val in set) {
                if (is.na(val))
                  result[is.na(var)] <- target else result[var == val] <- target
            }
        }
    }
    if (as_fac) {
        result <- if (!missing(levels))
            factor(result, levels = levels) else as.factor(result)
    } else if (as_num && (!is.numeric(result))) {
        valid_result <- na.omit(result)
        opt <- options(warn = -1)
        valid_result <- as.numeric(valid_result)
        options(opt)
        if (!any(is.na(valid_result)))
            result <- as.numeric(result)
    }
    result
}

carr <- function(...) stevemisc::carrec(...)
