#' Convert Number (Integer) to Word
#'
#' @description
#'
#' \code{n2w()} is a convenience function that converts a positive number (and
#' one assumes an integer) to an English word or set of words.
#'
#' @details
#'
#' \code{n2w()} assumes but does not compel the use of integers. Positive reals
#' are rounded down to the nearest integer.
#'
#' The function issues a stop in cases where the number provided is negative or
#' a decimal value between 0 (with precision) and 1. Returns of 0 and infinity
#' are still valid.
#'
#' This function has been passed from multiple sources, including John Fox,
#' Andy Teucher, and an "AJH." I copied it from Jason Miller (no relation) and
#' made some minor edits to it.
#'
#' @author John Fox, Andy Teucher, "AJH", Jason Miller, Steven V. Miller
#'
#' @param x a number (one assumes: an integer)

#' @return
#'
#' \code{n2w()} takes a number (one assumes: an integer) and returns that number
#' as an English word (or set of words).
#'
#' @examples
#'
#' n2w(3)
#' n2w(13)
#' n2w(30)
#' n2w(8675309)

n2w <- function(x){
  ## Function by John Fox found here:
  ## http://tolstoy.newcastle.edu.au/R/help/05/04/2715.html
  ## Tweaks by AJH to add commas and "and"
  # taken from: https://gist.githubusercontent.com/hack-r/22104543e2151519c41a8f0ce042b31c/raw/01731f3176b4ee471785639533d38eda4790ab77/numbers2words.r
  if(x < 1 && x != 0) {
    stop("This function issues a stop in cases where the number provided is negative or a decimal value between 0 (with absolute precision) and 1.")
  }
  if(x == 0){
    ret <- "zero"
  } else if(x == Inf){
    ret <- "infinity"
    } else {
    helper <- function(x){

      digits <- rev(strsplit(as.character(x), "")[[1]])
      nDigits <- length(digits)
      if (nDigits == 1) as.vector(ones[digits])
      else if (nDigits == 2)
        if (x <= 19) as.vector(teens[digits[1]])
      else trim(paste(tens[digits[2]],
                      Recall(as.numeric(digits[1]))))
      else if (nDigits == 3) trim(paste(ones[digits[3]], "hundred and",
                                        Recall(makeNumber(digits[2:1]))))
      else {
        nSuffix <- ((nDigits + 2) %/% 3) - 1
        if (nSuffix > length(suffixes)) stop(paste(x, "is too large!"))
        trim(paste(Recall(makeNumber(digits[
          nDigits:(3*nSuffix + 1)])),
          suffixes[nSuffix],"," ,
          Recall(makeNumber(digits[(3*nSuffix):1]))))
      }
    }
    trim <- function(text){
      #Tidy leading/trailing whitespace, space before comma
      text=gsub("^\ ", "", gsub("\ *$", "", gsub("\ ,",",",text)))
      #Clear any trailing " and"
      text=gsub(" and$","",text)
      #Clear any trailing comma
      gsub("\ *,$","",text)
    }
    makeNumber <- function(...) as.numeric(paste(..., collapse=""))
    #Disable scientific notation
    opts <- options(scipen=100)
    on.exit(options(opts))
    ones <- c("", "one", "two", "three", "four", "five", "six", "seven",
              "eight", "nine")
    names(ones) <- 0:9
    teens <- c("ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen",
               "sixteen", " seventeen", "eighteen", "nineteen")
    names(teens) <- 0:9
    tens <- c("twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty",
              "ninety")
    names(tens) <- 2:9
    ret <- round(x)
    suffixes <- c("thousand", "million", "billion", "trillion")
    if (length(ret) > 1) return(trim(sapply(x, helper)))
    ret <- helper(ret)


  }

  return(ret)
}

