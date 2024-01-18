#setting the data set
library(tidyverse)
library(mlbench)
data("BreastCancer")
str(BreastCancer)
summary(BreastCancer)
levels(BreastCancer$Class)

#Naive Bayes classifier

library(caTools)
set.seed(150)
split <- sample.split(BreastCancer,SplitRatio = 0.8)

training_set <- subset(BreastCancer, split==TRUE)
testing_set <- subset(BreastCancer, split==FALSE)

dim(training_set)
dim(testing_set)


library(e1071)
naiveBayes_classifier <- naiveBayes(Class ~ ., data = training_set)

predictresults <- predict(naiveBayes_classifier, newdata = testing_set)

#the confusion matrix 
conftable <- table(predictresults, testing_set$Class)
conftable

library(caret)
confusionMatrix(conftable)

#lets do preprocessing
#install.packages("mice")
