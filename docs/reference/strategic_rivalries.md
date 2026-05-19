# Strategic Rivalries, 1494-2010

A simple summary of all strategic (inter-state) rivalries from Thompson
and Dreyer (2012).

## Usage

``` r
data("strategic_rivalries")
```

## Format

A data frame with 197 observations on the following 10 variables.

- `rivalryno`:

  a numeric vector for the rivalry number

- `rivalryname`:

  a character vector for the rivalry name

- `sidea`:

  a character vector for the first country in the rivalry

- `sideb`:

  a character vector for the second country in the rivalry

- `styear`:

  a numeric vector for the start year of the rivalry

- `endyear`:

  a numeric vector for the end year of the rivalry

- `region`:

  a character vector for the region of the rivalry, per Thompson and
  Dreyer (2012)

- `type1`:

  a character vector for the primary type of the rivalry (spatial,
  positional, ideological, or interventionary)

- `type2`:

  a character vector for the secondary type of the rivalry, if
  applicable (spatial, positional, ideological, or interventionary)

- `type3`:

  a character vector for the tertiary type of the rivalry, if applicable
  (spatial, positional, ideological, or interventionary)

## Details

Information gathered from the appendix of Thompson and Dreyer (2012).
Ongoing rivalries are right-bound at 2010, the date of publication for
Thompson and Dreyer's handbook. Users are free to change this if they
like.

## References

Thompson, William R. and David Dreyer. 2012. Handbook of International
Rivalries. CQ Press.

## Examples

``` r
data(strategic_rivalries)
```
