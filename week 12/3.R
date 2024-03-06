data <- read.csv("D:\\My R\\R-PUSL2076-DataScience-\\week 12\\stock_prices.csv")
View(data)

#Import and preprocessing data  
library(ggplot2)
prices <- read.csv(file.path('D:\\My R\\R-PUSL2076-DataScience-\\week 12\\stock_prices.csv'), stringsAsFactors 
                   = FALSE)
prices[1,] 

#preprocessing / translate all of the raw date stamps
#install.packages("lubridate")
library(lubridate)
prices<- transform(prices, Date = ymd(Date))
head(prices)

# cast function in the reshape
install.packages("reshape")
library(reshape)
date.stock.matrix <- cast(prices, Date ~ Stock, value = 'Close')

#Remove missing entries:
#install.packages("CAST")
library(CAST)
prices <- subset(prices, Date != ymd('2002-02-01'))
prices <- subset(prices, Stock != 'DDR')
date.stock.matrix <- cast(prices, Date ~ Stock, value = 'Close')

# Correlations (get the correlation density)
cor.matrix <- cor(date.stock.matrix[, 2:ncol(date.stock.matrix)])
correlations <- as.numeric(cor.matrix)
ggplot(data.frame(Correlation = 
                    correlations), aes(x = Correlation, fill = 
                                         1)) + geom_density() +  
  theme(legend.position = 'none')

#ggplot(data.frame(Correlation = correlations), aes(x = Correlation)) + 
  #geom_density(fill = "blue") +  # Use a specific color for the density plot
  #theme(legend.position = 'none')

#creating the PCA
pca <- princomp(date.stock.matrix[, 2:ncol(date.stock.matrix)])
pca

principal.component <- pca$loadings[, 1] 
loadings <- as.numeric(principal.component)  
ggplot(data.frame(Loading = loadings), 
       aes(x = Loading, fill = 1)) + 
  geom_density() +  
  theme(legend.position = 'none')

