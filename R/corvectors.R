corvectors <-
  function(data, corm, tol=0.005, conv=10000, cores=2,
           splitsize=1000, verbose=T, seed) {
    if (is.vector(corm)) {
      corm <- createCorMatrix(data, corm)
    }
    if (is.vector(tol)) {
      tol <- createTolMatrix(data, tol)
    }

    # identifiers of the direction; e.g. from 0.3 to 0.5
    bool1 <- cor(data) - corm < 0
    bool2 <- abs(corm) > cor(data)

    # Step 1: roughly
    data <- correlate.roughly(data, corm, tol, conv, cores, 25 * ncol(corm), verbose)

    # Step 2: until the end.
    while(!all(
      ifelse(bool1, corm < cor(data), cor(data) < corm)[tol != 1],
      ifelse(bool1, ifelse(bool2, cor(data) < corm + tol, cor(data) < corm - tol),
             ifelse(bool2, corm - tol < cor(data),
                    corm - tol < cor(data)))[tol != 1])) {

      data <- data[sample(nrow(data), nrow(data)), ]

      ldata <- correlate.split(data, splitsize)

      splits <- length(ldata)

      if (cores > 1 && splits > 1) {
        if (Sys.info()["sysname"] == "Windows") {
          cl <- parallel::makeCluster(cores)
          temp <- parallel::parLapply(cl, ldata, function(x)
            correlate.permutate(x, corm, tol, bool1, bool2))
          parallel::stopCluster(cl = cl)
        } else {
          temp <- parallel::mclapply(ldata, function(x)
            correlate.permutate(x, corm, tol, bool1, bool2),
            mc.cores=cores)
        }
      } else {
        temp <- lapply(ldata, function(x)
          correlate.permutate(x, corm, tol, bool1, bool2))
      }
      data <- do.call(rbind, temp)
      splitsize <- splitsize * 4
    }
    if (verbose) {print(cor(data)) }
    return(data)
  }

correlate.permutate <-
  function(data, corm, tol, bool1, bool2) {
    on.exit(return(data))
    for (row in 1:c(nrow(corm)-1)) {
      row <- row + 1
      cells <- which(tol[row, 1:row] != 1)
      no.change <- 0
      while (!all(
        ifelse(bool1, corm < cor(data), cor(data) < corm)[row, cells],
        ifelse(bool1, ifelse(bool2, cor(data) < corm + tol,
                             cor(data) < corm - tol),
               ifelse(bool2, corm - tol < cor(data),
                      corm - tol < cor(data)))[row, cells])) {

        index <- sample(nrow(data), 1)

        random.index <- unique(c(index, sample(nrow(data), 10)))[1:10]
        cor.proposals <- matrix(1, nrow=length(random.index),
                                ncol = length(cells))
        for (j in 1:length(random.index)) {
          switcher <- data[ , 1:row]
          switcher[c(index, random.index[j]), row] <- switcher[c(random.index[j],
                                                                 index), row]
          cor.proposals[j, ] <- cor(switcher[ , 1:row])[row, cells]
        }
        tokeep <- which(
          colSums(abs(t(cor.proposals) - corm[row, cells]) - tol[row,cells])
          == min(colSums(abs(t(cor.proposals) - corm[row, cells]) - tol[row, cells])))[1]
        # Do the switch for real.
        oldcor <- cor(data)
        data[c(index, random.index[tokeep]), row] <- data[c(random.index[tokeep], index), row]

        newcor <- cor(data)
        ifelse(all(oldcor == newcor), no.change <- no.change + 1, no.change <- 0)
        if (no.change == 3) { break }
      }
    }
  }


correlate.roughly <-
  function(data, corm, tol, conv, cores, splitsize, verbose) {
    if (splitsize <= nrow(data)) {
      if (cores > 1 & require(parallel)) {
        if (Sys.info()["sysname"] == "Windows") {
          cl <- parallel::makeCluster(cores)
          ldata <- correlate.split(data, splitsize=splitsize)
          temp <- parallel::parLapply(cl, ldata, function(x)
            correlate.roughly.permutate(x, corm, tol, conv, verbose))
          parallel::stopCluster(cl = cl)
        } else {
          temp <- parallel::mclapply(correlate.split(data, splitsize=splitsize), function(x)
            correlate.roughly.permutate(x, corm, tol, conv, verbose),
            mc.cores=cores)
        }
      } else {
        temp <- lapply(correlate.split(data, splitsize=splitsize), function(x)
          correlate.roughly.permutate(x, corm, tol, conv, verbose))
      }
      return(do.call(rbind, temp))
    }
    correlate.roughly.permutate(data, corm, tol, conv, verbose)
  }



correlate.roughly.permutate <-
  function(data, corm, tol, conv, verbose) {
    on.exit(return(data))
    for (row in 1:c(nrow(corm)-1)) {
      I <- 0  # track iterations
      row <- row + 1
      cells <- which(tol[row, 1:row] != 1)
      while (sum(abs(cor(data) - corm)[row, cells] - tol[row, cells] < 0) < length(cells))  {
        I <- I + 1

        index <- sample(nrow(data), 1)
        random.index <- unique(c(index, sample(nrow(data), 10)))[1:10]
        cor.proposals <- matrix(1, nrow=length(random.index), ncol = length(cells))

        for (j in 1:length(random.index)) {
          switcher <- data[ , 1:row]
          switcher[c(index, random.index[j]), row] <- switcher[c(random.index[j], index), row]

          cor.proposals[j, ] <- cor(switcher[ , 1:row])[row, cells]
        }
        tokeep <- which(
          colSums(abs(t(cor.proposals) - corm[row, cells]) - tol[row,cells])
          == min(colSums(abs(t(cor.proposals) - corm[row,cells ]) - tol[row, cells])))[1]

        ## Do the switch for real.
        data[c(index, random.index[tokeep]), row] <- data[c(random.index[tokeep], index), row]

        if (I == conv) {
          if (verbose == TRUE) { warning(paste0("no convergence in row ", row)) }
          return(data)
        }
      }
    }
  }



correlate.split <-
  function(data, splitsize=1000) {
    nr <- nrow(data)
    if (splitsize > nr) {
      splitsize <- nr
    }
    splits <- floor(nr / splitsize)
    list <- lapply(split(data[seq_len(splits*splitsize), ],
                         seq_len(splits)), function(x) matrix(x, splitsize))
    if (nr %% splitsize != 0) {
      list$last <- data[(splits * splitsize + 1):nr, ]
    }
    list
  }


createCorMatrix <-
  function(data, corm) {
    CorMatrix <- matrix(0, nrow = dim(data)[2], ncol = dim(data)[2])
    diag(CorMatrix) <- 1
    CorMatrix[1,-1] <- corm
    CorMatrix[-1,1] <- corm
    return(CorMatrix)
  }


createTolMatrix <-
  function(data, tol) {
    holder <- matrix(1, nrow = dim(data)[2], ncol = dim(data)[2])
    holder[-1 ,1] <- tol
    return(holder)
  }
