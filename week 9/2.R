install.packages(cluster)
library(cluster)
library(ggplot2)

dataset <- read.csv("D:\\R\\week 9\\winequality-red.csv")
View(dataset)
head (dataset)
dim(dataset)
summary(dataset)

#with all columns
set.seed(100)
cluster_result <- kmeans(dataset[,1:11], centers = 4, nstart = 25)
cluster_result
table(cluster_result$cluster, dataset$quality)

clusplot(dataset, cluster_result$cluster, color = T,shade=T, labels = 0 , lines= 0)
ggplot(dataset, aes(dataset$density, dataset$alcohol)) + geom_point(aes(col=dataset$quality), size=5)


#only taking 10 and 11 columns
set.seed(100)
cluster_result <- kmeans(dataset[,10:11], centers = 4, nstart = 25)
cluster_result
table(cluster_result$cluster , dataset$quality)

clusplot(dataset,cluster_result$cluster, color = T, shade = T, labels = 0 , lines= 0)


#doing changes to get the best clusters
set.seed(1500)
cluster_result <- kmeans(dataset[,c(1, 2, 5, 6, 8, 10)], centers = 5, nstart = 100)
cluster_result
table(cluster_result$cluster , dataset$quality)

clusplot(dataset,cluster_result$cluster, color = T, shade = T, labels = 0 , lines= 0)