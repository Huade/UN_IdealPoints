# Golbal environment for both ui and server
library(dplyr)

# Load data
UN <- read.csv("Data/UN_IdealPoints.csv", stringsAsFactors=F)
UN <- UN[complete.cases(UN),]

load("Data/UN_trend.RData")

Ideal_Point_Data <- rbind(UN, UN_trend)

source("plotlyGraphWidget.R")
