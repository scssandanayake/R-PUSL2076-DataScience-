#implimentation of Kmeans allgorithm

library(ggplot2)

data <- iris
data("iris")
str(iris)
#sepal distribution
ggplot(data, aes(Sepal.Length,Sepal.Width))+geom_point(aes(col=Species),size=3)

#petal distribution
ggplot(data, aes(Petal.Length,Petal.Width))+geom_point(aes(col=Species),size=3)


#k means cluster 
set.seed(150)
cluster_results <- kmeans(data[,1:4], centers = 3, nstart=25)
cluster_results


table(cluster_results$cluster, data$Species)
library(cluster)

clusplot(iris,cluster_results$cluster, color = T, shade = T, labels = 0,lines = 0)