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
#>   [1] "15.95%" "47.82%" "76.48%" "76.97%" "26.85%" "67.3%"  "97.88%" "84.63%"
#>   [9] "85.67%" "44.52%" "83.82%" "58.33%" "51.1%"  "26.02%" "74.95%" "91.82%"
#>  [17] "71.64%" "20.62%" "81.69%" "71.59%" "6.06%"  "84.71%" "84.68%" "33.26%"
#>  [25] "55.97%" "66.95%" "25.46%" "7.92%"  "16%"    "81.64%" "97.57%" "84.21%"
#>  [33] "32.93%" "59.26%" "18.39%" "45.15%" "44.02%" "35.81%" "20.39%" "72.15%"
#>  [41] "97.65%" "94.42%" "51.75%" "84.29%" "34.3%"  "3.89%"  "31.81%" "13.59%"
#>  [49] "33.91%" "76.23%" "75.28%" "43.36%" "75.5%"  "40.68%" "70.32%" "31.16%"
#>  [57] "42.62%" "22.76%" "64.91%" "14.96%" "64.66%" "27.46%" "87.57%" "79.56%"
#>  [65] "94.24%" "78.67%" "72.19%" "86.53%" "26.93%" "0.19%"  "40.95%" "74.39%"
#>  [73] "52.55%" "86.38%" "37.7%"  "82.4%"  "40.19%" "37.85%" "43.89%" "43.71%"
#>  [81] "26.26%" "44.05%" "49.85%" "85.97%" "51.82%" "11.51%" "75.3%"  "16.19%"
#>  [89] "40.05%" "18.23%" "44%"    "74.73%" "19.08%" "95.5%"  "2.4%"   "23.09%"
#>  [97] "59.39%" "23.55%" "51.44%" "64.3%" 
```
