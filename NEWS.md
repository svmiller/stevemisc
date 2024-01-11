# stevemisc 1.8.0

- `rd_plot()` now has an `na.rm = TRUE` argument quietly passed to the extraction of the standard deviation of the residuals. This ensures that missing values in the data don't result in missing residuals, which then result in no standard deviation of the residuals.
- `linloess_plot()` now has a `resid` argument that allows for comparison against the model's residuals on the *y*-axis rather than the default (the raw values of *y* on the *y*-axis).
- Assorted documentation fixes.

# stevemisc 1.7.0

- Add `charitable_contributions`.
- Add `rd_plot()`
- Scoped helper verbs (the "at" functions) are gradually getting `.by` support and, with it, breaking their link to the superseded `_at()` functions from `{dplyr}`. 
- `linloess_plot()` now has a `se` argument for optionally disabling standard error bands. For particularly ill-fitting linear models, this may be advisable.

# stevemisc 1.6.0

- `theme_steve()` is removed from the package. This function is now in `{stevethemes}`, which will house all my `{ggplot2}` themes going forward.
- Fix a warning/error/bug in `ps_spells()` that was brought to my attention by CRAN. I don't know why this came up just now, but it's apparently been an issue lurking around R development for some time now that [it's always been wrong to call `order()` on a data frame](https://stackoverflow.com/questions/68101279/warning-in-xtfrm-data-framex-cannot-xtfrm-data-frames-error-while-ordering). The underlying `order()` calls have been replaced with `arrange()`. This fix concerns a related issue that also affects `{peacesciencer}`.

# stevemisc 1.5.0

- Package now contains more scoped helper verbs---the so-called "at" functions. These functions---like `center_at()`, `diff_at()`, and more---are self-contained in one R Documentation file.
- `theme_steve_ms()` now actually uses "Crimson Pro", and not "Crimson Text".
- `theme_steve()` is deprecated and will be removed in a later release. This function has been been effectively moved to `{stevethemes}`, where it has also been expanded and improved. The remaining `{ggplot2}` functions in this package are becoming legacy functions with that in mind.
- `wls()` does weighted least squares re-estimations of an OLS model. HT @hadley for some information about a class issue.
- `fct_reorg()` completely re-written (by @hadley himself) in light of new `{forcats}` release.

# stevemisc 1.4.1

- Adjust `filter_refs()` and `print_refs()` to no longer require `{bib2df}`. With it, `{bib2df}` is also removed as a package dependency.

# stevemisc 1.4.0

- Add `filter_refs()` and, with it, the `{bib2df}` package as a dependency.
- `print_refs()` will now work on an (implied) `{bib2df}` data frame of `.bib` entries.
- Add `wom()`.
- Add `sbayesboot()`.
- Add `map_quiz`.
- Update `stevepubs`.
- Update `show_ranef()`, which no longer requires `{broom.mixed}` underneath the hood. Remove `{broom.mixed}` as package dependency.

# stevemisc 1.3.0


- Add data set on French leaders (`fra_leaderyears`). This will be a data set for stress-testing peace spell calculations where cross-sectional units are decidedly imbalanced.
- Add data set on German dyad-years (`gmy_dyadyears`).  This will be a data set for stress-testing peace spell calculations where there is a huge gap in the data.
- Add `ps_spells()`, for more general spell calculations going forward.
- Add `linloess_plot()`. With it, add `{tidyr}` as a dependency.


# stevemisc 1.2.0


- Add `prepare_refs()` and `print_refs()`
- Add `r2sd_at()`.
- Add `revcode()`.
- Add `stevepubs`.
- Add `theme_steve_ms()` and `theme_steve_font()`.

# stevemisc 1.1.0


- Add `ps_btscs()` for future use in `{peacesciencer}`.
- Moved a few `Imports:` entries to `Suggests:` for CRAN compliance. These import packages (`{DBI}`, `{RSQLite}`, and `{dbplyr}`) concern the `db_lselect()` function.


# stevemisc 1.0.0


This is the slated first professional/public release to CRAN. Package features major updates to functions, mostly for CRAN compliance. New features include `fct_reorg()`, a `gvi()` shortcut for `get_var_info()`, `ess9_labelled` data for illustration, scale-location t-distribution functions, and more.

# stevemisc 0.3.1


Move almost all data to `{stevedata}`. Add `p_z()`.

# stevemisc 0.3.0


Mostly cosmetic fixes to functionality of things. Most of these are not CRAN compliant.

# stevemisc 0.2.2


Add `usa_mids`. Update `sbtscs()`. Add vignette.

# stevemisc 0.2


Update `carrec()`, `cor2data()`, `corvectors()`, `get_sims()`, `get_var_info()`, `make_perclab()`, `make_scale()`, `jenny()`, `%nin%`, `normal_dist()`, `rbnorm()`, `sbtscs()`, `show_ranef()`, `smvrnorm()`, `theme_steve()`, and `theme_steve_web()`. Remove `multiplot()`.

# stevemisc 0.1.17


Update `fakeAPI`.

# stevemisc 0.1.16


Add seed to `corvectors()`. Add `fakeAPI`.

# stevemisc 0.1.14


Add `corvectors()` and `jenny()`.

# stevemisc 0.1.13


Add `tbl_df()` and `to_tbl()`. Update `theme_steve_web()`. Thanks to @mewdewitt for the suggestions.

# stevemisc 0.1.11


Add `%nin%`.

# stevemisc 0.1.10


Add `smvrnorm()`.

# stevemisc 0.1.8


Generalize `get_sims()` to handle non-mixed models.

# stevemisc 0.1.7.3


Update `States`.

# stevemisc 0.1.7.2


Update `DJIA`.

# stevemisc 0.1.7.1


Add seed for `rbnorm()`.

# stevemisc 0.1.7


Add `normal_dist()`, `States`, and update `Presidents`.

# stevemisc 0.1.6.9


Remove `Presidents`.

# stevemisc 0.1.6.8


Add `ESS9GB` and `Presidents`.

# stevemisc 0.1.6.6


Add `Arca`.

# stevemisc 0.1.6.5


Update `aluminum_premiums` and `DJIA`.

# stevemisc 0.1.6.4


Add `asn_stats` and `DST`.

# stevemisc 0.1.6.2


Add `cor2data()`.

# stevemisc 0.1.6.1


Add select *z*-values as vectors.

# stevemisc 0.1.6.01


Add `rbnorm()`.

# stevemisc 0.1.5.9


Update `aluminum_premiums`.

# stevemisc 0.1.5.8


Add `strategic_rivalries`.

# stevemisc 0.1.5.7


Add `sugar_prices`.

# stevemisc 0.1.5.6


Add `post_bg()`.

# stevemisc 0.1.5.5


Add `ghp100k`.

# stevemisc 0.1.5.4


Add `eustates` and `multiplot()`.

# stevemisc 0.1.5.2


Add `get_sims()`. Update `theme_steve_web()`.

# stevemisc 0.1.5.1


Add `r2sd()`.


# stevemisc 0.1.5


Add `carrec()` and `cardkrieger1994mwe`.

# stevemisc 0.1.4.9.6


Add `clemsontemps`, `gss_abortion`, and `map_quiz`.

# stevemisc 0.1.4.9.5


Add `nesarc_drinkspd`.

# stevemisc 0.1.4.9.3


Add `usa_chn_gdp_forecasts`.

# stevemisc 0.1.4.9.2


Add `imf_coffee_data`.

# stevemisc 0.1.4.9.1


Add `recessions`.

# stevemisc 0.1.4.9


Add `ukg_eeri`.

# stevemisc 0.1.4.8.9


Rename `edq_passengercars` to `eq_passengercars`.

# stevemisc 0.1.4.8.8


Add `edq_passengercars`.

# stevemisc 0.1.4.8.7


Update documentation for `migrants_usa` and `mvprod`.

# stevemisc 0.1.4.8.6


Add `mvprod`.

# stevemisc 0.1.4.8.5


Update documentation for `migrants_usa`.

# stevemisc 0.1.4.8.4


Update documentation for `migrants_usa`.

# stevemisc 0.1.4.8.3


Add `migrants_usa`.

# stevemisc 0.1.4.8.2


Update `steve_clothes`.

# stevemisc 0.1.4.8.1


Update `DJIA`.

# stevemisc 0.1.4.8


Add `DJIA`.

# stevemisc 0.1.4.7


Add `aluminum_premiums`.

# stevemisc 0.1.4.6


Update `theme_steve()`, `theme_steve_web()`, and `ustradegdp`.

# stevemisc 0.1.4.4


Add `ustradegdp`.

# stevemisc 0.1.4.3


Add `steves_clothes`.

# stevemisc 0.1.4.2


Add several data sets: `articseaice`, `co2data`, `osu_results`, and `sealevels`.

# stevemisc 0.1.4.1


Fix `{dplyr}` NAMESPACE issue,thanks to David Armstrong for recommending that.

# stevemisc 0.1.4


Add `get_var_info()`, `theme_steve_web2()`, and some fonts. in the `inst/fonts` directory.

# stevemisc 0.1.3


Add `theme_steve_web()`

# stevemisc 0.1.2


Changed the title on `theme_steve()`. Add `mround2()`

# stevemisc 0.1.1


Changed the title on `theme_steve()`

# stevemisc 0.1.0


Initial developmental release. Features included:

- `sbtscs()`
- `show_ranef()`
- `theme_steve()`
