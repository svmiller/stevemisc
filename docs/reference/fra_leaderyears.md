# French Leader-Years, 1874-2015

These are data generated in peacesciencer for all French leader-years
from 1874 to 2015. I'm going to use these data for stress-testing the
calculation of so-called "peace spells" for data that are decidedly
imbalanced, as these are.

## Usage

``` r
fra_leaderyears
```

## Format

A data frame with 255 observations on the following 10 variables.

- `obsid`:

  the unique observation ID in the Archigos data

- `ccode`:

  the Correlates of War state code for France (220)

- `leader`:

  a name—typically last name—for the leader

- `year`:

  an observation year for the leader

- `startdate`:

  the start date for the leader's period in office

- `enddate`:

  the end date for the leader's period in office

- `gmlmidongoing`:

  was there an ongoing inter-state dispute for the leader?

- `gmlmidonset`:

  was there a new inter-state dispute onset for the leader?

- `gmlmidongoing_init`:

  was there an ongoing inter-state dispute for the leader that the
  leader initiated?

- `gmlmidonset_init`:

  was there a new inter-state dispute onset for the leader that the
  leader initiated?

## Details

Data are generated in the development version (scheduled release of v.
0.7) of peacesciencer. Conflict data come from the GML MID data (v.
2.2.1). Leader data come from Archigos (v. 4.1).

## References

Goemans, Henk E., Kristian Skrede Gleditsch, and Giacomo Chiozza. 2009.
"Introducing Archigos: A Dataset of Political Leaders" *Journal of Peace
Research* 46(2): 269–83.

Gibler, Douglas M., Steven V. Miller, and Erin K. Little. 2016. “An
Analysis of the Militarized Interstate Dispute (MID) Dataset,
1816-2001.” International Studies Quarterly 60(4): 719-730.
