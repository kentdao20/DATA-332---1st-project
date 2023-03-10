# DATA 332 First Project

# Author: Kent Dao

## Overview:

![dataset-cover](https://user-images.githubusercontent.com/118495124/223350466-7117d704-e6ac-4966-8909-ade85c982733.png)

The dataset comprises of Consumer Complaints on Financial products and we’ll see how to classify consumer complaints text into these categories: Debt collection, Consumer Loan, Mortgage, Credit card, Credit reporting, Student loan, Bank account or service, Payday loan, Money transfers, Other financial service, Prepaid card. This data was downloaded from kaggle for studying and practicing purposes. We want to learn the trend on what the consumer feelings after being support and what problems are happening most within each company. Since the assignment require a wordcloud and sentimental analysis, we have to see what data are available, their frequency and can any conclusion being draw out from it.

### Consumer Complaint data

## Process:

**1. Cleaning data**

![RDS saving](https://user-images.githubusercontent.com/118495124/222996355-732dd19b-6774-4093-bddc-a35cc73d3f77.png)

![Cleaned data code](https://user-images.githubusercontent.com/118495124/223224950-435118f4-02fe-4984-96a6-a23dcdfa6831.png)

First, I change the file format from CSV fo RDS by saving it into a data frame and save it again as a RDS file. With the RDS file, this makes the file easier to approach and run. I have the 1 to ... comment out, as in the beginning, I was testing what I can do with the data with the first 100, then 100, then 5000 line. This makes the data faster and easier to run in the beginnning phase. After that, I comment it out to run the data as a whole. As this can take more time, it is safer to do so as I can play around with it faster. The other thing is I look on google and youtube different library to install, including treemap, radarchar, maggitr,... and work with it for the simple analysis. Reading through the data, I can see the data have a lot of blank, which can be drop and only specific column are important, like I can drop the ID of the problem and only pick the Company, the product, the problems that they are running into and the ways they are being submit.

**2. Setting up word cloud**

![Wordcloud code](https://user-images.githubusercontent.com/118495124/223224280-72853123-3639-419f-9e2a-58f07f52bc2c.png)

After cleaning, I add another column by using inner join to see the word after run through lexicon to know what feeling people have using lexicon. There are multiple ways of doing, either to drop the words that are not important by using stop_word, or simply run it through lexicon to pick out key words. Since all the data are pretty unifified and doesnt have things that might go wrong from the lexicon, I decided to use it instead of stop_word. Then I select only the sentiment column to show only the words that are going into the word cloud. I go online and learn how to make a simple word cloud![dataset-cover](https://user-images.githubusercontent.com/118495124/223350452-9aa15c83-c965-4f1f-9753-36ce8683b981.png)


**3. Setting up sentimental analysis**

![1st graph](https://user-images.githubusercontent.com/118495124/223225451-30eb2e38-7bb3-4fbf-8eee-751796523f90.png)

The data frame 3 being draw out from the tidied data after putting with the nrc lexicon. This makes the data pick out the right keyword with each lexicon library, putting it next to the sentimental analysis. Using ggplot, we put in the n as number of word, the word that are being use the most and using the fill inside the graph as sentiment, put the legend away and facet wrap it into the scales with the y as the number of word that are being count. 

**4. Graph from bing**

![2st graph](https://user-images.githubusercontent.com/118495124/223225471-12c1ac0f-c986-4bc2-9eb7-1a7c6d682e02.png)

Data frame 4 from data frame 3 sowe group by sentiment again, but this time we dont let the repetition happen and summarise the data into 4 main key words. We ungroup them into 4 different variable to show oin the graph, ggplot help making the graph after and fill with random color. It was putting data on x axis, which is ugly so i think flipping to y axis make sense.


## Graph

**1. Word cloud**

![Wordcloud](https://user-images.githubusercontent.com/118495124/223001854-ba70c47e-a921-4289-ab0e-df139b73b7d6.png)

This word cloud was made using the output of lexicon ncr menu, I got this after I merge the library from the lexicon with inner join to make a list of the words that can reflect the emotion of the customer after being dealt with and return 4 main words, which is mainly positive with a lot of anticipation, a small amount of negative and some even feels joy.


**2. Graph**

![Graph a](https://user-images.githubusercontent.com/118495124/223346091-15c4c514-1f72-4d78-b8ae-57e5ac097cf4.png)

This sentimental analysis focus on diving into the emotion of what the customer feeling are within keywords that are picked out by the lexicon library and to determine whether they are feeling joy, but in what sense. This can be important to see what most of the customer are feeling, while doing that, the way number were showing was not clear and was not very smooth. From these graph we can understand that a very small amount feel negative on their experience with the customer support team. For positive, we can see that most of te customer feels monetary and relief, which is not really great if they can see that they are being pull into more money, but it is good that they feel relief afterward. Progress does not play a big part, maybe to the reason that a lot of case were all closed and find a solution right away.

**3. Graph**

![Rplot](https://user-images.githubusercontent.com/118495124/223346126-33eee9d9-d3d3-4d95-a96d-ffb5b14750a2.png)

This analysis goes outward, with a simple analysis on the 4 main emotion, but the graph was not too clear as it was not very working in the beginning. 
