#' Recode a Variable
#'
#' @description This recodes a numeric vector, character vector, or factor
#' according to fairly simple recode specifications that former Stata users
#' will appreciate. Yes, this is taken from John Fox's `recode()` unction in
#' his \pkg{car} package. I'm going with `carrec()` (i.e. shorthand for
#' `car::recode()`, phonetically here: "car-wreck") for this package, with
#' an additional shorthand of `carr` that does the same thing.
#'
#' The goal here is to minimize the number of function clashes with
#' multiple packages that I use in my workflow. For example: \pkg{car},
#' \pkg{dplyr}, and \pkg{Hmisc} all have `recode()` functions. I rely on
#' the \pkg{car} package just for this function, but it conflicts with some
#' other \pkg{tidyverse} functions that are vital to my workflow.
#'
#' @details Recode specifications appear in a character string, separated by
#' semicolons (see the examples below), of the form input=output. If an input
#' value satisfies more than one specification, then the first (from left to
#' right) applies. If no specification is satisfied, then the input value is
#' carried over to the result. NA is allowed on input and output.
#'
#' @return `carrec()` returns a vector, recoded to the specifications of the
#' user. `carr()` is a simple shortcut for`carrec()`.
#'
#' @author John Fox
#'
#'
#' @references Fox, J. and Weisberg, S. (2019). \emph{An R Companion to Applied Regression}, Third Edition, Sage.
#'
#'
#' @name carrec
#'
#' @param var numeric vector, character vector, or factor
#' @param recodes character string of recode specifications: see below, but
#' former Stata users will find this stuff familiar
#' @param as_fac return a factor; default is `TRUE` if `var` is a
#' factor,  `FALSE` otherwise
#' @param as_num if `TRUE` (which is the default) and `as.factor` is `FALSE`,
#' the result will be coerced to a numeric if all values in the result are numeric.
#' This should be what you want in 99% of applications for regression analysis.
#' @param levels an optional argument specifying the order of the levels in the
#' returned factor; the default is to use the sort order of the level names.
#' @param ... optional, only to make the shortcut (`carr()`) work
#'
#'
#' @examples
#' x <- seq(1,10)
#' carrec(x,"0=0;1:2=1;3:5=2;6:10=3")
#'
#' @export
#'

# I took these out: lo being -Inf and hi being Inf.
# They didn't seem to do anything

carrec <- function(var, recodes, as_fac, as_num = TRUE, levels) {
    recodes <- gsub("\n|\t", " ", recodes)
    rec_list <- rev(strsplit(recodes, ";")[[1]])
    is_fac <- is.factor(var)
    if (missing(as_fac))
      as_fac <- is_fac
    if (is_fac)
        var <- as.character(var)
    result <- var
    for (term in rec_list) {
        if (0 < length(grep(":", term))) {
            range <- strsplit(strsplit(term, "=")[[1]][1], ":")
            low <- try(eval(parse(text = range[[1]][1])), silent = TRUE)
            if (inherits(low, "try-error")) {
                stop("\n  in recode term: ", term, "\n  message: ", low)
            }
            high <- try(eval(parse(text = range[[1]][2])), silent = TRUE)
            if (inherits(high, "try-error")) {
                stop("\n  in recode term: ", term, "\n  message: ", high)
            }
            target <- try(eval(parse(text = strsplit(term, "=")[[1]][2])),
                          silent = TRUE)
            if (inherits(target, "try-error")) {
                stop("\n  in recode term: ", term, "\n  message: ", target)
            }
            result[(var >= low) & (var <= high)] <- target
        } else if (0 < length(grep("^else=", .squeeze_blanks(term)))) {
            target <- try(eval(parse(text = strsplit(term, "=")[[1]][2])),
                          silent = TRUE)
            if (inherits(target, "try-error")) {
                stop("\n  in recode term: ", term, "\n  message: ", target)
            }
            result[1:length(var)] <- target
        } else {
            set <- try(eval(parse(text = strsplit(term, "=")[[1]][1])),
                       silent = TRUE)
            if (inherits(set, "try-error")) {
                stop("\n  in recode term: ", term, "\n  message: ", set)
            }
            target <- try(eval(parse(text = strsplit(term, "=")[[1]][2])),
                          silent = TRUE)
            if (inherits(target, "try-error")) {
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
        #opt <- options(warn = -1)
        valid_result <- as.numeric(valid_result)
        #options(opt)
        if (!any(is.na(valid_result)))
            result <- as.numeric(result)
    }
    result
}

#' Squeeze blanks
#'
#' @description This is a helper function for \code{carrec()}
#'
#' @keywords internal
#' @export
#' @noRd

.squeeze_blanks <- function(text) {
  gsub(" *", "", text)
}



#' @rdname carrec
#' @export

carr <- function(...) stevemisc::carrec(...)


