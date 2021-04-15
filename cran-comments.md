## Test environment

- ubuntu 18.04, R 4.0.3

## Additional Comments to CRAN in Light of Further Issues Raised

An email from CRAN dated March 16 highlighted the following issues with this package. I'll address them here.

> If there are references describing the methods in your package, please add these in the description field of your DESCRIPTION file in the form

There are no references to particular methods contained in the package. Given the diverse nature of the package as an amalgam of various functions, including particular references in the DESCRIPTION file would not make much sense and would only distract from what the package offers. The package offers multiple, diverse tools to assist in data organization, data presentation, data recoding, and data simulation. 

> Please write TRUE and FALSE instead of T and F.

That was my bad and I appreciate CRAN letting me know that this is 1) not allowed and 2) lazy and problematic function-writing on my part.

> Please add \value to .Rd files regarding exported methods and explain the functions results in the documentation. 

Every documentation file now contains a `value{}` entry.

>  Please unwrap the examples if they are executable in < 5 sec, or replace \dontrun{} with \donttest{}.

I struggled with this and offer here an explanation of the changes I made.

First, I unwrapped the `db_lselect()` function and the example is now executable and testable for CRAN. This meant specifying some additional package dependencies in the DESCRIPTION file.

Second, I changed the `corvectors()` function to a "don't test" wrapper because this apparently takes more than 10 seconds to test on CRAN. I'll admit here that I have zero idea why this is the case. It takes mere seconds on my end but testing it on CRAN seems to take forever. Because of this time issue, a "don't test" wrapper makes sense.

Third, I opt to retain the "don't run" wrapper for the `{ggplot2}` themes. My justification for this is this wrapper is used for cases where the example cannot be executed because of missing additional software. I contend that the optional fonts amount to missing software and the exclusion of these fonts from CRAN's testing systems means the example will throw multiple errors.

> You are setting options(warn=-1) in your function. This is not allowed. To avoid unnecessary warning output you could use e.g. suppressWarnings().

That's my bad, again. I took out that line of code.

## (Hopefully Final) Comments to CRAN in Light of Issues with Additional Repositories

I opted to remove the `{emo}` incorporation from this release. I thank CRAN for informing me about the `Additional_repositories:` field, but using it seems to require me setting up a repository of my own. `{drat}` offers some promise here, which I will explore in the next release.

Absent `{emo}` functionality, the package passes all other checks and (I hope) would be suitable for addition to CRAN.

A check on CRAN failed for a reason that wasn't 100% clear. The failure occurred for the Windows build and not the Debian build. The language of the error implied it was a time issue since stuff in the `@examples` field is time-sensitive. The first submission I made to CRAN also resulted in this error, or seemed to flag this same error. I have since disabled that and this should be good right now. 

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
