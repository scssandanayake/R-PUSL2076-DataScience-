library(ggplot2)
library(dplyr)
data <- read.csv("D:\\R\\week 2\\car data set\\car details v4.csv")
str(data)

ggplot(data = data,aes(x=data$Year,y=data$Price))+geom_point()+geom_smooth(method = lm, se=FALSE)

ggplot(data = data,aes(x=Kilometer,y=Price))+geom_point()+geom_smooth(method = lm, se=FALSE)

#calculating the coeficeints and the constant

regmodel1 <- lm(Price ~ Year ,
                data = data)
coef(regmodel1)
