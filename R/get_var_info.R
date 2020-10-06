get_var_info <- function(x) {
    require(labelled)
    require(tibble)
    b <- labelled::var_label(x)
    c <- data.frame(r = unique(data.frame(labelled::val_labels(x))))
    c <- tibble::rownames_to_column(c, "label")
    names(c) <- c("label", "numeric")
    tribs <- tibble::tribble(~label, ~numeric, b, NA, NA, NA)
    tribs[is.na(tribs)] <- ""
    tribs$numeric <- as.numeric(tribs$numeric)
    info <- as.data.frame(rbind(tribs, c))
    info[is.na(info)] <- ""
    print(info, row.names = F)
}
