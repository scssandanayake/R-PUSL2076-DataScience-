install.packages("tidyverse")
library("tidyverse")
?mpg

dataset <- mpg
view(dataset)

head(dataset)
tail(dataset)

summary(dataset)

hist(dataset$cty)
hist(dataset$cty, main = "Histogram on fuel consumption",
xlab = "fuel consumption" ,
ylab = "frequiency of cars" ,
col = "red")


#getting the frequency
manufacturer_count <- table(dataset$manufacturer)


#barplot customization
barplot(manufacturer_count, main = "Histogram - Manufacturer & Frequency",
        xlab = "Manufacturers",
        ylab = "Frequency",
        col = "skyblue")

#piechart
pie(manufacturer_count)
pie(manufacturer_counts)

car_model_frequencies <- table(dataset$manufacturer)

manufacturer_counts <- table(dataset$cyl)
car_model_frequencies


#creating a pie chart
pie(car_model_frequencies,
    label = names(car_model_frequencies),
    main = "Car Manufacturer Distribution",
    col = rainbow(length(car_model_frequencies)),
    init.angle = 90)

legend("bottomleft", names(car_model_frequencies),
       fill = rainbow(length(car_model_frequencies)))

