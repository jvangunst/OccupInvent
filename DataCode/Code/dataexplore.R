#load data and packages
library(ggplot2)
library(car)
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
selpred <- as.data.frame(a, col.names = c('ShapeInd', 'JulyMax', 'janMin', 'PrcpAnn', 'HeatLoad', 'TP1990', 'PTalus'))
b <- cor(selpred)
c <- as.data.frame(b)
write.csv(c,"~/GitHub/OccupInvent/Outputs/CorMatrix.csv", row.names = FALSE)



