library(dplyr)
library(readxl)
library(lubridate)
library(sentimentr)
library(foreign)
library(wordcloud)
library(tidyverse)
library(tm)
library(magrittr)
library(lexicon)
library(metricsgraphics)
library(broom)
library(tidytext)
library(textdata)
library(ggthemes)
library(radarchart)
library(treemap)

setwd("D:/DATA 332/Github Project 1")

df <- readRDS("Consumer_Complaints.rds") 
df_1 <- df %>%
  select(Complaint.ID, Company, Product, Issue, Submitted.via, Company.response.to.consumer)

#df_1 <- df_0[1:100,]

  
tidy_data <- df_1 %>%
  unnest_tokens(word, Company.response.to.consumer) %>%
  anti_join(stop_words)

#Create a sentiment lexicon

lexicon <- get_sentiments("nrc")


# Recalculate sentiment scores
#sentiment_scores <- tidy_data %>%
#inner_join(lexicon) %>%
#group_by(sentiment) %>%
#summarise(sentiment_scores = sum(sentiment))

sentiment_scores <- tidy_data %>%
  inner_join(lexicon) %>%
  group_by(word) %>%
  count(sentiment, sort = TRUE)

df_2 <- tidy_data %>%
  inner_join(lexicon)%>%
  select(sentiment)

wordcloud(df_2$sentiment, scale=c(5,0.5), 
          min.freq = 1, max.words = Inf, 
          random.order = FALSE,
          rot.per = 0.35, colors = brewer.pal(8, "Dark2"))

