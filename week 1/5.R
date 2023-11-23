library(ggplot2)
data <- read.csv("D:\\R\\week 1\\Datasets\\longevity.csv")
data
summary(data)

ggplot(data, aes(x = AgeAtDeath, fill = factor(Smokes))) +
  geom_density() +
  facet_grid(Smokes ~ .)


