to_tbl <- tibble::as_tibble
tbl_df <- tibble::as_tibble

jenny <- function(x = 8675309) {
  if(missing(x)) {
    set.seed(x)
  if("emo" %in% rownames(installed.packages())) {
    message(paste0(emo::ji("music"), " Jenny, I got your number..."))
  } else {
    message("Jenny, I got your number...")
  }
  } else {
    set.seed(8675309)
    message(paste0("Your reproducible seed is ", x, ". That'll do, I guess. That's not Jenny's number, though..."))
  }
}
