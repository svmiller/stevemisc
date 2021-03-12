## Test environment

- ubuntu 18.04, R 4.0.3

## Comments to CRAN in Light of Initial Rejection

I addressed the partial argument match that came by way of a facet wrap call in `show_ranef()` and successfully disabled that note.

I also moved `{emo}` to "Enhances:" in the DESCRIPTION file. That seems to do the trick.

## Initial Comments to CRAN

R CMD check done via `devtools::check()`, resulting in 0 errors, 0 warnings and 1 note. The note pertains to a partial argument match of "scale" to "scales" in a `facet_wrap(...)` call in the `show_ranef()` function. My understanding is, based on research for others who have encountered this, that this amounts to a false positive. However, I wanted to write here that I'm aware of this note.

`{emo}` is a suggested package. It appears in the `jenny()` function to provide an emoji after setting the reproducible seed to 8675309. The inspectors at CRAN should be able to see that the way the function is written has this package as strictly optional. It's why it's under "suggests" and not "imports". Depending on the exact check, this might result in an error. However, the package functionality does not at all depend on this package.

`devtools::spell_check()` results in a lot of typos, all of which are false positives.
 
## Changes upon manual inspection at CRAN

Not applicable right now.

## Downstream dependencies

This is a new package with no major downstream dependencies to note.
