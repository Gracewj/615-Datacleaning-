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
Attendence <- Read_All_sheet("RedSox Attendance 2012-2018.xlsx")

# Read and select home game from 2018 Dataset
Game_2018 <- select(Attendence[["2018"]], Tm:Opp, contains("D/N"), Attendance)
Clean_2018 <- filter(Game_2018, is.na(X__2))

# Read and select home game from 2017 Dataset
Game_2017 <- select(Attendence[["2017"]], Tm:Opp, contains("D/N"), Attendance)
Clean_2017 <- filter(Game_2017, is.na(X__2))

# Read and select home game from 2016 Dataset
Game_2016 <- select(Attendence[["2016"]], Tm:Opp, contains("D/N"), Attendance)
Clean_2016 <- filter(Game_2016, is.na(X__2)) %>%
  na.omit(Clean_2016)
# Read and select home game from 2015 Dataset
Game_2015 <- select(Attendence[["2015"]], Tm:Opp, contains("D/N"), Attendance)
Clean_2015 <- filter(Game_2015, is.na(X__2))

# Read and select home game from 2014 Dataset
Game_2014 <- select(Attendence[["2014"]], Tm:Opp, contains("D/N"), Attendance)
Clean_2014 <- filter(Game_2014, is.na(X__2))

# Read and select home game from 2013 Dataset
Game_2013 <- select(Attendence[["2013"]], Tm:Opp, contains("D/N"), Attendance)
Clean_2013 <- filter(Game_2013, is.na(X__2))

# Read and select home game from 2012 Dataset
Game_2012 <- select(Attendence[["2012"]], Tm:Opp, contains("D/N"), Attendance)
Clean_2012 <- filter(Game_2012, is.na(X__2))
