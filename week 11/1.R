#web scraping / web mining

library(rvest)
library(xml2)

web <- "https://kellyfelder.com/"

content <- read_html(web)
#print(content)

#analysis the content

h1_topics <- html_nodes(content,'h1') %>% html_text()
print(h1_topics)

#any_hyperlinks
hyp <- html_nodes(content,'a') %>% html_text()
print(hyp)

#images
web_immg <- ht
