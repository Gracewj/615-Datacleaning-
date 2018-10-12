library(rvest)
library(tidyverse)

site1 <- "https://www.baseball-reference.com/teams/BOS/"
site2 <- "-schedule-scores.shtml"
year <- c(2012:2017)

site <- paste0(site1,year,site2)
baseball <- data.frame()
for (i in length(site)){ 

webpage <- site[i]

name<- as.data.frame(read_html(webpage) %>% html_nodes("table") %>% html_table())

baseball <- merge(name,baseball)

i = i+1
}

