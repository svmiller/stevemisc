get_var_info <- function(x) {
    # It should be obvious this will require labelled and tidyverse
    b <- labelled::var_label(x)
    c <- data.frame(r = unique(data.frame(labelled::val_labels(x))))
    c <- rownames_to_column(c, "label")
    names(c) <- c("label", "numeric")
    tribs <- tibble::tribble(~label, ~numeric, b, NA, NA, NA)
    tribs[is.na(tribs)] <- ""
    tribs$numeric <- as.numeric(tribs$numeric)
    info <- as.data.frame(rbind(tribs, c))
    info[is.na(info)] <- ""
    print(info, row.names = F)
}
