library(quantmod)
library(tidyverse)
library(lubridate)

getSymbols("WWE", src="yahoo", from= as.Date("1970-01-01"))

WWE %>% data.frame %>%
  rownames_to_column() %>% tbl_df() %>%
  rename(date = rowname,
         open = WWE.Open,
         high = WWE.High,
         low = WWE.Low,
         close = WWE.Close,
         volume = WWE.Volume,
         adj = WWE.Adjusted) %>%
  mutate(date = as_date(date)) %>%
  ggplot(.,aes(date, close)) + geom_line()
