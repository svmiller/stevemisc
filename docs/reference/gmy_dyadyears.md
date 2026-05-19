# German Dyad-Years, 1816-2020

These are data generated in peacesciencer for all German (and Prussian)
dyad-years from 1816 to 2020. These are going to be useful in
stress-testing what "peace spell" calculations may look like when there
is a huge gap in between years. In the Correlates of War context,
Germany disappears from the international system from 1945 to 1990.
It'll also serve as a nice test for making sure spell calculations don't
misbehave in the context of missing data. In this application, there are
no data for disputes between 2011 and 2020, but the dyad-years include
2011 to 2020.

## Usage

``` r
gmy_dyadyears
```

## Format

A data frame with 11174 observations on the following 6 variables.

- `dyad`:

  a unique identifier for the dyad

- `ccode1`:

  the Correlates of War state code for Germany (255)

- `ccode2`:

  the Correlates of War state code for the other state in the dyad

- `year`:

  an observation year for the dyad

- `gmlmidongoing`:

  was there an ongoing inter-state dispute in the dyad-year?

- `gmlmidonset`:

  was there a new inter-state dispute onset in the dyad-year

## Details

Data are generated in the development version (scheduled release of v.
0.7) of peacesciencer. Conflict data come from the GML MID data (v.
2.2.1).

## References

Gibler, Douglas M., Steven V. Miller, and Erin K. Little. 2016. “An
Analysis of the Militarized Interstate Dispute (MID) Dataset,
1816-2001.” International Studies Quarterly 60(4): 719-730.
