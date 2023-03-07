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
library(shiny)

setwd("D:/DATA 332/Github Project 1")

#df <- read.csv("Consumer_Complaints.csv")
#saveRDS(df, "Consumer_Complaints.RDS")

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

df_3 <- tidy_data %>%
  inner_join(lexicon) %>%
  group_by(word) %>%
  count(sentiment, sort = TRUE)

df_3%>%
  ggplot(aes(n, word, fill = sentiment ))+
  geom_col(show.legend = FALSE)+
  facet_wrap(~sentiment, scales = "free_y") +
  theme_light()+
  labs(y = "sentimetal analysis", 
       subtitle = "                                                                              NRC lexicon",
       x=NULL, y=NULL)

df_4 <-df_3 %>%
  group_by(sentiment) %>%
  summarise(n = n()) %>%
  ungroup() %>%
  mutate(sentiment = reorder(sentiment, n)) %>%
  #Use `fill = -n` to make the larger bars darker
  ggplot(aes(sentiment,n , fill = -n)) +
  geom_col() +
  guides(fill = "none") + #Turn off the legend
  labs(x = NULL, y = "Word Count") +
  #  scale_y_continuous(limits = c(0, 500000)) + #Hard code the axis limit
  ggtitle("                                        Consumer Narrative NRC Sentiment") +
  coord_flip()
plot(df_4)



ui <- pageWithSidebar(
  
  # App title ----
  headerPanel("Consumer Complaint"),
  
  # Sidebar panel for inputs ----
  sidebarPanel(
    
    # Input: Selector for variable to plot against mpg ----
    selectInput("variable", "Variable:", 
                c("Cylinders" = "cyl",
                  "Transmission" = "am",
                  "Gears" = "gear")),
    
    # Input: Checkbox for whether outliers should be included ----
    checkboxInput("outliers", "Show outliers", TRUE)
    
  ),
  
  # Main panel for displaying outputs ----
  mainPanel()
)

