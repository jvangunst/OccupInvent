#load data and packages
library(ggplot2)
library(car)
library(dplyr)
library(tidyverse)
library(caTools)
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
split <- sample.split(Occup, SplitRatio=.75)
train <- subset(Occup, split=="TRUE")
test <- subset(Occup, split=="FALSE")


#RandomForest Analysis
library(randomForest)
set.seed(120)
RF_A <- randomForest(Occupancy2021 ~ JulyMax + JanMin + PrcpAnn + AET + HeatLoad + TPI990m + PTalus,
                              data=train, importance=TRUE, proximity=TRUE)
RF_A
print(RF_A)
par(mar=c(1,1,1,1))
dev.off()
plot(RF_A)

#Variable importance in class tree
Imp_RFA <- importance(RF_A)
write.csv(Imp_RFA,"C:\\Users\\jane_\\Documents\\GitHub\\OccupInvent\\Ouputs\\VariableImp_rFA.csv")
varImpPlot(RF_A)
pdf(file="~/GitHub/OccupInvent/Graphs/VariableImportance_rF_A.pdf")

library(datasets)
library(caret)
RFpred <- predict(RF_A, train)
caret::confusionMatrix(RFpred$Occupancy2021, train$Occupancy2021)


