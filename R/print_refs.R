#' Print and Format \code{.bib} Entries as References
#'
#' @description \code{print_refs()} is a convenience function I found and
#' edited that will allow a user to print and format \code{.bib}
#' entries---or a \pkg{bib2df} data frame of \code{.bib} entries, as if they
#' were references. This function is useful if you want to load a \code{.bib}
#' entry or set of entries and print them in the middle of a document in
#' R Markdown.
#'
#' @details \code{print_refs()} assumes an active internet connection in the absence of the appropriate CSL file in the
#' working directory. The citation style language (CSL) file supplied by the user must match a file in the
#' massive Github repository of CSL files. Users interested in potential outputs should read more about Pandoc (\url{https://pandoc.org/MANUAL.html}).
#' The Github repository of CSL files is available here: \url{https://github.com/citation-style-language/styles}.
#'
#' @param bib a valid \code{.bib} entry
#' @param csl a CSL file, matching one available on the Github repository, that the user wants to format the references. Default is "american-political-science-association.csl".
#' @param toformat the output wanted by the user. Default is "markdown_strict".
#' @param cslrepo a directory of CSL files. Defaults to the one on Github.
#' @param spit_out logical, defaults to TRUE. If TRUE, wraps ("spits out") formatted citations in a \code{writeLines()} output for the console. If `FALSE`, returns a character vector.
#' @param delete_after logical, defaults to TRUE. If TRUE, deletes CSL file when it's done. If FALSE, retains CSL for (potential) future use.
#'
#' @return  \code{print_refs()} takes a \code{.bib} entry, or an implied
#' \pkg{bib2df} data frame, and returns the requested formatted reference
#' or references from it.
#'
#' @examples
#'
#' \donttest{
#' example <- "@Book{vasquez2009twp, Title = {The War Puzzle Revisited},
#' Author = {Vasquez, John A}, Publisher = {New York, NY: Cambridge University Press},
#' Year = {2009}}"
#'
#' print_refs(example)
#' }

print_refs <- function(bib, csl="american-political-science-association.csl",
                      toformat="markdown_strict",
                      cslrepo="https://raw.githubusercontent.com/citation-style-language/styles/master",
                      spit_out = TRUE,
                      delete_after = TRUE) {

  if (any(class(bib) %in% c("data.frame")) == TRUE) {

    bib <- capture.output(df2bib(bib))

  }


  if (!file.exists(bib)) {
    message("I'm going to assume this is a .bib entry...")
    tmpbib <- tempfile(fileext = ".bib")
    on.exit(unlink(tmpbib), add=TRUE)
    if(!validUTF8(bib)) {
      bib <- iconv(bib, to="UTF-8")
    }
    writeLines(bib, tmpbib)
    bib <- tmpbib
  }
  if (tools::file_ext(csl)!="csl") {
    warning("End the CSL file in '.csl', you knob.")
  }
  if (!file.exists(csl)) {
    cslurl <- file.path(cslrepo, csl)
    message(paste("Downloading CSL from", cslurl))
    cslresp <- GET(cslurl, write_disk(csl))
    if(http_error(cslresp)) {
      stop(paste("Could not download CSL.", "Code:", status_code(cslresp)))
    }
  }
  tmpcit <- tempfile(fileext = ".md")
  on.exit(unlink(tmpcit), add=TRUE)

  writeLines(c("---","nocite: '@*'","---"), tmpcit)
  find_pandoc()
  command <- paste(shQuote(file.path(find_pandoc()$dir, "pandoc")),
                   "--citeproc",
                   "--to", shQuote(toformat),
                   "--csl", shQuote(csl),
                   "--bibliography", shQuote(bib),
                   shQuote(tmpcit))
  .with_pandoc_safe_environment({
    result <- system(command, intern = TRUE)
    Encoding(result) <- "UTF-8"
  })

  if (file.exists(csl) && delete_after == TRUE) {
    #Delete file if it exists
    file.remove(csl)
  }

  if (toformat == "latex") {
  result <- str_subset(result, "\\leavevmode|\\\\begin|\\\\end|\\\\hyper", negate=TRUE)
  result <- str_replace(result, "\\{``", '"')
  result <- str_replace(result, "''\\}", '"')

  }

  if (spit_out == TRUE) {
  writeLines(result, sep="\n")
  } else {
    return(result)
  }
}


#' @keywords internal
#' @export

# Helper functions follow, all stolen from: https://github.com/cran/rmarkdown/blob/d53194ce5eb633397c40d1c7d3462fc4a0eb61ff/R/pandoc.R
.with_pandoc_safe_environment <- function(code) {

  lc_all <- Sys.getenv("LC_ALL", unset = NA)

  if (!is.na(lc_all)) {
    Sys.unsetenv("LC_ALL")
    on.exit(Sys.setenv(LC_ALL = lc_all), add = TRUE)
  }

  lc_ctype <- Sys.getenv("LC_CTYPE", unset = NA)

  if (!is.na(lc_ctype)) {
    Sys.unsetenv("LC_CTYPE")
    on.exit(Sys.setenv(LC_CTYPE = lc_ctype), add = TRUE)
  }

  if (Sys.info()['sysname'] == "Linux" &&
      is.na(Sys.getenv("HOME", unset = NA))) {
    stop("The 'HOME' environment variable must be set before running Pandoc.")
  }

  if (Sys.info()['sysname'] == "Linux" &&
      is.na(Sys.getenv("LANG", unset = NA))) {
    # fill in a the LANG environment variable if it doesn't exist
    Sys.setenv(LANG = .detect_generic_lang())
    on.exit(Sys.unsetenv("LANG"), add = TRUE)
  }

  if (Sys.info()['sysname'] == "Linux" &&
      identical(Sys.getenv("LANG"), "en_US")) {
    Sys.setenv(LANG = "en_US.UTF-8")
    on.exit(Sys.setenv(LANG = "en_US"), add = TRUE)
  }

  force(code)
}


#' @keywords internal
#' @export

.detect_generic_lang <- function() {

  locale_util <- Sys.which("locale")

  if (nzchar(locale_util)) {
    locales <- system(paste(locale_util, "-a"), intern = TRUE)
    locales <- suppressWarnings(
      strsplit(locales, split = "\n", fixed = TRUE)
    )
    if ("C.UTF-8" %in% locales)
      return("C.UTF-8")
  }

  # default to en_US.UTF-8
  "en_US.UTF-8"
}
