data <- mtcars
data$disp

mtcars$disp[which(mtcars$disp>420)] <- 
  c(mtcars$disp[which(mtcars$disp>420)]*2)
mtcars$disp

boxplot(mtcars$disp)

outliers <- boxplot(mtcar$disp, plot = FALSE)$out
outliers

mtcars[which(mtcars$disp %in% outliers) ,]

newMtcars <- mtcars[-which(mtcars$disp %in% outliers),]

boxplot(newMtcars$disp)
