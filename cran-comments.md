## Test environment

- ubuntu 18.04, R 4.0.3

## Initial Comments to CRAN

R CMD check done via `devtools::check()`, resulting in 0 errors, 0 warnings and 0 notes. The package comes with two new functions that are CRAN-compliant.

`devtools::spell_check()` results in a lot of typos, all of which are false positives.

This submission is accelerated by a recent email from Brian Ripley about the `{broom.mixed}` package. It was formerly a dependency of this package (by way of the `show_ranef()` function), but is no longer a dependency.

## Downstream dependencies

`{peacesciencer}`, a package I created and maintain, is a downstream dependency. The dependency is for the `ps_btscs()` function, which is unaffected by this update. There are no other downstream dependencies to note.


## Second Round Comments to CRAN

I identified that stray non-ASCII character and fixed it.

I identified and fixed the class-compare-to-string issue identified by CRAN. I thank CRAN for also suggesting the solution as well.
