# Changelog

## stevemisc 2.0.0

- [`fr_plot()`](http://svmiller.com/reference/fr_plot.md) makes a
  fitted-residual plot from a linear model estimated with the
  [`lm()`](https://rdrr.io/r/stats/lm.html) function in base R.
- [`n2w()`](http://svmiller.com/reference/n2w.md) converts numbers
  (integers, ideally) to an English word or set of words.

## stevemisc 1.9.0

CRAN release: 2025-10-21

- [`rewb_at()`](http://svmiller.com/reference/at.md) is a convenience
  wrapper for [`mean_at()`](http://svmiller.com/reference/at.md),
  [`group_mean_center_at()`](http://svmiller.com/reference/at.md), and
  [`center_at()`](http://svmiller.com/reference/at.md). It’s useful for
  preparing data for a random effects, within-between (REWB) panel
  analysis.
- [`linloess_plot()`](http://svmiller.com/reference/linloess_plot.md)
  now has a special print class for suppressing warnings that come from
  the LOESS smoother. Additionally, there is are `suppress_warnings` and
  `no_dummies` arguments in this function.
- [`print_refs()`](http://svmiller.com/reference/print_refs.md) now has
  a `scrub_bibitem` argument when converting to LaTeX.

## stevemisc 1.8.0

CRAN release: 2024-08-23

- [`rd_plot()`](http://svmiller.com/reference/rd_plot.md) now has an
  `na.rm = TRUE` argument quietly passed to the extraction of the
  standard deviation of the residuals. This ensures that missing values
  in the data don’t result in missing residuals, which then result in no
  standard deviation of the residuals.
- [`linloess_plot()`](http://svmiller.com/reference/linloess_plot.md)
  now has a `resid` argument that allows for comparison against the
  model’s residuals on the *y*-axis rather than the default (the raw
  values of *y* on the *y*-axis).
- Assorted documentation fixes.

## stevemisc 1.7.0

CRAN release: 2023-11-06

- Add `charitable_contributions`.
- Add [`rd_plot()`](http://svmiller.com/reference/rd_plot.md)
- Scoped helper verbs (the “at” functions) are gradually getting `.by`
  support and, with it, breaking their link to the superseded `_at()`
  functions from [dplyr](https://dplyr.tidyverse.org).
- [`linloess_plot()`](http://svmiller.com/reference/linloess_plot.md)
  now has a `se` argument for optionally disabling standard error bands.
  For particularly ill-fitting linear models, this may be advisable.

## stevemisc 1.6.0

CRAN release: 2023-03-22

- `theme_steve()` is removed from the package. This function is now in
  [stevethemes](http://svmiller.com/stevethemes/), which will house all
  my [ggplot2](https://ggplot2.tidyverse.org) themes going forward.
- Fix a warning/error/bug in
  [`ps_spells()`](http://svmiller.com/reference/ps_spells.md) that was
  brought to my attention by CRAN. I don’t know why this came up just
  now, but it’s apparently been an issue lurking around R development
  for some time now that [it’s always been wrong to call `order()` on a
  data
  frame](https://stackoverflow.com/questions/68101279/warning-in-xtfrm-data-framex-cannot-xtfrm-data-frames-error-while-ordering).
  The underlying [`order()`](https://rdrr.io/r/base/order.html) calls
  have been replaced with
  [`arrange()`](https://dplyr.tidyverse.org/reference/arrange.html).
  This fix concerns a related issue that also affects
  [peacesciencer](https://github.com/svmiller/peacesciencer/).

## stevemisc 1.5.0

CRAN release: 2023-02-01

- Package now contains more scoped helper verbs—the so-called “at”
  functions. These functions—like
  [`center_at()`](http://svmiller.com/reference/at.md),
  [`diff_at()`](http://svmiller.com/reference/at.md), and more—are
  self-contained in one R Documentation file.
- [`theme_steve_ms()`](http://svmiller.com/reference/ggplot-themes.md)
  now actually uses “Crimson Pro”, and not “Crimson Text”.
- `theme_steve()` is deprecated and will be removed in a later release.
  This function has been been effectively moved to
  [stevethemes](http://svmiller.com/stevethemes/), where it has also
  been expanded and improved. The remaining
  [ggplot2](https://ggplot2.tidyverse.org) functions in this package are
  becoming legacy functions with that in mind.
- [`wls()`](http://svmiller.com/reference/wls.md) does weighted least
  squares re-estimations of an OLS model. HT
  [@hadley](https://github.com/hadley) for some information about a
  class issue.
- [`fct_reorg()`](http://svmiller.com/reference/fct_reorg.md) completely
  re-written (by [@hadley](https://github.com/hadley) himself) in light
  of new [forcats](https://forcats.tidyverse.org/) release.

## stevemisc 1.4.1

CRAN release: 2022-04-12

- Adjust [`filter_refs()`](http://svmiller.com/reference/filter_refs.md)
  and [`print_refs()`](http://svmiller.com/reference/print_refs.md) to
  no longer require [bib2df](https://docs.ropensci.org/bib2df/). With
  it, [bib2df](https://docs.ropensci.org/bib2df/) is also removed as a
  package dependency.

## stevemisc 1.4.0

CRAN release: 2022-03-23

- Add [`filter_refs()`](http://svmiller.com/reference/filter_refs.md)
  and, with it, the [bib2df](https://docs.ropensci.org/bib2df/) package
  as a dependency.
- [`print_refs()`](http://svmiller.com/reference/print_refs.md) will now
  work on an (implied) [bib2df](https://docs.ropensci.org/bib2df/) data
  frame of `.bib` entries.
- Add [`wom()`](http://svmiller.com/reference/wom.md).
- Add [`sbayesboot()`](http://svmiller.com/reference/sbayesboot.md).
- Add `map_quiz`.
- Update `stevepubs`.
- Update [`show_ranef()`](http://svmiller.com/reference/show_ranef.md),
  which no longer requires
  [broom.mixed](https://github.com/bbolker/broom.mixed) underneath the
  hood. Remove [broom.mixed](https://github.com/bbolker/broom.mixed) as
  package dependency.

## stevemisc 1.3.0

CRAN release: 2021-10-22

- Add data set on French leaders (`fra_leaderyears`). This will be a
  data set for stress-testing peace spell calculations where
  cross-sectional units are decidedly imbalanced.
- Add data set on German dyad-years (`gmy_dyadyears`). This will be a
  data set for stress-testing peace spell calculations where there is a
  huge gap in the data.
- Add [`ps_spells()`](http://svmiller.com/reference/ps_spells.md), for
  more general spell calculations going forward.
- Add
  [`linloess_plot()`](http://svmiller.com/reference/linloess_plot.md).
  With it, add [tidyr](https://tidyr.tidyverse.org) as a dependency.

## stevemisc 1.2.0

CRAN release: 2021-07-27

- Add [`prepare_refs()`](http://svmiller.com/reference/prepare_refs.md)
  and [`print_refs()`](http://svmiller.com/reference/print_refs.md)
- Add [`r2sd_at()`](http://svmiller.com/reference/at.md).
- Add [`revcode()`](http://svmiller.com/reference/revcode.md).
- Add `stevepubs`.
- Add
  [`theme_steve_ms()`](http://svmiller.com/reference/ggplot-themes.md)
  and
  [`theme_steve_font()`](http://svmiller.com/reference/ggplot-themes.md).

## stevemisc 1.1.0

CRAN release: 2021-06-14

- Add [`ps_btscs()`](http://svmiller.com/reference/ps_btscs.md) for
  future use in
  [peacesciencer](https://github.com/svmiller/peacesciencer/).
- Moved a few `Imports:` entries to `Suggests:` for CRAN compliance.
  These import packages ([DBI](https://dbi.r-dbi.org),
  [RSQLite](https://rsqlite.r-dbi.org), and
  [dbplyr](https://dbplyr.tidyverse.org/)) concern the
  [`db_lselect()`](http://svmiller.com/reference/db_lselect.md)
  function.

## stevemisc 1.0.0

CRAN release: 2021-04-19

This is the slated first professional/public release to CRAN. Package
features major updates to functions, mostly for CRAN compliance. New
features include
[`fct_reorg()`](http://svmiller.com/reference/fct_reorg.md), a
[`gvi()`](http://svmiller.com/reference/get_var_info.md) shortcut for
[`get_var_info()`](http://svmiller.com/reference/get_var_info.md),
`ess9_labelled` data for illustration, scale-location t-distribution
functions, and more.

## stevemisc 0.3.1

Move almost all data to [stevedata](http://svmiller.com/stevedata/). Add
[`p_z()`](http://svmiller.com/reference/p_z.md).

## stevemisc 0.3.0

Mostly cosmetic fixes to functionality of things. Most of these are not
CRAN compliant.

## stevemisc 0.2.2

Add `usa_mids`. Update
[`sbtscs()`](http://svmiller.com/reference/sbtscs.md). Add vignette.

## stevemisc 0.2

Update [`carrec()`](http://svmiller.com/reference/carrec.md),
[`cor2data()`](http://svmiller.com/reference/cor2data.md),
[`corvectors()`](http://svmiller.com/reference/corvectors.md),
[`get_sims()`](http://svmiller.com/reference/get_sims.md),
[`get_var_info()`](http://svmiller.com/reference/get_var_info.md),
[`make_perclab()`](http://svmiller.com/reference/make_perclab.md),
[`make_scale()`](http://svmiller.com/reference/make_scale.md),
[`jenny()`](http://svmiller.com/reference/jenny.md), `%nin%`,
[`normal_dist()`](http://svmiller.com/reference/normal_dist.md),
[`rbnorm()`](http://svmiller.com/reference/rbnorm.md),
[`sbtscs()`](http://svmiller.com/reference/sbtscs.md),
[`show_ranef()`](http://svmiller.com/reference/show_ranef.md),
[`smvrnorm()`](http://svmiller.com/reference/smvrnorm.md),
`theme_steve()`, and
[`theme_steve_web()`](http://svmiller.com/reference/ggplot-themes.md).
Remove `multiplot()`.

## stevemisc 0.1.17

Update `fakeAPI`.

## stevemisc 0.1.16

Add seed to
[`corvectors()`](http://svmiller.com/reference/corvectors.md). Add
`fakeAPI`.

## stevemisc 0.1.14

Add [`corvectors()`](http://svmiller.com/reference/corvectors.md) and
[`jenny()`](http://svmiller.com/reference/jenny.md).

## stevemisc 0.1.13

Add [`tbl_df()`](http://svmiller.com/reference/tbl_df.md) and
[`to_tbl()`](http://svmiller.com/reference/tbl_df.md). Update
[`theme_steve_web()`](http://svmiller.com/reference/ggplot-themes.md).
Thanks to [@mewdewitt](https://github.com/mewdewitt) for the
suggestions.

## stevemisc 0.1.11

Add `%nin%`.

## stevemisc 0.1.10

Add [`smvrnorm()`](http://svmiller.com/reference/smvrnorm.md).

## stevemisc 0.1.8

Generalize [`get_sims()`](http://svmiller.com/reference/get_sims.md) to
handle non-mixed models.

## stevemisc 0.1.7.3

Update `States`.

## stevemisc 0.1.7.2

Update `DJIA`.

## stevemisc 0.1.7.1

Add seed for [`rbnorm()`](http://svmiller.com/reference/rbnorm.md).

## stevemisc 0.1.7

Add [`normal_dist()`](http://svmiller.com/reference/normal_dist.md),
`States`, and update `Presidents`.

## stevemisc 0.1.6.9

Remove `Presidents`.

## stevemisc 0.1.6.8

Add `ESS9GB` and `Presidents`.

## stevemisc 0.1.6.6

Add `Arca`.

## stevemisc 0.1.6.5

Update `aluminum_premiums` and `DJIA`.

## stevemisc 0.1.6.4

Add `asn_stats` and `DST`.

## stevemisc 0.1.6.2

Add [`cor2data()`](http://svmiller.com/reference/cor2data.md).

## stevemisc 0.1.6.1

Add select *z*-values as vectors.

## stevemisc 0.1.6.01

Add [`rbnorm()`](http://svmiller.com/reference/rbnorm.md).

## stevemisc 0.1.5.9

Update `aluminum_premiums`.

## stevemisc 0.1.5.8

Add `strategic_rivalries`.

## stevemisc 0.1.5.7

Add `sugar_prices`.

## stevemisc 0.1.5.6

Add [`post_bg()`](http://svmiller.com/reference/ggplot-themes.md).

## stevemisc 0.1.5.5

Add `ghp100k`.

## stevemisc 0.1.5.4

Add `eustates` and `multiplot()`.

## stevemisc 0.1.5.2

Add [`get_sims()`](http://svmiller.com/reference/get_sims.md). Update
[`theme_steve_web()`](http://svmiller.com/reference/ggplot-themes.md).

## stevemisc 0.1.5.1

Add [`r2sd()`](http://svmiller.com/reference/r2sd.md).

## stevemisc 0.1.5

Add [`carrec()`](http://svmiller.com/reference/carrec.md) and
`cardkrieger1994mwe`.

## stevemisc 0.1.4.9.6

Add `clemsontemps`, `gss_abortion`, and `map_quiz`.

## stevemisc 0.1.4.9.5

Add `nesarc_drinkspd`.

## stevemisc 0.1.4.9.3

Add `usa_chn_gdp_forecasts`.

## stevemisc 0.1.4.9.2

Add `imf_coffee_data`.

## stevemisc 0.1.4.9.1

Add `recessions`.

## stevemisc 0.1.4.9

Add `ukg_eeri`.

## stevemisc 0.1.4.8.9

Rename `edq_passengercars` to `eq_passengercars`.

## stevemisc 0.1.4.8.8

Add `edq_passengercars`.

## stevemisc 0.1.4.8.7

Update documentation for `migrants_usa` and `mvprod`.

## stevemisc 0.1.4.8.6

Add `mvprod`.

## stevemisc 0.1.4.8.5

Update documentation for `migrants_usa`.

## stevemisc 0.1.4.8.4

Update documentation for `migrants_usa`.

## stevemisc 0.1.4.8.3

Add `migrants_usa`.

## stevemisc 0.1.4.8.2

Update `steve_clothes`.

## stevemisc 0.1.4.8.1

Update `DJIA`.

## stevemisc 0.1.4.8

Add `DJIA`.

## stevemisc 0.1.4.7

Add `aluminum_premiums`.

## stevemisc 0.1.4.6

Update `theme_steve()`,
[`theme_steve_web()`](http://svmiller.com/reference/ggplot-themes.md),
and `ustradegdp`.

## stevemisc 0.1.4.4

Add `ustradegdp`.

## stevemisc 0.1.4.3

Add `steves_clothes`.

## stevemisc 0.1.4.2

Add several data sets: `articseaice`, `co2data`, `osu_results`, and
`sealevels`.

## stevemisc 0.1.4.1

Fix [dplyr](https://dplyr.tidyverse.org) NAMESPACE issue,thanks to David
Armstrong for recommending that.

## stevemisc 0.1.4

Add [`get_var_info()`](http://svmiller.com/reference/get_var_info.md),
`theme_steve_web2()`, and some fonts. in the `inst/fonts` directory.

## stevemisc 0.1.3

Add
[`theme_steve_web()`](http://svmiller.com/reference/ggplot-themes.md)

## stevemisc 0.1.2

Changed the title on `theme_steve()`. Add `mround2()`

## stevemisc 0.1.1

Changed the title on `theme_steve()`

## stevemisc 0.1.0

Initial developmental release. Features included:

- [`sbtscs()`](http://svmiller.com/reference/sbtscs.md)
- [`show_ranef()`](http://svmiller.com/reference/show_ranef.md)
- `theme_steve()`
