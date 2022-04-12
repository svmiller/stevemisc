#' Filter a Data Frame of Citations and Return the Entries as a Character
#'
#' @description \code{filter_refs()} is a convenience function I wrote for
#' filtering a data frame of citations returning the entries as a valid
#' `.bib` entry (as a character vector). I wrote this for more easily passing
#' on citations to the `print_refs()` function also included in this package.
#'
#' @details \code{filter_refs()} assumes some familiarity with `BibTeX`, `.bib`
#' entries, and depends on the \pkg{bib2df} package.
#'
#' @param bibdat a data frame of citations, like the one created by the
#' \pkg{bib2df} package
#' @param criteria criteria, specified as a character vector, by which to
#' filter the data frame of citations
#' @param type the particular type of citation entry on which to filter.
#' Defaults to "bibtexkey" (which filters based on a column of unique citation
#' keys). When `type == "year"`, the function filters on a character vector of
#' years.

#' @return  \code{filter_refs()} takes a data frame of citations, like the one
#' created by the \pkg{bib2df} package, and returns a character vector
#' (amounting to a valid `.bib` entry) of citations the user wants. This can
#' then be easily passed to the `print_refs()` function also included in this
#' package.
#'
#' @examples
#' # Based on `stevepubs` configuration, filter on `BIBTEXKEY` where
#' # the citation key matches one of these.
#' filter_refs(stevepubs, c("miller2017etst", "miller2017etjc", "miller2013tdpi"))
#'
#' # Based on `stevepubs` configuration, filter on `YEAR` where
#' # the publication year is 2017, 2018, 2019, 2020, or 2021.
#' filter_refs(stevepubs, c(2017:2021), type = "year")

filter_refs <- function(bibdat, criteria, type = "bibtexkey") {
  if(type == "bibtexkey") {
  cites_i_want <- subset(bibdat, bibdat$BIBTEXKEY %in% criteria)
  } else if (type == "year") {
  cites_i_want <- subset(bibdat, bibdat$YEAR %in% criteria)
  }


  not_all_na <- function(x) any(!is.na(x))

  cites_i_want %>%
    group_split(.data$BIBTEXKEY) -> group_split_cites

  lapply(group_split_cites, function(x) select_if(x, not_all_na)) -> group_split_cites


  suppressWarnings(
    for(i in 1:length(group_split_cites)) {
      group_split_cites[[i]]$AUTHOR <- paste(unlist(group_split_cites[[i]]$AUTHOR), collapse=" and ")
      group_split_cites[[i]]$EDITOR <- paste(unlist(group_split_cites[[i]]$EDITOR), collapse=" and ")
    }
  )


  lapply(group_split_cites, function(x) mutate(x,  EDITOR = ifelse(.data$EDITOR == "", NA, .data$EDITOR))) -> group_split_cites
  lapply(group_split_cites, function(x) select_if(x, not_all_na)) -> group_split_cites


  for(i in 1:length(group_split_cites)) {
    tibble(x = names(unlist(group_split_cites[[i]])),
           y = unlist(group_split_cites[[i]])) -> hold_this

    hold_this %>% filter((x %in% c("BIBTEXKEY", "CATEGORY"))) -> hold_this_a
    hold_this %>% filter(!(x %in% c("BIBTEXKEY", "CATEGORY"))) -> hold_this_b

    print_the_thing_already <- cat(paste0("@", hold_this_a$y[1],
                                          "{", hold_this_a$y[2],",\n",
                                          paste0("  ",
                                                 hold_this_b$x,
                                                 " = {",
                                                 hold_this_b$y,
                                                 "}",
                                                 collapse = ",\n"),"}"),
                                   collapse = "\n\n",
                                   #fill=TRUE,
                                   file = "",
                                   append = TRUE)
    invisible(file)
  }


  #return(print_the_thing_already)
}

