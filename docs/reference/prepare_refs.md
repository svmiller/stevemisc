# Prepare bib2df Data Frame for Formatting to Various Outputs

`prepare_refs` does some last-minute formatting of a data frame created
by bib2df so that it can be formatted nicely to various outputs.

## Usage

``` r
prepare_refs(bib2df_refs, toformat = "plain")
```

## Arguments

- bib2df_refs:

  a data frame created by bib2df

- toformat:

  what type of output you are ultimately going to want from
  [`print_refs()`](http://svmiller.com/reference/print_refs.md) .
  Default is "plain".

## Value

[`print_refs()`](http://svmiller.com/reference/print_refs.md) does some
last-minute formatting to a data frame created by bib2df so that
rendering in R Markdown is a little easier and less code-heavy.

## Details

The function is designed to work more generally in the absence of
various fields. Assume, for example, that your data frame has no `BOOK`
field. The function uses the
[`one_of()`](https://tidyselect.r-lib.org/reference/one_of.html) wrapper
to work around this. The "warning" returned by the function is more of a
message. This function may be expanded as I think of more use cases.

## See also

[`print_refs()`](http://svmiller.com/reference/print_refs.md) for
formatting a `.bib` references to various outputs.

## Examples

``` r

prepare_refs(stevepubs)
#> Warning: Unknown columns: `BOOK`
#> Warning: Unknown columns: `MAINTITLE`
#> # A tibble: 19 × 12
#>    CATEGORY     BIBTEXKEY  AUTHOR BOOKTITLE JOURNAL NUMBER PAGES PUBLISHER TITLE
#>    <chr>        <chr>      <list> <chr>     <chr>   <chr>  <chr> <chr>     <chr>
#>  1 ARTICLE      millergib… <chr>  NA        *Confl… 3      261-… NA        "Dem…
#>  2 ARTICLE      giblereta… <chr>  NA        *Compa… 12     1655… NA        "Ind…
#>  3 ARTICLE      giblermil… <chr>  NA        *Socia… 5      1202… NA        "Com…
#>  4 ARTICLE      giblermil… <chr>  NA        *Journ… 2      258-… NA        "Qui…
#>  5 ARTICLE      miller201… <chr>  NA        *Journ… 6      677-… NA        "Ter…
#>  6 ARTICLE      giblermil… <chr>  NA        *Journ… 5      634-… NA        "Ext…
#>  7 ARTICLE      giblereta… <chr>  NA        *Inter… 4      719-… NA        "An …
#>  8 ARTICLE      miller201… <chr>  NA        *Polit… 2      457-… NA        "Eco…
#>  9 ARTICLE      miller201… <chr>  NA        *Confl… 5      526-… NA        "Ind…
#> 10 ARTICLE      miller201… <chr>  NA        *Polit… 4      790-… NA        "The…
#> 11 ARTICLE      miller201… <chr>  NA        *Peace… 1      NA    NA        "Ext…
#> 12 ARTICLE      miller201… <chr>  NA        *Socia… 1      272-… NA        "Wha…
#> 13 ARTICLE      giblereta… <chr>  NA        *Inter… 2      476-… NA        "The…
#> 14 INCOLLECTION millereta… <chr>  *Oxford … NA      NA     NA    Oxford U… "Geo…
#> 15 ARTICLE      millerdav… <chr>  NA        *Journ… 2      334-… NA        "The…
#> 16 ARTICLE      curtismil… <chr>  NA        *Europ… 2      202-… NA        "A (…
#> 17 ARTICLE      miller202… <chr>  NA        *The S… NA     NA    NA        "Eco…
#> 18 ARTICLE      peacescie… <chr>  NA        *Confl… NA     NA    NA        "~{ …
#> 19 ARTICLE      miller202… <chr>  NA        *Journ… NA     NA    NA        "A R…
#> # ℹ 3 more variables: VOLUME <chr>, YEAR <chr>, DOI <chr>
```
