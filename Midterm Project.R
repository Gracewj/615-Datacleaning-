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

# Read and select home game from 2018 Dataset
Game_2018 <- select(Attendence[["2018"]], Date,Tm:Opp, contains("D/N"), Attendance)
Data_2018<- data.frame(do.call('rbind', strsplit(as.character(Game_2018$Date),',',fixed=TRUE)))
Game_2018 <- merge(Game_2018,Data_2018,by = 0)
Clean_2018 <- filter(Game_2018, is.na(X__2))
C_2018 <- select(Clean_2018, 7,9)

# Read and select home game from 2017 Dataset
Game_2017 <- select(Attendence[["2017"]],Date, Tm:Opp, contains("D/N"), Attendance)
Data_2017<- data.frame(do.call('rbind', strsplit(as.character(Game_2017$Date),',',fixed=TRUE)))
Game_2017 <- merge(Game_2017,Data_2017,by = 0)
Clean_2017 <- filter(Game_2017, is.na(X__2))
C_2017 <- select(Clean_2017, 7,9)

# Read and select home game from 2016 Dataset
Game_2016 <- select(Attendence[["2016"]], Date,Tm:Opp, contains("D/N"), Attendance)
Data_2016<- data.frame(do.call('rbind', strsplit(as.character(Game_2016$Date),',',fixed=TRUE)))
Game_2016 <- merge(Game_2016,Data_2016,by = 0)
Clean_2016 <- filter(Game_2016, is.na(X__2))
C_2016 <- select(Clean_2016, 7,9)
C_2016 <-  C_2016[1:81,]

# Read and select home game from 2015 Dataset
Game_2015 <- select(Attendence[["2015"]], Date,Tm:Opp, contains("D/N"), Attendance)
Data_2015<- data.frame(do.call('rbind', strsplit(as.character(Game_2015$Date),',',fixed=TRUE)))
Game_2015 <- merge(Game_2015,Data_2015,by = 0)
Clean_2015 <- filter(Game_2015, is.na(X__2))
C_2015 <- select(Clean_2015, 7,9)

# Read and select home game from 2014 Dataset
Game_2014 <- select(Attendence[["2014"]], Date,Tm:Opp, contains("D/N"), Attendance)
Data_2014<- data.frame(do.call('rbind', strsplit(as.character(Game_2014$Date),',',fixed=TRUE)))
Game_2014 <- merge(Game_2014,Data_2014,by = 0)
Clean_2014 <- filter(Game_2014, is.na(X__2))
C_2014 <- select(Clean_2014, 7,9)

# Read and select home game from 2013 Dataset
Game_2013 <- select(Attendence[["2013"]], Date,Tm:Opp, contains("D/N"), Attendance)
Data_2013<- data.frame(do.call('rbind', strsplit(as.character(Game_2013$Date),',',fixed=TRUE)))
Game_2013 <- merge(Game_2013,Data_2013,by = 0)
Clean_2013 <- filter(Game_2013, is.na(X__2))
C_2013 <- select(Clean_2013, 7,9)

# Read and select home game from 2012 Dataset
Game_2012 <- select(Attendence[["2012"]], Date, Tm:Opp, contains("D/N"), Attendance)
Data_2012<- data.frame(do.call('rbind', strsplit(as.character(Game_2012$Date),',',fixed=TRUE)))
Game_2012 <- merge(Game_2012,Data_2012,by = 0)
Clean_2012 <- filter(Game_2012, is.na(X__2))
C_2012 <- select(Clean_2012, 7,9)

weather_data <- read.csv("weather data.csv")
View(weather_data)

