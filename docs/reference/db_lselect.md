# Lazily select variables from multiple tables in a relational database

`db_lselect()` allows you to select variables from multiple tables in an
SQL database. It returns a lazy query that combines all the variables
together into one data frame (as a `tibble`). The user can choose to run
`collect()` after this query if they see fit.

## Usage

``` r
db_lselect(.data, connection, vars)
```

## Arguments

- .data:

  a character vector of the tables in a relational database

- connection:

  the name of the connection object

- vars:

  the variables (entered as class "character") to select from the tables
  in the database

## Value

Assuming a particular structure to the database, the function returns a
combined table including all the requested variables from all the tables
listed in the `data` character vector. The returned table will have
other attributes inherited from how dplyr interfaces with SQL, allowing
the user to extract some information about the query (e.g. through
[`show_query()`](https://dplyr.tidyverse.org/reference/explain.html)).

## Details

This is a wrapper function in which purrr and dplyr are doing the heavy
lifting. The tables in the database are declared as a character (or
character vector). The variables to select are also declared as a
character (or character vector), which are then wrapped in a
[`one_of()`](https://tidyselect.r-lib.org/reference/one_of.html)
function within
[`select()`](https://dplyr.tidyverse.org/reference/select.html) in
dplyr.

## References

Miller, Steven V. 2020. "Clever Uses of Relational (SQL) Databases to
Store Your Wider Data (with Some Assistance from `dplyr` and `purrr`)"
<https://svmiller.com/blog/2020/11/smarter-ways-to-store-your-wide-data-with-sql-magic-purrr/>

## Examples

``` r

# \donttest{
library(DBI)
library(RSQLite)
library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following object is masked from ‘package:stevemisc’:
#> 
#>     tbl_df
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union
library(dbplyr)
#> 
#> Attaching package: ‘dbplyr’
#> The following objects are masked from ‘package:dplyr’:
#> 
#>     ident, sql
set.seed(8675309)

A <- data.frame(uid = c(1:10),
                a = rnorm(10),
                b = sample(letters, 10),
                c = rbinom(10, 1, .5))

B <- data.frame(uid = c(11:20),
                a = rnorm(10),
                b = sample(letters, 10),
                c = rbinom(10, 1, .5))

C <- data.frame(uid = c(21:30), a = rnorm(10),
                b = sample(letters, 10),
                c = rbinom(10, 1, .5),
                d = rnorm(10))

con <- dbConnect(SQLite(), ":memory:")

copy_to(con, A, "A",
        temporary=FALSE)

copy_to(con, B, "B",
        temporary=FALSE)

copy_to(con, C, "C",
        temporary=FALSE)

# This returns no warning because columns "a" and "b" are in all tables
c("A", "B", "C") %>% db_lselect(con, c("uid", "a", "b"))
#> # Source:   SQL [?? x 3]
#> # Database: sqlite 3.53.1 [:memory:]
#>      uid       a b    
#>    <int>   <dbl> <chr>
#>  1     1 -0.997  f    
#>  2     2  0.722  z    
#>  3     3 -0.617  y    
#>  4     4  2.03   x    
#>  5     5  1.07   c    
#>  6     6  0.987  p    
#>  7     7  0.0275 e    
#>  8     8  0.673  i    
#>  9     9  0.572  o    
#> 10    10  0.904  n    
#> # ℹ more rows

# This returns two warnings because column "d" is not in 2 of 3 tables.
# ^ this is by design. It'll inform the user about data availability.
c("A", "B", "C") %>% db_lselect(con, c("uid", "a", "b", "d"))
#> Warning: Unknown columns: `d`
#> Warning: Unknown columns: `d`
#> # Source:   SQL [?? x 4]
#> # Database: sqlite 3.53.1 [:memory:]
#>      uid       a b         d
#>    <int>   <dbl> <chr> <dbl>
#>  1     1 -0.997  f        NA
#>  2     2  0.722  z        NA
#>  3     3 -0.617  y        NA
#>  4     4  2.03   x        NA
#>  5     5  1.07   c        NA
#>  6     6  0.987  p        NA
#>  7     7  0.0275 e        NA
#>  8     8  0.673  i        NA
#>  9     9  0.572  o        NA
#> 10    10  0.904  n        NA
#> # ℹ more rows
dbDisconnect(con)
# }
```
