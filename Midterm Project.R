library(readxl)
library(tidyverse)

# Create function that could reald all tabs from excel
Read_All_sheet <- function(filename, tibble = FALSE) {
  sheets <- readxl::excel_sheets(filename)
  x <- lapply(sheets, function(X) readxl::read_excel(filename, sheet = X))
  if (!tibble) {
    x <- lapply(x, as.data.frame)
  }
  names(x) <- sheets
  x
}


# Read all worksheet from excel
Attendence <- Read_All_sheet("RedSoxAttendance 2012-2018.xlsx")
weather_data <- read.csv("weather data.csv")


# Read and select home game from 2017 Dataset
Game_2017 <- select(Attendence[["2017"]], Date, Tm:Opp, contains("D/N"), Attendance)
Data_2017<- data.frame(do.call('rbind', strsplit(as.character(Game_2017$Date),',',fixed=TRUE)))
Data_2017<- data.frame(do.call('rbind', strsplit(as.character(Data_2017$X2),' ',fixed=TRUE)))
Game_2017 <- merge(Game_2017,Data_2017,by = 0)
Clean_2017 <- filter(Game_2017, is.na(X__2))
C_2017 <- select(Clean_2017, 7,9,10)
C_2017$X2 <- match(C_2017$X2,month.abb)
C_2017$year <- rep(2017,nrow(C_2017)) # make new column 
A <- C_2017[,c(1,4,2,3)]
C_2017 <- unite(A, Date,2:4, sep = "-", remove = TRUE)
C_2017$Date <- as.Date(C_2017$Date,"%Y-%m-%d")


# Read and select home game from 2016 Dataset
Game_2016 <- select(Attendence[["2016"]], Date, Tm:Opp, contains("D/N"), Attendance)
Data_2016<- data.frame(do.call('rbind', strsplit(as.character(Game_2016$Date),',',fixed=TRUE)))
Data_2016<- data.frame(do.call('rbind', strsplit(as.character(Data_2016$X2),' ',fixed=TRUE)))
Game_2016 <- merge(Game_2016,Data_2016,by = 0)
Clean_2016 <- filter(Game_2016, is.na(X__2))
C_2016 <- select(Clean_2016, 7,9,10)
C_2016$X2 <- match(C_2016$X2,month.abb)
C_2016$year <- rep(2016,nrow(C_2016)) # make new column 
A <- C_2016[,c(1,4,2,3)]
C_2016 <- unite(A, Date,2:4, sep = "-", remove = TRUE)
C_2016$Date <- as.Date(C_2016$Date,"%Y-%m-%d")
C_2016 <- na.omit(C_2016)

# Read and select home game from 2015 Dataset
Game_2015 <- select(Attendence[["2015"]], Date, Tm:Opp, contains("D/N"), Attendance)
Data_2015<- data.frame(do.call('rbind', strsplit(as.character(Game_2015$Date),',',fixed=TRUE)))
Data_2015<- data.frame(do.call('rbind', strsplit(as.character(Data_2015$X2),' ',fixed=TRUE)))
Game_2015 <- merge(Game_2015,Data_2015,by = 0)
Clean_2015 <- filter(Game_2015, is.na(X__2))
C_2015 <- select(Clean_2015, 7,9,10)
C_2015$X2 <- match(C_2015$X2,month.abb)
C_2015$year <- rep(2015,nrow(C_2015)) # make new column 
A <- C_2015[,c(1,4,2,3)]
C_2015 <- unite(A, Date,2:4, sep = "-", remove = TRUE)
C_2015$Date <- as.Date(C_2015$Date,"%Y-%m-%d")


# Read and select home game from 2014 Dataset
Game_2014 <- select(Attendence[["2014"]], Date, Tm:Opp, contains("D/N"), Attendance)
Data_2014<- data.frame(do.call('rbind', strsplit(as.character(Game_2014$Date),',',fixed=TRUE)))
Data_2014<- data.frame(do.call('rbind', strsplit(as.character(Data_2014$X2),' ',fixed=TRUE)))
Game_2014 <- merge(Game_2014,Data_2014,by = 0)
Clean_2014 <- filter(Game_2014, is.na(X__2))
C_2014 <- select(Clean_2014, 7,9,10)
C_2014$X2 <- match(C_2014$X2,month.abb)
C_2014$year <- rep(2014,nrow(C_2014)) # make new column 
A <- C_2014[,c(1,4,2,3)]
C_2014 <- unite(A, Date,2:4, sep = "-", remove = TRUE)
C_2014$Date <- as.Date(C_2014$Date,"%Y-%m-%d")


# Read and select home game from 2013 Dataset
Game_2013 <- select(Attendence[["2013"]], Date, Tm:Opp, contains("D/N"), Attendance)
Data_2013<- data.frame(do.call('rbind', strsplit(as.character(Game_2013$Date),',',fixed=TRUE)))
Data_2013<- data.frame(do.call('rbind', strsplit(as.character(Data_2013$X2),' ',fixed=TRUE)))
Game_2013 <- merge(Game_2013,Data_2013,by = 0)
Clean_2013 <- filter(Game_2013, is.na(X__2))
C_2013 <- select(Clean_2013, 7,9,10)
C_2013$X2 <- match(C_2013$X2,month.abb)
C_2013$year <- rep(2013,nrow(C_2013)) # make new column 
A <- C_2013[,c(1,4,2,3)]
C_2013 <- unite(A, Date,2:4, sep = "-", remove = TRUE)
C_2013$Date <- as.Date(C_2013$Date,"%Y-%m-%d")

# Read and select home game from 2012 Dataset
Game_2012 <- select(Attendence[["2012"]], Date, Tm:Opp, contains("D/N"), Attendance)
Data_2012<- data.frame(do.call('rbind', strsplit(as.character(Game_2012$Date),',',fixed=TRUE)))
Data_2012<- data.frame(do.call('rbind', strsplit(as.character(Data_2012$X2),' ',fixed=TRUE)))
Game_2012 <- merge(Game_2012,Data_2012,by = 0)
Clean_2012 <- filter(Game_2012, is.na(X__2))
C_2012 <- select(Clean_2012, 7,9,10)
C_2012$X2 <- match(C_2012$X2,month.abb)
C_2012$year <- rep(2012,nrow(C_2012)) # make new column 
A <- C_2012[,c(1,4,2,3)]
C_2012 <- unite(A, Date,2:4, sep = "-", remove = TRUE)
C_2012$Date <- as.Date(C_2012$Date,"%Y-%m-%d")


#join with Weather

#2012
Weather_2012 <- filter(weather_data,str_detect(DATE,"2012"))
colnames(Weather_2012)[colnames(Weather_2012)=="DATE"] <- "Date"
Weather_2012$Date <- as.Date(Weather_2012$Date,"%Y-%m-%d")
Table_2012<- inner_join(C_2012,Weather_2012,by = "Date", match = all)


#2013
Weather_2013 <- filter(weather_data,str_detect(DATE,"2013"))
Weather_2013 <- filter(weather_data,str_detect(DATE,"2013"))
colnames(Weather_2013)[colnames(Weather_2013)=="DATE"] <- "Date"
Weather_2013$Date <- as.Date(Weather_2013$Date,"%Y-%m-%d")
Table_2013<- inner_join(C_2013,Weather_2013,by = "Date", match = all)

#2014
Weather_2014 <- filter(weather_data,str_detect(DATE,"2014"))
Weather_2014 <- filter(weather_data,str_detect(DATE,"2014"))
colnames(Weather_2014)[colnames(Weather_2014)=="DATE"] <- "Date"
Weather_2014$Date <- as.Date(Weather_2014$Date,"%Y-%m-%d")
Table_2014<- inner_join(C_2014,Weather_2014,by = "Date", match = all)

#2015
Weather_2015 <- filter(weather_data,str_detect(DATE,"2015"))
Weather_2015 <- filter(weather_data,str_detect(DATE,"2015"))
colnames(Weather_2015)[colnames(Weather_2015)=="DATE"] <- "Date"
Weather_2015$Date <- as.Date(Weather_2015$Date,"%Y-%m-%d")
Table_2015<- inner_join(C_2015,Weather_2015,by = "Date", match = all)

#2016
Weather_2016 <- filter(weather_data,str_detect(DATE,"2016"))
Weather_2016 <- filter(weather_data,str_detect(DATE,"2016"))
colnames(Weather_2016)[colnames(Weather_2016)=="DATE"] <- "Date"
Weather_2016$Date <- as.Date(Weather_2016$Date,"%Y-%m-%d")
Table_2016<- inner_join(C_2016,Weather_2016,by = "Date", match = all)

#2017
Weather_2017 <- filter(weather_data,str_detect(DATE,"2017"))
Weather_2017 <- filter(weather_data,str_detect(DATE,"2017"))
colnames(Weather_2017)[colnames(Weather_2017)=="DATE"] <- "Date"
Weather_2017$Date <- as.Date(Weather_2017$Date,"%Y-%m-%d")
Table_2017<- inner_join(C_2017,Weather_2017,by = "Date", match = all)


##merge

Table_all <- do.call("rbind", list(Table_2012,Table_2013,Table_2014,Table_2015,Table_2016,Table_2017))

#Plot
ggplot(Table_all,aes( x = Date, y = Attendance, color = TAVG)) + 
  geom_point() + 
  geom_smooth() + 
  ggtitle("Weather vs attendance") +
  xlab("Date") +
  ylab("attendance")

ggplot(Table_2012,aes( x = Date, y = Attendance, size = TAVG)) + 
  geom_point() + 
  geom_smooth() + 
  ggtitle("Weather vs attendance 2012") +
  xlab("Date") +
  ylab("attendance")

ggplot(Table_2013,aes( x = Date, y = Attendance, size = TAVG)) + 
  geom_point() + 
  geom_smooth() + 
  ggtitle("Weather vs attendance 2013") +
  xlab("Date") +
  ylab("attendance")

ggplot(Table_2014,aes( x = Date, y = Attendance, size = TAVG)) + 
  geom_point() + 
  geom_smooth() + 
  ggtitle("Weather vs attendance 2014") +
  xlab("Date") +
  ylab("attendance")

ggplot(Table_2015,aes( x = Date, y = Attendance, size = TAVG)) + 
  geom_point() + 
  geom_smooth() + 
  ggtitle("Weather vs attendance 2015") +
  xlab("Date") +
  ylab("attendance")

ggplot(Table_2016,aes( x = Date, y = Attendance, size = TAVG)) + 
  geom_point() + 
  geom_smooth() + 
  ggtitle("Weather vs attendance 2016") +
  xlab("Date") +
  ylab("attendance")

ggplot(Table_2017,aes( x = Date, y = Attendance, size = TAVG)) + 
  geom_point() + 
  geom_smooth() + 
  ggtitle("Weather vs attendance 2017") +
  xlab("Date") +
  ylab("attendance")