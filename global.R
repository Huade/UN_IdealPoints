# Golbal environment for both ui and server
library(dplyr)

# Load data
SupCt <- read.csv("Data/SupCt.csv",stringsAsFactors=F)
Sen <- read.csv("Data/Sen.csv", stringsAsFactors = F)
Pres <- read.csv("Data/Pres.csv", stringsAsFactors = F)
House <- read.csv("Data/House.csv", stringsAsFactors = F)

vars_selection <- c("Year","ID", "Name","Ideal.point")
SupCt <- SupCt[vars_selection]
Sen <- Sen[vars_selection]
Pres <- Pres[vars_selection]
House <- House[vars_selection]

SupCt <- SupCt[complete.cases(SupCt),]
Sen <- Sen[complete.cases(Sen),]
Pres <- Pres[complete.cases(Pres),]
House <- House[complete.cases(House),]

SupCt$Name <- paste("SCJ. ", SupCt$Name, sep = "")
Sen$Name <- paste("Sen. ", Sen$Name, sep = "")
Pres$Name <- paste("Pres. ", Pres$Name, sep = "")
House$Name <- paste("Rep. ", House$Name, sep = "")

Ideal_Point_Data <- rbind(SupCt,Sen,Pres,House) %>% 
  filter(!is.na(Ideal.point))

# Load Median data and reshape it
Medians <- read.csv("Data/Medians.csv",stringsAsFactors=F)
Medians <- reshape2::melt(Medians, id = "Year")
names(Medians) <- c("Year", "MedianSelect","IdealPoints")