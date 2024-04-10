library(ggplot2)
prices <- read.csv(file.path("C:\\Users\\Gosisa Jinasena\\Downloads\\stock_prices.csv"), stringsAsFactors = FALSE) 

prices[1,]

# Transforming data format
#install.packages("lubridate")
library(lubridate) 
prices <- transform(prices, Date = ymd(Date)) 
head(prices) 

# Create the stock -> date matrix
#install.packages("reshape")
library('reshape') 
date.stock.matrix <- cast(prices, Date ~ Stock, value = 'Close') 
head(date.stock.matrix)
dim(date.stock.matrix)

# removing missinng entries
install.packages("CAST")
library(CAST)
prices <- subset(prices, Date != ymd('2002-02-01')) 
prices <- subset(prices, Stock != 'DDR') 
date.stock.matrix <- cast(prices, Date ~ Stock, value = 'Close')

cor.matrix <- cor(date.stock.matrix[, 2:ncol(date.stock.matrix)]) 
correlations <- as.numeric(cor.matrix) 
ggplot(data.frame(Correlation = 
                    correlations), aes(x = Correlation, fill = 
                                         1)) + geom_density() + 
  theme(legend.position = 'none') 

pca <- princomp(date.stock.matrix[, 2:ncol(date.stock.matrix)]) 
pca 

principal.component <- pca$loadings[, 1] 
loadings <- as.numeric(principal.component) 
ggplot(data.frame(Loading = loadings), 
       aes(x = Loading, fill = 1)) + 
  geom_density() + 
  theme(legend.position = 'none')

market.index <- predict(pca)[, 1] 

library(lubridate) 

dji.prices <- read.csv(file.path("C:\\Users\\Gosisa Jinasena\\Downloads\\DJI.csv"), stringsAsFactors = FALSE) 
dji.prices <- transform(dji.prices, Date = ymd(Date)) 

dji.prices <- subset(dji.prices, Date > ymd('2001-12-31')) 
dji.prices <- subset(dji.prices, Date != ymd('2002-02-01')) 

dji <- with(dji.prices, rev(Close)) 
dates <- with(dji.prices, rev(Date))

library(ggplot2)

comparison <- data.frame(Date = dates, 
                         MarketIndex = market.index, 
                         DJI = dji) 
ggplot(comparison, aes(x = MarketIndex, y = DJI)) + 
  geom_point() + geom_smooth(method = 
                               'lm', se = FALSE)