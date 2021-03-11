#' Get a small data frame of the variable label and values.
#'
#' @description \code{get_var_info()} allows you to peek at your labelled data,
#' extracting a given column's variable labels. The intended use here is mostly
#' "peeking" for the purpose of recoding column's in the absence of a codebook or
#' other form of documentation. \code{gvi()} is a shortcut for this function.
#'
#' @details This function leans on \code{var_label()} and \code{val_label()} in the
#' \code{labelled} package, which is a dependency for this package. The function
#' is designed to be used in a "pipe."
#'
#' @param .data a data frame
#' @param x a column within the data frame
#' @param ... optional, only to make the shortcut (\code{gvi}) work
#'
#' @return If the column in the data frame is not labelled, the function returns a message communicating
#' the absence of labels. If the column in the data frame is labelled, the function returns
#' a small data frame communicating the \code{var_label()} output (\code{var}), the (often but not always)
#' numeric "code" coinciding with with the label (\code{code}), and the "label" attached to it (\code{label}).
#'
#' @name get_var_info
#'
#' @examples
#'
#' library(tibble)
#' library(dplyr)
#' library(magrittr)
#'
#' ess9_labelled %>% get_var_info(netusoft) # works, as intended
#' ess9_labelled %>% get_var_info(cntry) # works, as intended
#' ess9_labelled %>% get_var_info(ess9round) # barks at you; data are not labelled
#'


get_var_info <- function(.data, x) {
    if (labelled::is.labelled(.data[[deparse(substitute(x))]]) == FALSE) {
        message("get_var_info() requires a labelled column. Otherwise, you get this message.")
    } else {
        data.frame(code=labelled::val_labels(.data[[deparse(substitute(x))]])) -> dat
        rownames_to_column(dat, var="label") -> dat
        dat$var <- labelled::var_label(.data[[deparse(substitute(x))]])
        dplyr::select(dat, .data$var, .data$code, .data$label) -> dat
        return(dat)
    }

}

#' @rdname get_var_info
#' @export

gvi <- function(...) stevemisc::get_var_info(...)


# get_var_info <- function(x) {
#     require(labelled)
#     require(tibble)
#     b <- labelled::var_label(x)
#     c <- data.frame(r = unique(data.frame(labelled::val_labels(x))))
#     c <- tibble::rownames_to_column(c, "label")
#     names(c) <- c("label", "numeric")
#     tribs <- tibble::tribble(~label, ~numeric, b, NA, NA, NA)
#     tribs[is.na(tribs)] <- ""
#     tribs$numeric <- as.numeric(tribs$numeric)
#     info <- as.data.frame(rbind(tribs, c))
#     info[is.na(info)] <- ""
#     print(info, row.names = F)
# }
#

