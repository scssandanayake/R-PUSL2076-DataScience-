#setting the data set
library(tidyverse)
install.packages("mlbench")
library(mlbench)
data("BreastCancer")
str(BreastCancer)
summery(BreastCancer)
levels(BreastCancerClass)


#classifier

install.packages("caTools")
library(caTools)
set.seed(150)
split <- sample.split(BreastCancer,SplitRatio = 0.8)

traning_set <- subset(BreastCancer, split==TRUE)
testing_set <- subset(BreastCancer, split==FALSE)

dim(traning_set)
dim(testing_set)

install.packages("e1071")
library(e1071)
naiveclassifier <- naiveBayes(class ~ ., data = traning_set)

predictresults <- predict(naiveclassifier, newdata = testing_set)

#the confusion matrix 

conftable <- table(predictresults, testing_set$Class)
conftable

install.packages(caret)
library(caret)
confusionMatrix(conftable)

#lets do preprocessing
install.packages("mice")
