library(e1071)
library(caret)
library(mice)

dataset <- read.csv("D:\\R\\week 9\\student_portuguese_clean.csv")
sum(is.na(dataset))
#View(dataset)

# Assuming the 'final_grade' is the target column
target_col <- "final_grade"
X <- dataset[, setdiff(names(dataset), target_col)]
y <- dataset[[target_col]]

# Impute missing values
imputed_data <- mice(X, method = "rf")
# Complete the imputation process
completed_data <- complete(imputed_data)

# Remove rows with missing values
dataset <- dataset[complete.cases(dataset), ]

# Split the dataset into training and testing sets
set.seed(600)
splitIndex <- createDataPartition(y, p = 0.75, list = FALSE)
train_data <- dataset[splitIndex, ]
test_data <- dataset[-splitIndex, ]

# Encode categorical variables
dummy_transform <- dummyVars(formula = paste(target_col, "~ ."), data = train_data, fullRank = TRUE)
train_data_processed <- predict(dummy_transform, newdata = train_data)
test_data_processed <- predict(dummy_transform, newdata = test_data)

#Check Categorical Variables
sapply(train_data, function(x) length(unique(x)))

head(train_data_processed)

# Preprocess the data
preprocess_params <- preProcess(train_data[, setdiff(names(train_data), target_col)], method=c("center", "scale"))
train_data_processed <- predict(preprocess_params, train_data)
test_data_processed <- predict(preprocess_params, test_data)

# Initialize and train the Naive Bayes model
nb_model <- naiveBayes(train_data_processed[, setdiff(names(train_data_processed), target_col)], train_data$final_grade)

# Make predictions on the test set
y_pred <- predict(nb_model, newdata = test_data_processed)

summary(test_data)
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

# Evaluate the accuracy of the model
accuracy <- sum(y_pred == test_data_processed$final_grade) / length(test_data_processed$final_grade)
cat("Accuracy with preprocessing:", accuracy, "\n")



