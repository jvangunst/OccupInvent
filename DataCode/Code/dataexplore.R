#load data and packages
library(ggplot2)
library(car)
library(dplyr)
library(tidyverse)
OI <- read.csv("~/GitHub/OccupInvent/DataCode/Data/SiteTalusClim.csv", stringsAsFactors=TRUE)
View(OI)

#check distributions, intro figures 
HJM <- qplot(OI$JulyMax, geom="histogram")
HH <- qplot(OI$HeatLoad, geom="histogram")
HI <- qplot(OI$ShapeInd, geom="histogram")
HAP <- qplot(OI$PrcpAnn, geom="histogram")
BJM <- qplot(Occupancy2021,JulyMax, data=OI, geom="boxplot")
BH <- qplot(Occupancy2021,HeatLoad, data=OI, geom="boxplot")
BAP <- qplot(Occupancy2021,PrcpAnn,data=OI, geom="boxplot")

#create single graph of predictor variables
pdf(file="~/GitHub/OccupInvent/Graphs/IntroPredVars.pdf"); par(mfrow=c(7,2)); 
    plot(HJM); plot(HH); plot(HI);plot(HAP); plot(BJM); plot(BH);plot(BAP); APPEND=TRUE
    
    
#check correlation matrix
OIT <- as_tibble(OI)
yy <- as.data.frame(OIT %>% select(7:10,12, 15, 19:20))
b <- cor(yy)
c <- as.data.frame(b)
write.csv(c,"C:\\Users\\jane_\\Documents\\GitHub\\OccupInvent\\Ouputs\\CorrelationMatrix.csv")


#SubsetData
Occup <- as.data.frame(OIT %>% select(1, 3, 7:10,12, 15, 19:20))
summary(Occup)
OccupGrpd <- as.data.frame(Occup %>% group_by(Occupancy2021) %>% slice_head(prop=.80))
summary(OccupGrpd)
