## Test environment

- Pop! OS 22.04, R 4.1.2

## Initial Comments to CRAN

R CMD check done via `devtools::check()`, resulting in 0 errors, 0 warnings and 0 notes.

`devtools::spell_check()` results in a lot of typos, all of which are false positives.

This submission is accelerated by a recent email from CRAN about an error that comes up in the `ps_spells()` function. In particular, it comes with the use of `order()` on a data frame. I have since addressed that in this release.

## Downstream dependencies

`{peacesciencer}`, a package I created and maintain, is a downstream dependency. This release actually does concern that package because that package was also flagged by CRAN for the same issue that is accelerating this release. However, the issue that affects that package is directly connected to this package because `{peacesciencer}` uses the `ps_spells()` function in this package. Adequately fixing the issue here will address the issue in `{peacesciencer}`, though it does mean fixing it here first takes precedence.
