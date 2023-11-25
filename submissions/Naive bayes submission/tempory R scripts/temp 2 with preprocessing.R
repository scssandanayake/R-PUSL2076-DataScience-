#ruchira's code
library(e1071)
library(caret)
library(caTools)

data <- read.csv("D:\\R\\week 9\\student_portuguese_clean.csv")
#View(dataset)

# Assuming 'final_grade' is the target column
target_col <- "final_grade"
X <- data[, setdiff(names(data), target_col)]
y <- data[[target_col]]

#test data summary
summary(test_data)
#predicted results table
predicted_results <-predict(nb_model,newdata=test_data)
table(predicted_results)

data$age[is.na(data$age)] <- mean(data$age, na.rm = TRUE)

data

data$grade_1[is.na(data$grade_1)] <- mean(data$grade_1, na.rm = TRUE)
data$grade_2[is.na(data$grade_2)] <- mean(data$grade_2, na.rm = TRUE)
data$health[is.na(data$health)] <- mean(data$health, na.rm = TRUE)
data$weekday_alcohol[is.na(data$weekday_alcohol)] <- mean(data$weekday_alcohol, na.rm = TRUE)
data$weekend_alcohol[is.na(data$weekend_alcohol)] <- mean(data$weekend_alcohol, na.rm = TRUE)
data$free_time[is.na(data$free_time)] <- mean(data$free_time, na.rm = TRUE)
data$family_relationship[is.na(data$family_relationship_time)] <- mean(data$family_relationship, na.rm = TRUE)
data$social[is.na(data$social)] <- mean(data$social, na.rm = TRUE)
data$absences[is.na(data$absence)] <- mean(data$absences, na.rm = TRUE)
data  
library(dplyr)

data <- data %>%
  mutate(travel_time = recode(
    travel_time,
    "15 to 30 min." = 0,
    "<15 min." = 1,
    "min. to 1 hour" = 2,
    ">1 hour" = 3
  ))
data <- data %>%
  mutate(study_time
         = recode(
           study_time
           ,
           "<2 hours" = 0,
           "2 to 5 hours" = 1,
           "5 to 10 hours" = 2,
           ">10 hours" = 3
         ))
data$travel_time[is.na(data$travel_time)] <- mean(data$travel_time, na.rm = TRUE)
data$study_time[is.na(data$study_time)] <- mean(data$study_time, na.rm = TRUE)
data$class_failures[is.na(data$class_failures)] <- mean(data$class_failures, na.rm = TRUE)
data
data
sum(is.na(data))

data <- na.omit(data)

sum(is.na(data))


data$school <-as.numeric(factor(data$school))
str(data)

data$sex <-as.numeric(factor(data$sex))
str(data)

data$address_type <-as.numeric(factor(data$address_type))
str(data)



data$parent_status <- as.numeric(factor(data$parent_status))
str(data)

data$mother_education <- as.numeric(factor(data$mother_education))
str(data)

data$father_education <- as.numeric(factor(data$father_education))
str(data)

data$mother_job <- as.numeric(factor(data$mother_job))
str(data)

data$father_job <- as.numeric(factor(data$father_job))
str(data)

data$school_choice_reason <- as.numeric(factor(data$school_choice_reason))
str(data)

data$guardian <- as.numeric(factor(data$guardian))
str(data)


data$school_support <- as.numeric(factor(data$school_support))
str(data)

data$family_support <- as.numeric(factor(data$family_support))
str(data)

data$extra_paid_classes <- as.numeric(factor(data$extra_paid_classes))
str(data)

data$activities <- as.numeric(factor(data$activities))
str(data)

data$nursery_school <- as.numeric(factor(data$nursery_school))
str(data)

data$higher_ed <- as.numeric(factor(data$higher_ed))
str(data)

data$internet_access <- as.numeric(factor(data$internet_access))
str(data)

data$romantic_relationship <- as.numeric(factor(data$romantic_relationship))
str(data)
data$family_size <- as.numeric(factor(data$family_size))
str(data)
data$guardian <- as.numeric(factor(data$guardian))
str(data)

print(data)

set.seed(600)
split <- sample.split(data ,SplitRatio = 0.75)
training_dataset <- subset(data ,split==TRUE)
testing_dataset <- subset(data ,split==FALSE)

training_dataset<-subset(data,split_ratio=="TRUE")

dim(training_dataset)
dim(testing_dataset)
model<-naiveBayes(final_grade~.,data=training_dataset)
summary(testing_dataset)
predicted_results <-predict(model,newdata=testing_dataset)
table(predicted_results)

levels(factor(predicted_results))
levels(factor(testing_dataset$final_grade))
predicted_results<- as.factor(predicted_results)
testing_dataset$final_grade <- as.factor(testing_dataset$final_grade)
predicted_results <- factor(predicted_results)
testing_dataset$final_grade <- factor(testing_dataset$final_grade)

levels(testing_dataset) <- levels(testing_dataset$final_grade)

confmatrix1<- confusionMatrix(predicted_results,testing_dataset$final_grade)
confmatrix1