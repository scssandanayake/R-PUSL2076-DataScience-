#akil's code 1

library(e1071)
library(caret)

dataset<-read.csv("D:\\R\\week 9\\student_portuguese_clean.csv")
summary(dataset)

# Assuming 'final_grade' is the target column
set.seed(600)
split_index <- createDataPartition(dataset$final_grade, p = 0.7, list = FALSE)
train_data <- dataset[split_index, ]
test_data <- dataset[-split_index, ]

# train the Naive Bayes model
model1<- naiveBayes(final_grade ~ ., data = train_data)
# Make predictions on the test set
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

accuracy <- sum(predict1 == test_data$final_grade) / length(test_data$final_grade)
cat("Accuracy without preprocessing:", accuracy, "\n")






#mine original test data
print(levels(y_pred))
print(levels(test_data$final_grade))
levels(factor(y_pred))
levels(factor(test_data$final_grade))
y_pred <- as.factor(y_pred)
test_data$final_grade <- as.factor(test_data$final_grade)
y_pred <- factor(y_pred)
test_data$final_grade <- factor(test_data$final_grade)

levels(y_pred) <- levels(test_data$final_grade)

#extra
#check vector length
length(y_pred)
length(test_data$final_grade)
#checking the missing values
any(is.na(y_pred))
any(is.na(test_data$final_grade))
#inspect data type
class(y_pred)
class(test_data$final_grade)

###########################################################################

#train data summary
summary(train_data)
#predicted results table
predicted_results <-predict(nb_model,newdata=train_data)
table(predicted_results)

#train data
print(levels(y_pred))
print(levels(train_data$final_grade))
levels(factor(y_pred))
levels(factor(train_data$final_grade))
y_pred <- as.factor(y_pred)
train_data$final_grade <- as.factor(train_data$final_grade)
y_pred <- factor(y_pred)
train_data$final_grade <- factor(train_data$final_grade)

levels(y_pred) <- levels(train_data$final_grade)

#extra
length(y_pred)
length(train_data$final_grade)
any(is.na(y_pred))
any(is.na(train_data$final_grade))
class(y_pred)
class(train_data$final_grade)

#################################################################

#chat gpt
print(levels(y_pred))
print(levels(test_data$final_grade))
y_pred <- factor(y_pred, levels = levels(test_data$final_grade))
print(class(y_pred))
print(class(test_data$final_grade))
y_pred <- as.factor(y_pred)
test_data$final_grade <- as.factor(test_data$final_grade)

levels(y_pred) <- levels(test_data$final_grade)