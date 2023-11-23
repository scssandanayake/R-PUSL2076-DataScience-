df <- data.frame(city=c('colombo','kandy','galle','kandy','colombo','kandy'),
                 salary=c(1000,2000,3000,2000,1000,2000));

df
#performing label encoding on city column
df$city <- as.numeric(factor(df$city));
df

df
#one hot encoding
df <- data.frame(city=c('colombo','kandy','galle','kandy','colombo','kandy'),
                 salary=c(1000,2000,3000,2000,1000,2000));

df

df$city <- model.matrix(~df$city-1,df);
df