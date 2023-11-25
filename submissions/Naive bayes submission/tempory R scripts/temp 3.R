#akil"s colde
library(e1071)
library(caret)
dataset<-read.csv("D:\\R\\week 9\\student_portuguese_clean.csv")
summary(dataset)
set.seed(600)
split_index <- createDataPartition(dataset$final_grade, p = 0.7, list = FALSE)
train_data <- dataset[split_index, ]
test_data <- dataset[-split_index, ]
model1<- naiveBayes(final_grade ~ ., data = train_data)
predict1<- predict(model1,newdata = test_data)

levels(factor(predict1))
levels(factor(test_data$final_grade))
predict1 <- as.factor(predict1)
test_data$final_grade <- as.factor(test_data$final_grade)
predict1 <- factor(predict1)
test_data$final_grade <- factor(test_data$final_grade)

levels(predict1) <- levels(test_data$final_grade)

confmatrix1<- confusionMatrix(predict1,test_data$final_grade)
confmatrix1
##################################
sum(is.na(dataset))
length(dataset)
dim(dataset)
dataset<- na.omit(dataset)
dim(dataset)
dataset<- unique(dataset)
dim(dataset)

set.seed(600)
split_index <- createDataPartition(dataset$final_grade, p = 0.7, list = FALSE)
train_data <- dataset[split_index, ]
test_data <- dataset[-split_index, ]

model2<- naiveBayes(final_grade ~ ., data = train_data)

predict2<- predict(model2,newdata = test_data)
predict1 <- factor(predict1)
test_data$final_grade <- factor(test_data$final_grade)

levels(predict1) <- levels(test_data$final_grade)
predict2 <- factor(predict2, levels = levels(test_data$final_grade))

confmatrix2<- confusionMatrix(predict2,test_data$final_grade)
confmatrix2