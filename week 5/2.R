library(tidyverse)
dataset <- airquality
str(dataset)
sum(is.na(dataset))
colSums(is.na(dataset))
dim(dataset)
dataset <- na.omit(dataset)
dim(dataset)
sum(is.na(dataset))
dataset2 <- na.omit(dataset)
dim(dataset2)
sum(is.na(dataset2))

df <- dataset[, !(names(dataset) == "Wind")]
str(df)