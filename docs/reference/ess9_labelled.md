# Some Labeled Data in the European Social Survey (Round 9)

These are data to illustrate labeled data and how to process them with
[`get_var_info()`](http://svmiller.com/reference/get_var_info.md) in
this package.

## Usage

``` r
ess9_labelled
```

## Format

A data frame with 109 observations on the following 4 variables.

- `essround`:

  a numeric constant

- `edition`:

  another numeric constant

- `cntry`:

  a character vector (with label) for the country in the data

- `netusoft`:

  a numeric vector (with label) for self-reported internet consumption
  of a respondent

## Details

Data are condensed summaries from the raw data. They amount to every
unique combination of country and self-reported internet consumption.
The data are here to illustrate the
[`get_var_info()`](http://svmiller.com/reference/get_var_info.md)
function in this package.
