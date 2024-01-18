#packages
#install.packages("ISLR") #orange juice dataset
#install.packages("caret") #workflow
#install.packages("rpart.plot") #draw the disision tree
#install.packages("tidyverse")
#install.packages("skimr") #summary statistical analysis

library(ISLR)
library(caret)
library(rpart.plot)
library(tidyverse)
library(skimr)

#setting the dataset

dataset <- OJ
dataset
skim_to_wide(dataset)

#training data & testing data
splitt <- createDataPartition(y = dataset$Purchase, p = 0.75, list = FALSE)
train <- dataset[splitt, ]
test <- dataset[splitt, ]

dim(train)
dim(test)

#the classifier
set.seed(15000)

dec_tree <- rpart(formula = Purchase ~. ,
                  data = train,
                  method = "class",
                  xval = 10 )

#drawing the tree
rpart.plot(dec_tree, yesno = TRUE)


