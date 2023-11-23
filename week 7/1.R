library(caret)
library(ISLR)
library(rpart.plot)
library(tidyverse)
library(skimr)


data <- read.csv("D:\\R\\week 7\\car evaluation data set\\car_evaluation.csv")
data
summary(data)
    
#selecting dataset
skim_to_wide(data)
skim(data)

#setting the training and testing data set
set.seed(1800)
partition <- createDataPartition(y = data$unacc, p = 0.75, list=FALSE)
datatrain <- data[partition, ]
dataset <- data[partition, ]

rm(partition)
dim(train)
dim(test)

#decision tree
set.seed(1000)
clasifier <- rpart(formula = unacc ~.,
                   data = datatrain,
                   method = "class",
                   xval = 10)

#drawing the tree
rpart.plot(clasifier, yesno = TRUE)