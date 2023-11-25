library(e1071)
library(caret)

dataset <- read.csv("D:\\R\\week 9\\student_portuguese_clean.csv")
#View(dataset)

# Assuming 'final_grade' is the target column
target_col <- "final_grade"
X <- dataset[, setdiff(names(dataset), target_col)]
y <- dataset[[target_col]]

# Split the dataset into train and test
set.seed(600)
splitIndex <- createDataPartition(y, p = 0.75, list = FALSE)
train_data <- dataset[splitIndex, ]
test_data <- dataset[-splitIndex, ]

# train the Naive Bayes model
nb_model <- naiveBayes(final_grade ~ ., data = train_data)
# Make predictions on the test set
y_pred <- predict(nb_model, newdata = test_data)

#test data summary
summary(test_data)
#predicted results table
predicted_results <-predict(nb_model,newdata=test_data)
table(predicted_results)

#handling categorical variables for calculation
print(levels(y_pred))
print(levels(test_data$final_grade))
levels(factor(y_pred))
levels(factor(test_data$final_grade))
y_pred <- as.factor(y_pred)
test_data$final_grade <- as.factor(test_data$final_grade)
y_pred <- factor(y_pred)
test_data$final_grade <- factor(test_data$final_grade)

levels(y_pred) <- levels(test_data$final_grade)

#confusionMatrix calculation
confmatrix1<- confusionMatrix(y_pred,test_data$final_grade)
confmatrix1

# Evaluate accuracy of the model
accuracy <- sum(y_pred == test_data$final_grade) / length(test_data$final_grade)
cat("Accuracy without preprocessing:", accuracy, "\n")
