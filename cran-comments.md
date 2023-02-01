## Test environment

- ubuntu 18.04, R 4.0.3

## Initial Comments to CRAN

R CMD check done via `devtools::check()`, resulting in 0 errors, 0 warnings and 0 notes.

`devtools::spell_check()` results in a lot of typos, all of which are false positives.

This submission is accelerated by a recent email from CRAN about an error caused by the `fct_reorg()` function. I had been aware this would come up in light of a new `{forcats}` release. Hadley Wickham himself basically rewrote the function to be CRAN-compliant.

## Downstream dependencies

`{peacesciencer}`, a package I created and maintain, is a downstream dependency. The dependency is for the `ps_btscs()` and `ps_spells()` functions, which are unaffected by this update. There are no other downstream dependencies to note.

