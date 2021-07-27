## Test environment

- ubuntu 18.04, R 4.0.3

## Initial Comments to CRAN

R CMD check done via `devtools::check()`, resulting in 0 errors, 0 warnings and 0 notes. Ultimately, there are just some simple additions to this package, all of which are CRAN-compliant.

`devtools::spell_check()` results in a lot of typos, all of which are false positives.
 
## Changes upon manual inspection at CRAN

I fixed a link in the README. I ended up pointing it to the secure Github repository rather than my unsecure link on top of that.

## Downstream dependencies

`{peacesciencer}`, a package I created and maintain, is a downstream dependency. The dependency is for the `ps_btscs()` function, which is unaffected by this update. There are no other downstream dependencies to note.
