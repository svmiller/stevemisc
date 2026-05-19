# Scoped Helper Verbs

Scoped helper verbs included in this R Documentation file allow for
targeted commands on specified columns. They also rename the ensuing
output to conform to my preferred style. The commands here are multiple
and explained in the details section below.

## Usage

``` r
center_at(data, x, prefix = "c", na = TRUE, .by = NULL)

diff_at(data, x, o = 1, prefix = "d", .by = NULL)

group_mean_center_at(
  data,
  x,
  mean_prefix = "mean",
  prefix = "b",
  na = TRUE,
  .by
)

lag_at(data, x, prefix = "l", o = 1, .by = NULL)

log_at(data, x, prefix = "ln", plus_1 = FALSE)

mean_at(data, x, prefix = "mean", na = TRUE, .by = NULL)

r1sd_at(data, x, prefix = "s", na = TRUE, .by = NULL)

r2sd_at(data, x, prefix = "z", na = TRUE, .by = NULL)

rewb_at(data, x, w_prefix = "w", b_prefix = "b", .by)
```

## Arguments

- data:

  a data frame

- x:

  a vector, likely in your data frame

- prefix:

  Allows the user to rename the prefix of the new variables. Each
  function has defaults (see details section).

- na:

  a logical about whether missing values should be ignored in the
  creation of means and re-scaled variables. Defaults to TRUE (i.e. pass
  over/remove missing observations). Not applicable to `diff_at`,
  `lag_at`, and `log_at`.

- .by:

  a selection of columns by which to group the operation. Defaults to
  NULL. This will eventually become a standard feature of the functions
  as this operator moves beyond the experimental in dplyr. The argument
  is not applicable to `log_at` (why would it be) and is optional for
  all functions except `group_mean_center_at`. `group_mean_center_at`
  must have something specified for grouped mean-centering.

- o:

  The order of lags for calculating differences or lags in `diff_at` or
  `lag_at`. Applicable only to these functions.

- mean_prefix:

  Applicable only to `group_mean_center_at`. Specifies the prefix of the
  (assumed) total population mean variables. Default is "mean", though
  the user can change this as they see fit.

- plus_1:

  Applicable only to `log_at`. If TRUE, adds 1 to the variables prior to
  log transformation. If FALSE, performs logarithmic transformation on
  variables no matter whether 0 occurs (i.e. 0s will come back as -Inf).
  Defaults to FALSE.

- w_prefix:

  Applicable only to `rewb_at`, but specifies prefix for so-called
  "within" variables created by this procedure. Defaults to "w".

- b_prefix:

  Applicable only to `rewb_at`, but specifies prefix for so-called
  "between" variables created by this procedure. Defaults to "b".

## Value

The function returns a set of new vectors in a data frame after
performing relevant functions. The new vectors have distinct prefixes
corresponding with the action performed on them.

## Details

`center_at` is a wrapper for `mutate_at` and `rename_at` from dplyr. It
takes supplied vectors and effectively centers them from the mean. It
then renames these new variables to have a prefix of `c_`. The default
prefix ("c") can be changed by way of an argument in the function.

`diff_at` is a wrapper for `mutate` and `across` from dplyr. It takes
supplied vectors and creates differences from the previous value
recorded above it. It then renames these new variables to have a prefix
of `d_` (in the case of a first difference), or something like `d2_` in
the case of second differences, or `d3_` in the case of third
differences (and so on). The exact prefix depends on the `o` argument,
which communicates the order of lags you want. It defaults to 1. The
default prefix ("d") can be changed by way of an argument in the
function, though the naming convention will omit a numerical prefix for
first differences.

`group_mean_center_at` is a wrapper for `mutate` and `across` in dplyr.
It takes supplied vectors and centers an (assumed) group mean of the
variables from an (assumed) total population mean of the variables
provided to it. It then returns the new variables with a prefix, whose
default is `b_`. This prefix communicates, if you will, a kind of
"between" variable in the panel model context, in juxtaposition to
"within" variables in the panel model context.

`lag_at` is a wrapper for `mutate` and `across` from dplyr. It takes
supplied vector(s) and creates lag variables from them. These new
variables have a prefix of `l[o]_` where `o` corresponds to the order of
the lag (specified by an argument in the function, which defaults to 1).
This default prefix ("l") can be changed by way of an another argument
in the function.

`log_at` is a wrapper for `mutate` and `across` from dplyr. It takes
supplied vectors and creates a variable that takes a natural logarithmic
transformation of them. It then renames these new variables to have a
prefix of `ln_`. This default prefix ("ln") can be changed by way of an
argument in the function. Users can optionally specify that they want to
add 1 to the vector before taking its natural logarithm, which is a
popular thing to do when positive reals have naturally occurring zeroes.

`mean_at` is a wrapper for `mutate` and `across` from dplyr. It takes
supplied vectors and creates a variable communicating the mean of the
variable. It then renames these new variables to have a prefix of
`mean_`. This default prefix ("mean") can be changed by way of an
argument in the function.

`r1sd_at` is a wrapper for `mutate` and `across` from dplyr. It both
rescales the supplied vectors to new vectors and renames the vectors to
each have a prefix of `s_`. Note the rescaling here is just by one
standard deviation and not two. The default prefix ("s") can be changed
by way of an argument in the function.

`r2sd_at` is a wrapper for `mutate` and `across` from dplyr. It both
rescales the supplied vectors to new vectors and renames the vectors to
each have a prefix of `z_`. Note the rescaling here is by two standard
deviations and not one. The default prefix ("z") can be changed by way
of an argument in the function.

`rewb_at` is a wrapper for routines done by `mean_at`,
`group_mean_center_at`, and `center_at` in this package. It implicitly
assumes the data are a panel and runs these three routines in order to
create so-called "between" and "within" variables for a "random effects,
within-between" analysis. Means are calculated based on available data,
so there is no `na` argument available in this function. The function
will fail in the presence of variables in the data matching those that
this routine wants to create.

All functions, except for `lag_at`, will fail in the absence of a
character vector of a length of one. They are intended to work across
multiple columns instead of just one. If you are wanting to create one
new variable, you should think about using some other dplyr verb on its
own.

## Examples

``` r

set.seed(8675309)
Example <- data.frame(category = c(rep("A", 5),
                                   rep("B", 5),
                                   rep("C", 5)),
                      x = runif(15), y = runif(15),
                      z = sample(1:20, 15, replace=TRUE))

my_vars <- c("x", "y", "z")
center_at(Example, my_vars)
#>    category         x          y  z         c_x         c_y c_z
#> 1         A 0.1594836 0.91822046  9 -0.45270578  0.38488743  -4
#> 2         A 0.4781883 0.71636154 19 -0.13400109  0.18302851   6
#> 3         A 0.7647987 0.20624914 15  0.15260928 -0.32708389   2
#> 4         A 0.7696877 0.81691683 20  0.15749826  0.28358381   7
#> 5         A 0.2685485 0.71585943 14 -0.34364092  0.18252640   1
#> 6         B 0.6730459 0.06062449 14  0.06085649 -0.47270853   1
#> 7         B 0.9787908 0.84710058 17  0.36660137  0.31376756   4
#> 8         B 0.8463270 0.84676044  8  0.23413755  0.31342741  -5
#> 9         B 0.8566562 0.33261085 16  0.24446673 -0.20072218   3
#> 10        B 0.4451601 0.55965050 16 -0.16702927  0.02631747   3
#> 11        C 0.8382325 0.66946933 12  0.22604312  0.13613631  -1
#> 12        C 0.5833169 0.25463848 18 -0.02887250 -0.27869455   5
#> 13        C 0.5109512 0.07917477  5 -0.10123826 -0.45415826  -8
#> 14        C 0.2601681 0.15996809  6 -0.35202128 -0.37336494  -7
#> 15        C 0.7494857 0.81639049  6  0.13729632  0.28305746  -7

diff_at(Example, my_vars)
#>    category         x          y  z          d_x           d_y d_z
#> 1         A 0.1594836 0.91822046  9           NA            NA  NA
#> 2         A 0.4781883 0.71636154 19  0.318704692 -0.2018589161  10
#> 3         A 0.7647987 0.20624914 15  0.286610370 -0.5101124048  -4
#> 4         A 0.7696877 0.81691683 20  0.004888979  0.6106676969   5
#> 5         A 0.2685485 0.71585943 14 -0.501139179 -0.1010574063  -6
#> 6         B 0.6730459 0.06062449 14  0.404497413 -0.6552349348   0
#> 7         B 0.9787908 0.84710058 17  0.305744875  0.7864760908   3
#> 8         B 0.8463270 0.84676044  8 -0.132463813 -0.0003401469  -9
#> 9         B 0.8566562 0.33261085 16  0.010329181 -0.5141495881   8
#> 10        B 0.4451601 0.55965050 16 -0.411496004  0.2270396501   0
#> 11        C 0.8382325 0.66946933 12  0.393072386  0.1098188350  -4
#> 12        C 0.5833169 0.25463848 18 -0.254915616 -0.4148308551   6
#> 13        C 0.5109512 0.07917477  5 -0.072365765 -0.1754637090 -13
#> 14        C 0.2601681 0.15996809  6 -0.250783015  0.0807933176   1
#> 15        C 0.7494857 0.81639049  6  0.489317597  0.6564223976   0

diff_at(Example, my_vars, o=3)
#>    category         x          y  z         d3_x          d3_y d3_z
#> 1         A 0.1594836 0.91822046  9           NA            NA   NA
#> 2         A 0.4781883 0.71636154 19           NA            NA   NA
#> 3         A 0.7647987 0.20624914 15           NA            NA   NA
#> 4         A 0.7696877 0.81691683 20  0.610204041 -0.1013036240   11
#> 5         A 0.2685485 0.71585943 14 -0.209639830 -0.0005021142   -5
#> 6         B 0.6730459 0.06062449 14 -0.091752786 -0.1456246441   -1
#> 7         B 0.9787908 0.84710058 17  0.209103110  0.0301837497   -3
#> 8         B 0.8463270 0.84676044  8  0.577778475  0.1309010091   -6
#> 9         B 0.8566562 0.33261085 16  0.183610243  0.2719863558    2
#> 10        B 0.4451601 0.55965050 16 -0.533630636 -0.2874500849   -1
#> 11        C 0.8382325 0.66946933 12 -0.008094437 -0.1772911029    4
#> 12        C 0.5833169 0.25463848 18 -0.273339234 -0.0779723700    2
#> 13        C 0.5109512 0.07917477  5  0.065791005 -0.4804757291  -11
#> 14        C 0.2601681 0.15996809  6 -0.578064396 -0.5095012465   -6
#> 15        C 0.7494857 0.81639049  6  0.166168816  0.5617520062  -12

lag_at(Example, my_vars)
#>    category         x          y  z      l1_x       l1_y l1_z
#> 1         A 0.1594836 0.91822046  9        NA         NA   NA
#> 2         A 0.4781883 0.71636154 19 0.1594836 0.91822046    9
#> 3         A 0.7647987 0.20624914 15 0.4781883 0.71636154   19
#> 4         A 0.7696877 0.81691683 20 0.7647987 0.20624914   15
#> 5         A 0.2685485 0.71585943 14 0.7696877 0.81691683   20
#> 6         B 0.6730459 0.06062449 14 0.2685485 0.71585943   14
#> 7         B 0.9787908 0.84710058 17 0.6730459 0.06062449   14
#> 8         B 0.8463270 0.84676044  8 0.9787908 0.84710058   17
#> 9         B 0.8566562 0.33261085 16 0.8463270 0.84676044    8
#> 10        B 0.4451601 0.55965050 16 0.8566562 0.33261085   16
#> 11        C 0.8382325 0.66946933 12 0.4451601 0.55965050   16
#> 12        C 0.5833169 0.25463848 18 0.8382325 0.66946933   12
#> 13        C 0.5109512 0.07917477  5 0.5833169 0.25463848   18
#> 14        C 0.2601681 0.15996809  6 0.5109512 0.07917477    5
#> 15        C 0.7494857 0.81639049  6 0.2601681 0.15996809    6

lag_at(Example, my_vars, o=3)
#>    category         x          y  z      l1_x      l2_x      l3_x       l1_y
#> 1         A 0.1594836 0.91822046  9        NA        NA        NA         NA
#> 2         A 0.4781883 0.71636154 19 0.1594836        NA        NA 0.91822046
#> 3         A 0.7647987 0.20624914 15 0.4781883 0.1594836        NA 0.71636154
#> 4         A 0.7696877 0.81691683 20 0.7647987 0.4781883 0.1594836 0.20624914
#> 5         A 0.2685485 0.71585943 14 0.7696877 0.7647987 0.4781883 0.81691683
#> 6         B 0.6730459 0.06062449 14 0.2685485 0.7696877 0.7647987 0.71585943
#> 7         B 0.9787908 0.84710058 17 0.6730459 0.2685485 0.7696877 0.06062449
#> 8         B 0.8463270 0.84676044  8 0.9787908 0.6730459 0.2685485 0.84710058
#> 9         B 0.8566562 0.33261085 16 0.8463270 0.9787908 0.6730459 0.84676044
#> 10        B 0.4451601 0.55965050 16 0.8566562 0.8463270 0.9787908 0.33261085
#> 11        C 0.8382325 0.66946933 12 0.4451601 0.8566562 0.8463270 0.55965050
#> 12        C 0.5833169 0.25463848 18 0.8382325 0.4451601 0.8566562 0.66946933
#> 13        C 0.5109512 0.07917477  5 0.5833169 0.8382325 0.4451601 0.25463848
#> 14        C 0.2601681 0.15996809  6 0.5109512 0.5833169 0.8382325 0.07917477
#> 15        C 0.7494857 0.81639049  6 0.2601681 0.5109512 0.5833169 0.15996809
#>          l2_y       l3_y l1_z l2_z l3_z
#> 1          NA         NA   NA   NA   NA
#> 2          NA         NA    9   NA   NA
#> 3  0.91822046         NA   19    9   NA
#> 4  0.71636154 0.91822046   15   19    9
#> 5  0.20624914 0.71636154   20   15   19
#> 6  0.81691683 0.20624914   14   20   15
#> 7  0.71585943 0.81691683   14   14   20
#> 8  0.06062449 0.71585943   17   14   14
#> 9  0.84710058 0.06062449    8   17   14
#> 10 0.84676044 0.84710058   16    8   17
#> 11 0.33261085 0.84676044   16   16    8
#> 12 0.55965050 0.33261085   12   16   16
#> 13 0.66946933 0.55965050   18   12   16
#> 14 0.25463848 0.66946933    5   18   12
#> 15 0.07917477 0.25463848    6    5   18

log_at(Example, my_vars)
#>    category         x          y  z        ln_x        ln_y     ln_z
#> 1         A 0.1594836 0.91822046  9 -1.83581396 -0.08531777 2.197225
#> 2         A 0.4781883 0.71636154 19 -0.73775063 -0.33357029 2.944439
#> 3         A 0.7647987 0.20624914 15 -0.26814262 -1.57867043 2.708050
#> 4         A 0.7696877 0.81691683 20 -0.26177046 -0.20221798 2.995732
#> 5         A 0.2685485 0.71585943 14 -1.31472376 -0.33427146 2.639057
#> 6         B 0.6730459 0.06062449 14 -0.39594173 -2.80305628 2.639057
#> 7         B 0.9787908 0.84710058 17 -0.02143736 -0.16593584 2.833213
#> 8         B 0.8463270 0.84676044  8 -0.16684950 -0.16633746 2.079442
#> 9         B 0.8566562 0.33261085 16 -0.15471866 -1.10078209 2.772589
#> 10        B 0.4451601 0.55965050 16 -0.80932117 -0.58044280 2.772589
#> 11        C 0.8382325 0.66946933 12 -0.17645973 -0.40126992 2.484907
#> 12        C 0.5833169 0.25463848 18 -0.53902464 -1.36791047 2.890372
#> 13        C 0.5109512 0.07917477  5 -0.67148128 -2.53609759 1.609438
#> 14        C 0.2601681 0.15996809  6 -1.34642717 -1.83278093 1.791759
#> 15        C 0.7494857 0.81639049  6 -0.28836799 -0.20286250 1.791759

log_at(Example, my_vars, plus_1 = TRUE)
#>    category         x          y  z      ln_x       ln_y     ln_z
#> 1         A 0.1594836 0.91822046  9 0.1479748 0.65139791 2.302585
#> 2         A 0.4781883 0.71636154 19 0.3908172 0.54020667 2.995732
#> 3         A 0.7647987 0.20624914 15 0.5680366 0.18751566 2.772589
#> 4         A 0.7696877 0.81691683 20 0.5708031 0.59714102 3.044522
#> 5         A 0.2685485 0.71585943 14 0.2378733 0.53991408 2.708050
#> 6         B 0.6730459 0.06062449 14 0.5146459 0.05885788 2.708050
#> 7         B 0.9787908 0.84710058 17 0.6824859 0.61361716 2.890372
#> 8         B 0.8463270 0.84676044  8 0.6131982 0.61343299 2.197225
#> 9         B 0.8566562 0.33261085 16 0.6187771 0.28714006 2.833213
#> 10        B 0.4451601 0.55965050 16 0.3682201 0.44446176 2.833213
#> 11        C 0.8382325 0.66946933 12 0.6088045 0.51250581 2.564949
#> 12        C 0.5833169 0.25463848 18 0.4595220 0.22684747 2.944439
#> 13        C 0.5109512 0.07917477  5 0.4127394 0.07619665 1.791759
#> 14        C 0.2601681 0.15996809  6 0.2312452 0.14839249 1.945910
#> 15        C 0.7494857 0.81639049  6 0.5593219 0.59685128 1.945910

mean_at(Example, my_vars)
#>    category         x          y  z    mean_x   mean_y mean_z
#> 1         A 0.1594836 0.91822046  9 0.6121894 0.533333     13
#> 2         A 0.4781883 0.71636154 19 0.6121894 0.533333     13
#> 3         A 0.7647987 0.20624914 15 0.6121894 0.533333     13
#> 4         A 0.7696877 0.81691683 20 0.6121894 0.533333     13
#> 5         A 0.2685485 0.71585943 14 0.6121894 0.533333     13
#> 6         B 0.6730459 0.06062449 14 0.6121894 0.533333     13
#> 7         B 0.9787908 0.84710058 17 0.6121894 0.533333     13
#> 8         B 0.8463270 0.84676044  8 0.6121894 0.533333     13
#> 9         B 0.8566562 0.33261085 16 0.6121894 0.533333     13
#> 10        B 0.4451601 0.55965050 16 0.6121894 0.533333     13
#> 11        C 0.8382325 0.66946933 12 0.6121894 0.533333     13
#> 12        C 0.5833169 0.25463848 18 0.6121894 0.533333     13
#> 13        C 0.5109512 0.07917477  5 0.6121894 0.533333     13
#> 14        C 0.2601681 0.15996809  6 0.6121894 0.533333     13
#> 15        C 0.7494857 0.81639049  6 0.6121894 0.533333     13

r1sd_at(Example, my_vars)
#>    category         x          y  z        s_x         s_y        s_z
#> 1         A 0.1594836 0.91822046  9 -1.8112227  1.22348833 -0.7954674
#> 2         A 0.4781883 0.71636154 19 -0.5361226  0.58181493  1.1932011
#> 3         A 0.7647987 0.20624914 15  0.6105718 -1.03974121  0.3977337
#> 4         A 0.7696877 0.81691683 20  0.6301320  0.90146222  1.3920679
#> 5         A 0.2685485 0.71585943 14 -1.3748670  0.58021879  0.1988668
#> 6         B 0.6730459 0.06062449 14  0.2434797 -1.50265592  0.1988668
#> 7         B 0.9787908 0.84710058 17  1.4667290  0.99741097  0.7954674
#> 8         B 0.8463270 0.84676044  8  0.9367569  0.99632970 -0.9943342
#> 9         B 0.8566562 0.33261085 16  0.9780827 -0.63805992  0.5966005
#> 10        B 0.4451601 0.55965050 16 -0.6682645  0.08365854  0.5966005
#> 11        C 0.8382325 0.66946933 12  0.9043720  0.43275298 -0.1988668
#> 12        C 0.5833169 0.25463848 18 -0.1155155 -0.88592015  0.9943342
#> 13        C 0.5109512 0.07917477  5 -0.4050424 -1.44368791 -1.5909348
#> 14        C 0.2601681 0.15996809  6 -1.4083958 -1.18686040 -1.3920679
#> 15        C 0.7494857 0.81639049  6  0.5493064  0.89978905 -1.3920679

r2sd_at(Example, my_vars)
#>    category         x          y  z         z_x         z_y         z_z
#> 1         A 0.1594836 0.91822046  9 -0.90561135  0.61174417 -0.39773369
#> 2         A 0.4781883 0.71636154 19 -0.26806132  0.29090746  0.59660054
#> 3         A 0.7647987 0.20624914 15  0.30528590 -0.51987061  0.19886685
#> 4         A 0.7696877 0.81691683 20  0.31506602  0.45073111  0.69603396
#> 5         A 0.2685485 0.71585943 14 -0.68743350  0.29010940  0.09943342
#> 6         B 0.6730459 0.06062449 14  0.12173984 -0.75132796  0.09943342
#> 7         B 0.9787908 0.84710058 17  0.73336452  0.49870548  0.39773369
#> 8         B 0.8463270 0.84676044  8  0.46837843  0.49816485 -0.49716712
#> 9         B 0.8566562 0.33261085 16  0.48904135 -0.31902996  0.29830027
#> 10        B 0.4451601 0.55965050 16 -0.33413225  0.04182927  0.29830027
#> 11        C 0.8382325 0.66946933 12  0.45218599  0.21637649 -0.09943342
#> 12        C 0.5833169 0.25463848 18 -0.05775774 -0.44296007  0.49716712
#> 13        C 0.5109512 0.07917477  5 -0.20252121 -0.72184395 -0.79546739
#> 14        C 0.2601681 0.15996809  6 -0.70419791 -0.59343020 -0.69603396
#> 15        C 0.7494857 0.81639049  6  0.27465322  0.44989453 -0.69603396
```
