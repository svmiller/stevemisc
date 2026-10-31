# Make Percentage Label for Proportion and Add Percentage Sign

`make_perclab()` takes a proportion, multiplies it by 100, optionally
rounds it, and pastes a percentage sign next to it.

## Usage

``` r
make_perclab(x, d = 2)
```

## Arguments

- x:

  a numeric vector

- d:

  digits to round. Defaults to 2.

## Value

The function takes a proportion, multiplies it by 100, (optionally)
rounds it to a set decimal point, and pastes a percentage sign next to
it.

## Details

This function is useful if you're modeling proportions in something like
a bar chart (for which proportions are more flexible) but want to label
each bar as a percentage. The function here is mostly cosmetic.

## Examples

``` r

x <- runif(100)
make_perclab(x)
#>   [1] "75.24%" "45.35%" "77.13%" "57.3%"  "77.59%" "29.98%" "9.86%"  "99.95%"
#>   [9] "15.67%" "27.24%" "2.83%"  "6.82%"  "82.42%" "43.63%" "97.92%" "89.35%"
#>  [17] "30.3%"  "61.57%" "11.79%" "89.68%" "2.72%"  "88.16%" "65.15%" "63.71%"
#>  [25] "55.56%" "32.27%" "57.69%" "58.55%" "5.53%"  "71.57%" "19.19%" "44.3%" 
#>  [33] "69.23%" "46.47%" "52.02%" "93.14%" "80.54%" "24.89%" "17.06%" "69.11%"
#>  [41] "63.52%" "64.45%" "60.71%" "76.07%" "94.98%" "95.01%" "96.53%" "25.25%"
#>  [49] "10.38%" "84.39%" "97.31%" "39.16%" "5.38%"  "90.49%" "91.75%" "63.36%"
#>  [57] "98%"    "57.58%" "19.3%"  "31.22%" "91.27%" "67.21%" "47.51%" "85.63%"
#>  [65] "9.53%"  "94.72%" "81.05%" "16.39%" "45.01%" "98.94%" "65.98%" "34.86%"
#>  [73] "89.63%" "80.46%" "96.9%"  "94.92%" "14.74%" "28.64%" "47.93%" "84.33%"
#>  [81] "23.12%" "5.78%"  "34.44%" "23.24%" "18.99%" "16.18%" "26.48%" "7.25%" 
#>  [89] "19.95%" "71.44%" "24.48%" "72.1%"  "68.03%" "70.1%"  "25.67%" "95.91%"
#>  [97] "63.94%" "52.83%" "70.67%" "81.28%"
```
