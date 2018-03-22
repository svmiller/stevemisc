get_var_info <- function(x) {
  require(labelled)
  require(tidyverse)
  var_label(x) -> b
  data.frame(r = unique(data.frame(val_labels(x)))) -> c
  rownames_to_column(c, "label") -> c
  names(c) <- c("label", "numeric")
  tribble(~label, ~numeric,
          b, NA,
          NA, NA) -> tribs
  tribs[is.na(tribs)] <- ""
  tribs$numeric <- as.numeric(tribs$numeric)
  as.data.frame(rbind(tribs, c)) -> info
  info[is.na(info)] <- ""
  print(info, row.names=F)
}
