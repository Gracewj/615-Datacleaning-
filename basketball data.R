library(xml2)
library(rvest)
library(tidyverse)
site1 <- "https://www.basketball-reference.com/leagues/NBA_"
site2 <- "_games-"
site3 <- ".html"
year <- c(2013:2018)
month <- c("january","february","march","april","may","june","october","november","december")
month_index<-c(1:9)
year_index<-c(1:6)
name1<-c()
name2<-c()
total.date<-c()
total.attdence<-c()
for (i in year_index){
  for (j in month_index){
    site<-paste(site1,year[i],site2,month[j],site3,sep="")
    webpage<-read_html(site)
    name1<- webpage %>% html_nodes('.left:nth-child(1)') %>% html_attrs()
    name2<- webpage %>% html_nodes('.center+.right') %>% html_text()
    total.date <- c(total.date,name1)
    total.attdence <- c(total.attdence,name2)
    j<-j+1
  }
  i<-i+1
}

total.date1 <- t(data.frame((total.date)))[,4]
total.attdence1 <- data.frame(total.attdence)
b_data<-cbind(total.date1,total.attdence1)[-1,]
colnames(b_data)<-c("date","attendance")
rownames(b_data)<-rep(1:7934)
host<-substr(b_data$date, 10, 12)
b_data$date<-substr(b_data$date,1,9)
b_data3<-cbind(b_data,host)

Homegame <- filter(b_data3,str_detect(host,"BOS"))
Homegame$date <- substring(Homegame$date, 1,8)
Homegame$date <- as.Date(Homegame$date,"%Y%m%d")

Home_2012 <- filter(Homegame,str_detect(date,"2012"))
Home_2013 <- filter(Homegame,str_detect(date,"2013"))
Home_2014 <- filter(Homegame,str_detect(date,"2014"))
Home_2015 <- filter(Homegame,str_detect(date,"2015"))
Home_2016 <- filter(Homegame,str_detect(date,"2016"))
Home_2017 <- filter(Homegame,str_detect(date,"2017"))

weather_data <- read.csv("weather data.csv")
colnames(weather_data)[colnames(weather_data)=="DATE"] <- "date"
weather_data$date <- as.Date(weather_data$date,"%Y-%m-%d")

Celtics_2012<- inner_join(Home_2012,weather_data,by = "date", match = all)
Celtics_2013<- inner_join(Home_2013,weather_data,by = "date", match = all)
Celtics_2014<- inner_join(Home_2014,weather_data,by = "date", match = all)
Celtics_2015<- inner_join(Home_2015,weather_data,by = "date", match = all)
Celtics_2016<- inner_join(Home_2016,weather_data,by = "date", match = all)
Celtics_2017<- inner_join(Home_2017,weather_data,by = "date", match = all)
Celtics_All <- do.call("rbind", list(Celtics_2012,Celtics_2013,Celtics_2014,Celtics_2015,Celtics_2016,Celtics_2017))

ggplot(Celtics_All,aes( x = date, y = attendance , color = TAVG)) + 
  geom_point() + 
  geom_smooth() + 
  ggtitle("Weather vs attendance") +
  xlab("Date") +
  ylab("attendance")
