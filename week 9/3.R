#naveen's code
library(cluster)

data <- read.csv("C:\\Users\\User\\Desktop\\R lec\\Datasets\\WineQuality.csv")
str(data)

summary(data)



#with all columns
set.seed(1500)
cluster_results <- kmeans(data[,1:11], centers = 5, nstart = 100)
cluster_results

table(cluster_results$cluster , data$quality)



clusplot(data,cluster_results$cluster, color = T, shade = T, labels = 0 , lines= 0)



#only taking 10 and 11 columns
set.seed(1500)
cluster_results <- kmeans(data[,10:11], centers = 5, nstart = 100)
cluster_results

table(cluster_results$cluster , data$quality)



clusplot(data,cluster_results$cluster, color = T, shade = T, labels = 0 , lines= 0)


#doing changes to get the best clusters

set.seed(1500)
cluster_results <- kmeans(data[,c(1, 2, 5, 6, 8, 10)], centers = 5, nstart = 100)
cluster_results

table(cluster_results$cluster , data$quality)

clusplot(data,cluster_results$cluster, color = T, shade = T, labels = 0 , lines= 0)



#Breast Cancer Prediction



data2 <- read.csv("C:\\Users\\User\\Desktop\\R lec\\Datasets\\BreastCancer.csv") 

summary(data2)
str(data2)
set.seed(500)

cluster_results <- kmeans(data2[,1:5], centers = 2, nstart = 50)
cluster_results

table(cluster_results$cluster , data2$diagnosis)



clusplot(data2,cluster_results$cluster, color = T, shade = T, labels = 0 , lines= 0)