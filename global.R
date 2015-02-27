# Golbal environment for both ui and server
library(dplyr)

# Load SupCt data
SupCt <- read.csv("SupCt.csv") %>% 
  select(Year, Name, Ideal.point)

# Load Median data and reshape it
Medians <- read.csv("Medians.csv")

Medians <- melt(Medians, id = "Term")
names(Medians) <- c("Year", "MedianSelect","IdealPoints")