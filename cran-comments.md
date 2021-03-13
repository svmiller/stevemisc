## Test environment

- ubuntu 18.04, R 4.0.3

## (Hopefully Final) Comments to CRAN in Light of Issues with Additional Repositories

I opted to remove the `{emo}` incorporation from this release. I thank CRAN for informing me about the `Additional_repositories:` field, but using it seems to require me setting up a repository of my own. `{drat}` offers some promise here, which I will explore in the next release.

Absent `{emo}` functionality, the package passes all other checks and (I hope) would be suitable for addition to CRAN.

## Comments to CRAN in Light of Initial Rejection and Feedback

I addressed the partial argument match that came by way of a facet wrap call in `show_ranef()` and successfully disabled that note.

I also moved `{emo}` to "Enhances:" in the DESCRIPTION file. That seems to do the trick. A follow-up noted that this would be fine, but I should specify an `Additional_repositories:` entry in DESCRIPTION. I did just that to verify the existence of the package and how a user can obtain it.

Another follow-up comment asked about referencing exact methods in the DESCRIPTION field. I think this came from scanning the `Description:` entry and seeing references to some various helper functions for processing regression models. However, the methods themselves are so broad, and covered by multiple people, that any particular reference to any particular work would seem out of place and would come at the expense of the readability of the description file. The README offers a bit more discussion about these entries for the user's own edification. 

## Initial Comments to CRAN

R CMD check done via `devtools::check()`, resulting in 0 errors, 0 warnings and 1 note. The note pertains to a partial argument match of "scale" to "scales" in a `facet_wrap(...)` call in the `show_ranef()` function. My understanding is, based on research for others who have encountered this, that this amounts to a false positive. However, I wanted to write here that I'm aware of this note.

`{emo}` is a suggested package. It appears in the `jenny()` function to provide an emoji after setting the reproducible seed to 8675309. The inspectors at CRAN should be able to see that the way the function is written has this package as strictly optional. It's why it's under "suggests" and not "imports". Depending on the exact check, this might result in an error. However, the package functionality does not at all depend on this package.

`devtools::spell_check()` results in a lot of typos, all of which are false positives.
 
## Changes upon manual inspection at CRAN

Not applicable right now.

## Downstream dependencies

This is a new package with no major downstream dependencies to note.
