#libraries
#first insatall all the libarires
library(tidyverse)
library(tidytext)
library(reshape2)
library(textdata)
library(knitr)
library(tm)
library(wordcloud)
library(SnowballC)

data <- read_lines("c:\\users\\user\\desktop\\111.txt")
print(data)

#lets make a corpus
corpus <- Corpus(VectorSource(data))
Corpus
inspect(Corpus)

#data preprocessing

#all words to simple
cleaned_corpus <- tm_map(corpus,content_transformer(tolower))
#remove all numbers
cleaned_corpust <- tm_map(corpus,removeNumbers)
#remove all punctuations
cleaned_corpus <- tm_map(corpus,removePunctuation)
#customozed data preprocessing
cleaned_corpus <- tm_map(corpus,removeWords,c("the"))
#inspecting the final text
inspect(cleaned_corpus)


#word ferequency index

wfi <- TermDocumentMatrix(cleaned_corpus)
wfi2 <- as.matrix(wfi)
words <- sort(rowSums(wfi2),decreasing = T)
df = data.frame(word = names(words), freaquency = words)
head(df)

#word cloud graph

set.seed(150)
wordcloud(cleaned_corpus,
          scale = c(6,0.5),
          max.words = 150,
          random.order = FALSE,
          rot.per = 0.2,
          use.r.layout = FALSE,
          colors = brewer.pal(8,"Dark2")
          )

#terms related with the term you

you <- data.frame(findAssocs(wfi,"you",0.40))
title <- expression(paste("words related to you", bold("you")))
you %>% rownames_to_column() %>%
  ggplot(aes(x=reorder(rownames,you),y=you))+
  geom_point(shape = 15, size = 2)

















