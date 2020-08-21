to_tbl <- tibble::as_tibble
tbl_df <- tibble::as_tibble

jenny <- function(x=8675309){
  set.seed(x)
  message(paste0(emo::ji("music"), ' Jenny, I got your number...'))
}
