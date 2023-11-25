library(cluster)
library(ggplot2)

dataset <- read.csv("D:\\R\\week 9\\Breast_cancer_data.csv")
View(dataset)
head (dataset)
dim(dataset)
summary(dataset)

set.seed(1500)
cluster_result <- kmeans(dataset[,4:5], centers = 2, nstart = 25)
cluster_result
table(cluster_result$cluster, dataset$diagnosis)

clusplot(dataset, cluster_result$cluster, color = T,shade=T,labels = 0,lines = 0)

ggplot(dataset, aes(dataset$mean_perimeter, dataset$mean_area)) + geom_point(aes(col=dataset$diagnosis), size=5)
