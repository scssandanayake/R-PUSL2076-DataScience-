library(tidyverse)
library(mlbench)
data("BreastCancer")
str(BreastCancer)
summary(BreastCancer)
levels(BreastCancer)

#classifier

library(caTools)
set.seed(150)
split <- sample.split(BreastCancer, SplitRatio = 0.8)

traning_set <- subset(BreastCancer, split == T)
testing_set <- subset(BreastCancer, split == F)

dim(traning_set)
dim(testing_set)

library(e1071)
naiveBayes_classifier <- naiveBayes(Class ~ ., data = traning_set)
predicresults <- predict(naiveBayes_classifier, newdata = testing_set)

#confusion matrix

conftable <- table(predicresults, testing_set$Class)
conftable

library(caret)
confusionMatrix(conftable)