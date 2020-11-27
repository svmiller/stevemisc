#' Lazily select variables from multiple tables in a relational database
#'
#' @description \code{sum} returns the sum of all the values present in its arguments.
#'
#' @details This is a generic function: methods can be defined for it directly
#' or via the \code{\link{Summary}} group generic. For this to work properly,
#' the arguments \code{...} should be unnamed, and dispatch is on the
#' first argument.
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
