# United States Militarized Interstate Disputes (MIDs)

This is a non-directed dyad-year data set for militarized interstate
disputes involving the United States. I created these to illustrate the
[`sbtscs()`](http://svmiller.com/reference/sbtscs.md) function.

## Usage

``` r
usa_mids
```

## Format

A data frame with 14586 observations on the following 6 variables.

- `dyad`:

  a unique identifier for the dyad

- `ccode1`:

  the Correlates of War state code for the United States (2)

- `ccode2`:

  the Correlates of War state code for the other state in the dyad

- `year`:

  an observation year for the dyad

- `midongoing`:

  was there an ongoing inter-state dispute in the dyad-year?

- `midonset`:

  was there a new inter-state dispute onset in the dyad-year

## Details

Data were generated some time ago. Rare cases where there were multiple
disputes ongoing in a given dyad-year were first whittled by
isolating 1) unique dispute onsets. Thereafter, the data select the 2)
highest fatality, then 3) the highest hostility level, and then 4) the
longer dispute, until 5) just picking whichever one came first. There
are no duplicate non-directed dyad-year observations.

## References

Gibler, Douglas M., Steven V. Miller, and Erin K. Little. 2016. “An
Analysis of the Militarized Interstate Dispute (MID) Dataset,
1816-2001.” International Studies Quarterly 60(4): 719-730.
