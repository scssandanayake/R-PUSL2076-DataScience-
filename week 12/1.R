data <- read.csv("D:\\My R\\R-PUSL2076-DataScience-\\week 12\\admissions.csv")
View(data)

library(ggplot2)

ggplot(data,aes(x=gpa,y=admitted))+
  geom_jitter(height = .05,alpha = .1)

model <- glm(admitted ~ gpa, data=data,
             family = "binomial")

summary(model)

ggplot(data,aes(x=gpa,y=admitted))+
  geom_jitter(height = .05,alpha=.1)+
  geom_smooth(method = glm,method.args=list(family="binomial"))

