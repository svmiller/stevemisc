#' Lazily select variables from multiple tables in a relational database
#'
#' @description \code{db_lselect} allows you to select variables from multiple
#'  tables in an SQL database. It returns a lazy query that combines all the
#'  variables together into one data frame (as a \code{tibble}). The user can
#'  choose to run \code{collect()} after this query if they see fit.
#'
#' @details This is a wrapper function in which \code{purrr} and \code{dplyr}
#' are doing the heavy lifting. The tables in the database are declared as a
#' character (or character vector). The variables to select are also declared
#' as a character (or character vector), which are then wrapped in a
#' \code{one_of()} function within \code{select()} in \code{dplyr}.
#'
#' @param data a character vector of the tables in a relational database
#' @param connection the name of the connection object
#' @param vars the variables (entered as class "character") to select from the tables in the database
#' @return Assuming a particular structure to the database, the function returns a
#'  combined table including all the requested variables from all the tables listed
#'  in the \code{data} character vector. The returned table will have other attributes
#'  inherited from how \code{dplyr} interfaces with SQL, allowing the user to extract
#'  some information about the query (e.g. through \code{show_query()}).
#'
#' @references Miller, Steven V. 2020. "Clever Uses of Relational (SQL) Databases to Store Your Wider Data (with Some Assistance from \code{dplyr} and \code{purrr})" \url{http://svmiller.com/blog/2020/11/smarter-ways-to-store-your-wide-data-with-sql-magic-purrr/}
#'
#'
db_lselect <- function(data, connection, vars) {
  return(data %>%
           map(~{
             tbl(connection, .x) %>%
               select(one_of(vars))


           }) %>%
           reduce(function(x, y) union(x, y)))
}
