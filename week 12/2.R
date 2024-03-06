data <- read.csv("D:\\My R\\R-PUSL2076-DataScience-\\week 12\\diabetesmodel.csv")
View(data)
sum(is.na(data))

library(caTools)

## split the dataset
split <- sample.split(data,SplitRatio = 0.8)
training_set<- subset(data,split==T)
testing_set<- subset(data,split==F)
lg_model<- glm(Outcome ~ Glucose+BMI+Pregnancies+BloodPressure+SkinThickness+Insulin+Age,
               data=training_set,family = "binomial")
summary(lg_model)

pred <- predict(lg_model,newdata = testing_set,type="response")
pred

predicted_classes <- ifelse(pred>0.5,'have','no')

head(predicted_classes)

conf<- table(testing_set$Outcome,predicted_classes)
print(conf)
sum(diag(conf)) #diagonal line (diag)
accuracy <- sum(diag(conf)/sum(conf))
print(paste('Accuracy:',accuracy))


