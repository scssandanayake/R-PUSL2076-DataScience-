library("tidyverse")
?airquality
dataset <- airquality
view(dataset)
head(dataset)
tail(dataset)
summary(dataset)
str(dataset)
?airquality

hist(dataset$Temp, main = "Temperature each day MAY to SEPTEMBER",
     xlab = "Temperature",
     ylab = "Frequency of days",
     col = "red")

boxplot(dataset$Ozone, 
        main="Ozone data boxplot",
        xlab="Ozone",
        ylab="",
        col = "blue"
)

boxplot(Temp  ~ Ozone, data = dataset,
        main = "Temperature with Ozone",
        ylab = "Temperature",
        xlab = "Ozone",
        col = "orange")

boxplot(airquality $ Ozone,data = dataset,
        main = "Mean Ozone in parts per billion at roossevelt island",
        ylab = "Temperature",
        xlab = "Parts per Billion",
        horizontal = TRUE,
        notch = TRUE,
        col = "green",
        border = "black")

boxplot(Temp ~ Month,
        data = dataset,
        main = "different box plots in each month",
        xlab = "month number",
        ylab = "degree farenhite",
        col = rainbow(6),
        border = "black")


