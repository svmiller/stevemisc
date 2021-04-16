#' Create multivariate data by permutation
#'
#' @description \code{corvectors()} is a function to obtain a multivariate dataset by specifying
#' the relation between those specified variables.
#'
#' @name corvectors
#'
#' @param data a data matrix containing the data
#' @param corm A value containing the desired correlation or a vector or data matrix containing the desired correlations
#' @param tol A single value or a vector of tolerances with length \code{ncol(data) - 1}. The default is 0.005
#' @param conv The maximum iterations allowed. Defaults to 1000.
#' @param cores The number of cores to be used for parallel computing
#' @param splitsize The size to use for splitting the data
#' @param verbose Logical statement. Default is FALSE
#' @param seed An optional seed to set
#'
#' @return \code{corvectors()} returns a matrix given the specified multivariate relation.
#'
#' @author Pascal van Kooten and Gerko Vink
#'
#' @details This is liberally copy-pasted from van Kooten and Vink's wonderful-but-no-longer-supported \pkg{correlate} package.
#' They call it \code{correlate()} in their package, but I opt for \code{corvectors()} here.
#'
#' @examples
#'
#' \donttest{
#' set.seed(8675309)
#' library(tibble)
#' # bivariate example, start with zero correlation
#' as_tibble(data.frame(corvectors(replicate(2, rnorm(100)), .5)))
#'
#' # multivariate example
#'
#' as_tibble(data.frame(corvectors(replicate(4, rnorm(100)), c(.5, .6, .7))))
#'
#' }
#'
#' @export
#'

corvectors <- function(data, corm, tol = 0.005,
                       conv = 10000, cores = 2,
                       splitsize = 1000, verbose = FALSE, seed) {
    if (is.vector(corm)) {
        corm <- .create_cor_matrix(data, corm)
    }
    if (is.vector(tol)) {
        tol <- .create_tol_matrix(data, tol)
    }

    # identifiers of the direction; e.g. from 0.3 to 0.5
    bool1 <- cor(data) - corm < 0
    bool2 <- abs(corm) > cor(data)

    # Step 1: roughly
    data <- .rough_cor(data, corm, tol, conv, cores, 25 * ncol(corm), verbose)

    # Step 2: until the end.
    while (!all(ifelse(bool1, corm < cor(data), cor(data) < corm)[tol != 1],
                ifelse(bool1, ifelse(bool2,
        cor(data) < corm + tol, cor(data) < corm - tol),
        ifelse(bool2, corm - tol < cor(data), corm -
        tol < cor(data)))[tol != 1])) {

        data <- data[sample(nrow(data), nrow(data)), ]

        ldata <- .cor_split(data, splitsize)

        splits <- length(ldata)

        if (cores > 1 && splits > 1) {
            if (Sys.info()["sysname"] == "Windows") {
                cl <- makeCluster(cores)
                temp <- parLapply(cl, ldata, function(x) .cor_permute(x, corm, tol,
                  bool1, bool2))
                stopCluster(cl = cl)
            } else {
                temp <- mclapply(ldata, function(x) .cor_permute(x, corm, tol, bool1,
                  bool2), mc.cores = cores)
            }
        } else {
            temp <- lapply(ldata, function(x) .cor_permute(x, corm, tol, bool1, bool2))
        }
        data <- do.call(rbind, temp)
        splitsize <- splitsize * 4
    }
    if (verbose) {
        print(cor(data))
    }
    return(data)
}

#' @keywords internal
#' @export

.cor_permute <- function(data, corm, tol, bool1, bool2) {
    on.exit(return(data))
    for (row in 1:c(nrow(corm) - 1)) {
        row <- row + 1
        cells <- which(tol[row, 1:row] != 1)
        no_change <- 0
        while (!all(ifelse(bool1, corm < cor(data), cor(data) < corm)[row, cells],
                    ifelse(bool1, ifelse(bool2,
            cor(data) < corm + tol, cor(data) < corm - tol),
            ifelse(bool2, corm - tol < cor(data), corm -
            tol < cor(data)))[row, cells])) {

            index <- sample(nrow(data), 1)

            random_index <- unique(c(index, sample(nrow(data), 10)))[1:10]
            cor_proposals <- matrix(1, nrow = length(random_index), ncol = length(cells))
            for (j in 1:length(random_index)) {
                switcher <- data[, 1:row]
                switcher[c(index, random_index[j]), row] <- switcher[c(random_index[j], index), row]
                cor_proposals[j, ] <- cor(switcher[, 1:row])[row, cells]
            }
            tokeep <- which(colSums(abs(t(cor_proposals) - corm[row, cells]) - tol[row, cells]) == min(colSums(abs(t(cor_proposals) -
                corm[row, cells]) - tol[row, cells])))[1]
            # Do the switch for real.
            oldcor <- cor(data)
            data[c(index, random_index[tokeep]), row] <- data[c(random_index[tokeep], index), row]

            newcor <- cor(data)
            ifelse(all(oldcor == newcor), no_change <- no_change + 1, no_change <- 0)
            if (no_change == 3) {
                break
            }
        }
    }
}

#' @keywords internal
#' @export

.rough_cor <- function(data, corm, tol, conv, cores, splitsize, verbose) {
    if (splitsize <= nrow(data)) {
        if (cores > 1 & requireNamespace("parallel", quietly = TRUE)) {
            if (Sys.info()["sysname"] == "Windows") {
                cl <- makeCluster(cores)
                ldata <- .cor_split(data, splitsize = splitsize)
                temp <- parLapply(cl, ldata, function(x) .rough_cor_permute(x, corm,
                  tol, conv, verbose))
                stopCluster(cl = cl)
            } else {
                temp <- mclapply(.cor_split(data, splitsize = splitsize), function(x) .rough_cor_permute(x,
                  corm, tol, conv, verbose), mc.cores = cores)
            }
        } else {
            temp <- lapply(.cor_split(data, splitsize = splitsize), function(x) .rough_cor_permute(x,
                corm, tol, conv, verbose))
        }
        return(do.call(rbind, temp))
    }
    .rough_cor_permute(data, corm, tol, conv, verbose)
}

#' @keywords internal
#' @export

.rough_cor_permute <- function(data, corm, tol, conv, verbose) {
    on.exit(return(data))
    for (row in 1:c(nrow(corm) - 1)) {
        track_iter <- 0  # track iterations
        row <- row + 1
        cells <- which(tol[row, 1:row] != 1)
        while (sum(abs(cor(data) - corm)[row, cells] - tol[row, cells] < 0) < length(cells)) {
          track_iter <- track_iter + 1

            index <- sample(nrow(data), 1)
            random_index <- unique(c(index, sample(nrow(data), 10)))[1:10]
            cor_proposals <- matrix(1, nrow = length(random_index), ncol = length(cells))

            for (j in 1:length(random_index)) {
                switcher <- data[, 1:row]
                switcher[c(index, random_index[j]), row] <- switcher[c(random_index[j], index), row]

                cor_proposals[j, ] <- cor(switcher[, 1:row])[row, cells]
            }
            tokeep <- which(colSums(abs(t(cor_proposals) - corm[row, cells]) - tol[row, cells]) == min(colSums(abs(t(cor_proposals) -
                corm[row, cells]) - tol[row, cells])))[1]

            ## Do the switch for real.
            data[c(index, random_index[tokeep]), row] <- data[c(random_index[tokeep], index), row]

            if (track_iter == conv) {
                if (verbose == TRUE) {
                  warning(paste0("no convergence in row ", row))
                }
                return(data)
            }
        }
    }
}

#' @keywords internal
#' @export

.cor_split <- function(data, splitsize = 1000) {
    nr <- nrow(data)
    if (splitsize > nr) {
        splitsize <- nr
    }
    splits <- floor(nr / splitsize)
    list <- lapply(split(data[seq_len(splits * splitsize), ], seq_len(splits)), function(x) matrix(x,
        splitsize))
    if (nr %% splitsize != 0) {
        list$last <- data[(splits * splitsize + 1):nr, ]
    }
    list
}

#' @keywords internal
#' @export

.create_cor_matrix <- function(data, corm) {
    cor_mat <- matrix(0, nrow = dim(data)[2], ncol = dim(data)[2])
    diag(cor_mat) <- 1
    cor_mat[1, -1] <- corm
    cor_mat[-1, 1] <- corm
    return(cor_mat)
}


#' @keywords internal
#' @export

.create_tol_matrix <- function(data, tol) {
    holder <- matrix(1, nrow = dim(data)[2], ncol = dim(data)[2])
    holder[-1, 1] <- tol
    return(holder)
}
