library(class)
library(caTools)
data <- iris
View(data)

#splitting the data set into training and testing set
split <- sample.split(iris,SplitRatio = 0.7)
train_data <- subset(iris, split == T)
test_data <- subset(iris, split == F)

#feature scaling / standerize
train_scale <- scale(train_data[,1:4])
test_scale <- scale(test_data[,1:4])

head(train_scale)
head(test_scale)

#fitting KNN Model to training data set
classifier_knn <- knn(train = train_scale,
                      test = test_scale,
                      cl = train_data$Species,
                      k = 1)

classifier_knn

#confusion Matrix
cm <- table(test_data$Species, classifier_knn)
cm

#calculate the accuracy of the model
misClassError <- mean(classifier_knn != test_data$Species)
print(paste('Accuracy =' , 1-misClassError))

#choose the optimal K value
initial_k <- sqrt(NROW(data))
initial_k
classifier_knn <- knn(train = train_scale,
                      test = test_scale,
                      cl = train_data$Species,
                      k = 7)

classifier_knn

misClassError <- mean(classifier_knn != test_data$Species)
print(paste('Accuracy =' , 1-misClassError))

