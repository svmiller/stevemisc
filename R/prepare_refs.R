#' Prepare \pkg{bib2df} Data Frame for Formatting to Various Outputs
#'
#' @description \code{prepare_refs} does some last-minute formatting of a data frame created by
#' \pkg{bib2df} so that it can be formatted nicely to various outputs.
#'
#' @details The function is designed to work more generally in the absence of various fields. Assume,
#' for example, that your data frame has no \code{BOOK} field. The function uses the \code{one_of()} wrapper
#' to work around this. The "warning" returned by the function is more of a message. This function may be expanded as
#' I think of more use cases.
#'
#' @param bib2df_refs a data frame created by \pkg{bib2df}
#' @param toformat what type of output you are ultimately going to want from \code{print_refs()} . Default is "plain".
#'
#' @return \code{print_refs()}  does some last-minute formatting to a data frame created by
#' \pkg{bib2df} so that rendering in R Markdown is a little easier and less code-heavy.
#'
#' @seealso \code{print_refs()} for formatting a \code{.bib} references to various outputs.
#'
#'
#' @examples
#'
#' prepare_refs(stevepubs)


# #' @rdname prepare_refs
# #' @export

prepare_refs <- function(bib2df_refs, toformat = "plain") {

  if (toformat == "plain") {
  bib2df_refs %>%
    mutate_at(vars(one_of("BOOKTITLE", "BOOK", "JOURNAL")), ~ifelse(!is.na(.), paste0('*', ., "*"), .)) %>%
  mutate_at(vars(one_of("MAINTITLE", "TITLE")), ~ifelse(!is.na(.) & CATEGORY == "BOOK", paste0('*', ., "*"), .)) -> result

  }

  return(result)
}
