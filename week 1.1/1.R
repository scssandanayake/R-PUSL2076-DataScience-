data1 <- data.frame(
  x=c(1,2,3),
  y=c(51.2,22.3,71.5),
  z=c("true","false","true")
)

data2 <- data.frame(
  x=c(1,2,23),
  n=c(151.2,122.3,171.5),
  o=c("tom","fathima","truman")
)

data1
data2

#inner join #connect common cloumns
join_data1 <- merge(data1,data2,by="x")
join_data1

#left join #connect left table
join_data2 <- merge(data1,data2,by="x",all.y = T)
join_data2

#right join #connect right table
join_data3 <- merge(data1,data2,by="x",all.x = T)
join_data3

#full join #connect both 2 tables
join_data4 <- merge(data1,data2,by="x",all = T)
join_data4

data3 <- data.frame(
  x=c(100,200,300,400),
  y=c(151.2,122.3,171.5,144.3),
  z=c("tom","fathima","truman","greg")
)

merge_data1 <- rbind(data1,data3)
merge_data1

merge_data1 <- cbind(data1,data2)
merge_data1

df <- data.frame(
  height=c(160,170,155,145,130),
  weight=c(60,50,55,65,45),
  age=c(20,22,25,24,26)
)

#stanadarization
df$weight_st<- scale(df$weight)
df$height_st<- scale(df$height)
df

#normalization

