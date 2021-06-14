## Test environment

- ubuntu 18.04, R 4.0.3

## Initial Comments to CRAN

R CMD check done via `devtools::check()`, resulting in 0 errors, 0 warnings and 0 notes. So far, this is a personal best for this package. Ultimately, there is just one simple addition to this package that I want to put on CRAN for its integration with another CRAN package.

`devtools::spell_check()` results in a lot of typos, all of which are false positives.
 
## Changes upon manual inspection at CRAN

Not applicable right now.

## Downstream dependencies

This is a new package with no major downstream dependencies to note.
