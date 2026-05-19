# Filter a Data Frame of Citations and Return the Entries as a Character

`filter_refs()` is a convenience function I wrote for filtering a data
frame of citations returning the entries as a valid `.bib` entry (as a
character vector). I wrote this for more easily passing on citations to
the [`print_refs()`](http://svmiller.com/reference/print_refs.md)
function also included in this package.

## Usage

``` r
filter_refs(bibdat, criteria, type = "bibtexkey")
```

## Arguments

- bibdat:

  a data frame of citations, like the one created by the bib2df package

- criteria:

  criteria, specified as a character vector, by which to filter the data
  frame of citations

- type:

  the particular type of citation entry on which to filter. Defaults to
  "bibtexkey" (which filters based on a column of unique citation keys).
  When `type == "year"`, the function filters on a character vector of
  years.

## Value

`filter_refs()` takes a data frame of citations, like the one created by
the bib2df package, and returns a character vector (amounting to a valid
`.bib` entry) of citations the user wants. This can then be easily
passed to the
[`print_refs()`](http://svmiller.com/reference/print_refs.md) function
also included in this package.

## Details

`filter_refs()` assumes some familiarity with `BibTeX`, `.bib` entries,
and depends on the bib2df package.

## Examples

``` r
# Based on `stevepubs` configuration, filter on `BIBTEXKEY` where
# the citation key matches one of these.
filter_refs(stevepubs, c("miller2017etst", "miller2017etjc", "miller2013tdpi"))
#> @ARTICLE{miller2013tdpi,
#>   AUTHOR = {Steven V. Miller},
#>   JOURNAL = {Journal of Peace Research},
#>   NUMBER = {6},
#>   PAGES = {677--690},
#>   TITLE = {Territorial Disputes and the Politics of Individual Well-Being},
#>   VOLUME = {50},
#>   YEAR = {2013}} 
#> 
#> @ARTICLE{miller2017etjc,
#>   AUTHOR = {Steven V. Miller},
#>   JOURNAL = {Political Research Quarterly},
#>   NUMBER = {4},
#>   PAGES = {790--802},
#>   TITLE = {The Effect of Terrorism on Judicial Confidence},
#>   VOLUME = {70},
#>   YEAR = {2017}} 
#> 
#> @ARTICLE{miller2017etst,
#>   AUTHOR = {Steven V. Miller},
#>   JOURNAL = {Political Behavior},
#>   NUMBER = {2},
#>   PAGES = {457--478},
#>   TITLE = {Economic Threats or Societal Turmoil? Understanding Preferences for Authoritarian Political Systems},
#>   VOLUME = {39},
#>   YEAR = {2017}} 
#> 

# Based on `stevepubs` configuration, filter on `YEAR` where
# the publication year is 2017, 2018, 2019, 2020, or 2021.
filter_refs(stevepubs, c(2017:2021), type = "year")
#> @ARTICLE{curtismiller2021snp,
#>   AUTHOR = {K. Amber Curtis and Steven V. Miller},
#>   JOURNAL = {European Union Politics},
#>   NUMBER = {2},
#>   PAGES = {202--26},
#>   TITLE = {A (Supra)Nationalist Personality? The Big Five's Effects on Political-Territorial Identification},
#>   VOLUME = {22},
#>   YEAR = {2021}} 
#> 
#> @ARTICLE{gibleretal2020icm,
#>   AUTHOR = {Douglas M. Gibler and Steven V. Miller and Erin K. Little},
#>   JOURNAL = {International Studies Quarterly},
#>   NUMBER = {2},
#>   PAGES = {476--479},
#>   TITLE = {The Importance of Correct Measurement},
#>   VOLUME = {64},
#>   YEAR = {2020}} 
#> 
#> @ARTICLE{miller2017etjc,
#>   AUTHOR = {Steven V. Miller},
#>   JOURNAL = {Political Research Quarterly},
#>   NUMBER = {4},
#>   PAGES = {790--802},
#>   TITLE = {The Effect of Terrorism on Judicial Confidence},
#>   VOLUME = {70},
#>   YEAR = {2017}} 
#> 
#> @ARTICLE{miller2017etst,
#>   AUTHOR = {Steven V. Miller},
#>   JOURNAL = {Political Behavior},
#>   NUMBER = {2},
#>   PAGES = {457--478},
#>   TITLE = {Economic Threats or Societal Turmoil? Understanding Preferences for Authoritarian Political Systems},
#>   VOLUME = {39},
#>   YEAR = {2017}} 
#> 
#> @ARTICLE{miller2017ieea,
#>   AUTHOR = {Steven V. Miller},
#>   JOURNAL = {Conflict Management and Peace Science},
#>   NUMBER = {5},
#>   PAGES = {526--545},
#>   TITLE = {Individual-Level Expectations of Executive Authority under Territorial Threat},
#>   VOLUME = {34},
#>   YEAR = {2017}} 
#> 
#> @ARTICLE{miller2018etttc,
#>   AUTHOR = {Steven V. Miller},
#>   JOURNAL = {Peace Economics, Peace Science and Public Policy},
#>   NUMBER = {1},
#>   TITLE = {External Territorial Threats and Tolerance of Corruption: A Private/Government Distinction},
#>   VOLUME = {24},
#>   YEAR = {2018},
#>   DOI = {10.1515/peps-2017-0043}} 
#> 
#> @ARTICLE{miller2019wata,
#>   AUTHOR = {Steven V. Miller},
#>   JOURNAL = {Social Science Quarterly},
#>   NUMBER = {1},
#>   PAGES = {272--288},
#>   TITLE = {What Americans Think About Gun Control: Evidence from the General Social Survey, 1972-2016},
#>   VOLUME = {100},
#>   YEAR = {2019}} 
#> 
#> @ARTICLE{millerdavis2020ewsp,
#>   AUTHOR = {Steven V. Miller and Nicholas T. Davis},
#>   JOURNAL = {Journal of Race, Ethnicity, and Politics},
#>   NUMBER = {2},
#>   PAGES = {334--351},
#>   TITLE = {The Effect of White Social Prejudice on Support for American Democracy},
#>   VOLUME = {6},
#>   YEAR = {2021}} 
#> 
#> @INCOLLECTION{milleretal2020gtc,
#>   AUTHOR = {Steven V. Miller and Jaroslav Tir and John A. Vasquez},
#>   BOOKTITLE = {Oxford Research Encyclopedia of International Studies},
#>   PUBLISHER = {Oxford University Press},
#>   TITLE = {Geography, Territory, and Conflict},
#>   YEAR = {2020},
#>   DOI = {10.1093/acrefore/9780190846626.013.320}} 
#> 
```
