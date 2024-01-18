library(ggplot2)
library(dplyr)
data <- read.csv("D:\\My R\\R-PUSL2076-DataScience-\\week 2\\heart disease data set\\heart_disease.csv")
summary(data)
str(data)

ggplot(data = data,aes(x=data$age,y=data$resting_blood_pressure))+
  geom_point()+
  geom_smooth(method = lm, se=FALSE)

ggplot(data = data,aes(x=data$age,y=data$serum_cholestoral))+
  geom_point()+
  geom_smooth(method = lm, se=FALSE)

#calculating the coeficeints and the constant

regmodel1 <- lm(resting_blood_pressure ~ age ,
                data = data)
coef(regmodel1)

regmodel2 <- lm(serum_cholestoral ~ age ,
                data = data)
coef(regmodel2)