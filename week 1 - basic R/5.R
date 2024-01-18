library(ggplot2)
data <- read.csv("D:\\My R\\R-PUSL2076-DataScience-\\week 1 - basic R\\Datasets\\longevity.csv")
data
summary(data)

ggplot(data, aes(x = AgeAtDeath, fill = factor(Smokes))) +
  geom_density() +
  facet_grid(Smokes ~ .)




