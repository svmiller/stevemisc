# Scale a vector (or vectors) by two standard deviations

`r2sd` allows you to rescale a numeric vector such that the ensuing
output has a mean of 0 and a standard deviation of .5. `r2sd_at` is a
wrapper for `mutate_at` and `rename_at` from dplyr. It both rescales the
supplied vectors to new vectors and renames the vectors to each have a
prefix of `z_`.

## Usage

``` r
r2sd(x, na = TRUE)
```

## Arguments

- x:

  a vector, likely in your data frame

- na:

  what to do with NAs in the vector. Defaults to TRUE (i.e. passes over
  the missing observations)

## Value

The function returns a numeric vector rescaled with a mean of 0 and a
standard deviation of .5.

## Details

By default, `na.rm` is set to TRUE. If you have missing data, the
function will just pass over them.

Gelman (2008) argues that rescaling by two standard deviations puts
regression inputs on roughly the same scale no matter their original
scale. This allows for some honest, if preliminary, assessment of
relative effect sizes from the regression output. This does that, but
without requiring the `rescale` function from arm. I'm trying to reduce
the packages on which my workflow relies.

Importantly, I tend to rescale only the ordinal and interval inputs and
leave the binary inputs as 0/1. So, my `r2sd` function doesn't have any
of the fancier if-else statements that Gelman's `rescale` function has.

## References

Gelman, Andrew. 2008. "Scaling Regression Inputs by Dividing by Two
Standard Deviations." *Statistics in Medicine* 27: 2865–2873.

## Examples

``` r

x <- rnorm(100)
r2sd(x)
#>   [1]  0.58938435  0.18197583  0.58039130  0.91074730  0.01668217 -0.18478770
#>   [7] -0.01962033 -0.42179684  0.36908293  0.06542483 -0.88627356  0.28892837
#>  [13] -0.98614536  0.50553860 -0.51143024 -0.23288148  0.31638425 -0.16144326
#>  [19] -0.07254027  1.07923937  1.02523837  0.21173516  0.01595284  0.21346861
#>  [25] -0.36107322 -0.05857578 -1.27614690 -0.35787795 -0.22397223  0.15244818
#>  [31] -0.23264380  0.95027701 -0.03677793 -0.54346030  0.43066237 -0.39212414
#>  [37] -0.58999446  0.58785329 -0.08272961 -0.05357957  0.17797965  0.60034952
#>  [43] -0.25598906  0.04699418  0.15419367  0.58142698  0.74035987  0.56813722
#>  [49] -0.09961741  0.03155173  0.36507027  0.24989286  0.13771068 -0.08150362
#>  [55]  0.40591857 -0.22073909  1.06251295 -0.14558226 -0.53391304 -0.61590666
#>  [61]  0.03739685  0.00918478 -0.24785673 -0.34481666  0.39803186 -1.28439892
#>  [67]  0.42355915 -0.14919976  0.53538693  0.43795067  0.25980651  0.23653250
#>  [73] -0.31081525 -0.53525793 -0.02476267  0.27148311 -1.27299036 -0.55505474
#>  [79] -0.67254477 -0.12399040 -1.14078240 -0.22691123 -0.64409311  0.43743081
#>  [85]  0.15814365 -0.09573691 -0.19889374 -0.21807596  0.06221853  0.08736401
#>  [91]  0.59476649 -0.18209050  0.70475613  0.33387888  0.25281224 -0.22382176
#>  [97]  0.29469543  0.21196985 -0.64322852 -0.62643329

r2sd_at(mtcars, c("mpg", "hp", "disp"))
#>                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
#> Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
#> Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
#> Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
#> Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
#> Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
#> Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
#> Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
#> Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
#> Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
#> Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
#> Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
#> Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
#> Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
#> Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
#> Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
#> Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
#> Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
#> Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
#> Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
#> Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
#> Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
#> Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
#> AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
#> Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
#> Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
#> Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
#> Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
#> Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
#> Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
#> Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
#> Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
#> Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
#>                           z_mpg        z_hp      z_disp
#> Mazda RX4            0.07544241 -0.26754642 -0.28530991
#> Mazda RX4 Wag        0.07544241 -0.26754642 -0.28530991
#> Datsun 710           0.22477172 -0.39152023 -0.49509105
#> Hornet 4 Drive       0.10862670 -0.26754642  0.11004685
#> Hornet Sportabout   -0.11536726  0.20647109  0.52154061
#> Valiant             -0.16514370 -0.30400931 -0.02308349
#> Duster 360          -0.48039447  0.71695148  0.52154061
#> Merc 240D            0.35750889 -0.61759012 -0.33896547
#> Merc 230             0.22477172 -0.37693508 -0.36276756
#> Merc 280            -0.07388690 -0.17274292 -0.25464959
#> Merc 280C           -0.19003192 -0.17274292 -0.25464959
#> Merc 450SE          -0.30617694  0.24293397  0.18185654
#> Merc 450SL          -0.23151228  0.24293397  0.18185654
#> Merc 450SLC         -0.40572981  0.24293397  0.18185654
#> Cadillac Fleetwood  -0.80394131  0.42524840  0.97337691
#> Lincoln Continental -0.80394131  0.49817417  0.92496588
#> Chrysler Imperial   -0.44721018  0.60756282  0.84428082
#> Fiat 128             1.02119472 -0.58841981 -0.61329465
#> Honda Civic          0.85527326 -0.69051589 -0.62539740
#> Toyota Corolla       1.14563581 -0.59571239 -0.64395497
#> Toyota Corona        0.11692278 -0.36234992 -0.44627659
#> Dodge Challenger    -0.38084159  0.02415666  0.35210200
#> AMC Javelin         -0.40572981  0.02415666  0.29562247
#> Camaro Z28          -0.56335520  0.71695148  0.48119809
#> Pontiac Firebird    -0.07388690  0.20647109  0.68291072
#> Fiat X1-9            0.59809500 -0.58841981 -0.61208437
#> Porsche 914-2        0.49024605 -0.40610538 -0.44546974
#> Lotus Europa         0.85527326 -0.24566869 -0.54713290
#> Ford Pantera L      -0.35595337  0.85551044  0.48523234
#> Ferrari Dino        -0.03240653  0.20647109 -0.34582370
#> Maserati Bora       -0.42232196  1.37328341  0.28351971
#> Volvo 142E           0.10862670 -0.27483900 -0.44264576
```
