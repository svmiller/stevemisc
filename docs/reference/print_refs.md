# Print and Format `.bib` Entries as References

`print_refs()` is a convenience function I found and edited that will
allow a user to print and format `.bib` entries as if they were
references. This function is useful if you want to load a `.bib` entry
or set of entries and print them in the middle of a document in R
Markdown.

## Usage

``` r
print_refs(
  bib,
  csl = "american-political-science-association.csl",
  toformat = "markdown_strict",
  cslrepo = "https://raw.githubusercontent.com/citation-style-language/styles/master",
  spit_out = TRUE,
  delete_after = TRUE,
  scrub_bibitem = FALSE
)
```

## Arguments

- bib:

  a valid `.bib` entry

- csl:

  a CSL file, matching one available on the Github repository, that the
  user wants to format the references. Default is
  "american-political-science-association.csl".

- toformat:

  the output wanted by the user. Default is "markdown_strict".

- cslrepo:

  a directory of CSL files. Defaults to the one on Github.

- spit_out:

  logical, defaults to TRUE. If TRUE, wraps ("spits out") formatted
  citations in a
  [`writeLines()`](https://rdrr.io/r/base/writeLines.html) output for
  the console. If `FALSE`, returns a character vector.

- delete_after:

  logical, defaults to TRUE. If TRUE, deletes CSL file when it's done.
  If FALSE, retains CSL for (potential) future use.

- scrub_bibitem:

  logical, defaults to FALSE. If TRUE, function leans on
  `str_replace_all()` in `{stringr}` to remove the use of "bibitem" in
  LaTeX. Only applicable to cases where `toformat` is "LaTeX".

## Value

`print_refs()` takes a `.bib` entry and returns the requested formatted
reference or references from it.

## Details

`print_refs()` assumes an active internet connection in the absence of
the appropriate CSL file in the working directory. The citation style
language (CSL) file supplied by the user must match a file in the
massive Github repository of CSL files. Users interested in potential
outputs should read more about Pandoc
(<https://pandoc.org/MANUAL.html>). The Github repository of CSL files
is available here: <https://github.com/citation-style-language/styles>.

I have an older version of the APSA CSL file that I prefer to use
available on my Github. If you want to use it dynamically, set `csl` to
"american-political-science-association-2015.csl" and set `cslrepo` to
"https://raw.githubusercontent.com/svmiller/hopplock/refs/heads/main".
The file is available on my Github here:
<https://github.com/svmiller/hopplock>.

## Examples

``` r

# \donttest{
example <- "@Book{vasquez2009twp, Title = {The War Puzzle Revisited},
Author = {Vasquez, John A}, Publisher = {New York, NY: Cambridge University Press},
Year = {2009}}"

print_refs(example)
#> I'm going to assume this is a .bib entry...
#> Downloading CSL from https://raw.githubusercontent.com/citation-style-language/styles/master/american-political-science-association.csl
#> Vasquez, John A. 2009. *The War Puzzle Revisited*. New York, NY:
#> Cambridge University Press.
# }
```
