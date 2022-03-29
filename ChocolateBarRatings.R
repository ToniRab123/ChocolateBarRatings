# foodPreferences <- read.csv("food_coded.csv")
# library(tidyverse)
# ###getting the four lines of the foodPrefences dataframe you read in
# head(foodPreferences)
# tail(foodPreferences,3)
# ###acess data by its index
# ####making a little example vector
# a <- c(5,10,15)
# ###getting the first row of the foodPreferences data_frame 
# #####dataframe[row,column]
# foodPreferences[1,]
# ###getting the value from cells in 100 row and column 4
# foodPreferences[100,4]
# ##                    Removing unwanted data 
# ###column 5 has alot of values in data set that are not numbers
# foodPreferences[-5]
# ##Data cleaning
# str(chocolateData)
# ###print the first few values from the column named Rating in the datafram
# head(chocolateData$Rating)
# chocolateData <- type.convert(chocolateData)
# chocolateData <- type_convert(chocolateData)
# chocolateData <-type.convert(chocolateData)
# ###remove all the percents signs so data can be read
# chocolateData$Cocoa_Percent <- sapply(chocolateData$Cocoa_Percent, function(x) gsub("%", "", x))
# # chocolateData$`Cocoa
# # Percent` <- sapply(chocolateData$Cocoa_Percent, function(x) gsub("%","",x)) 
# 
# chocolateData <- type.convert(chocolateData)
?group_by
library(tidyverse)
library(dplyr)
library(stringr)
choc<- chocolateData %>% #this is where i reference the data and point it to new dataframe
  rename_with( ~str_remove(., "\n"), everything()) %>% #renamed with string remove and removed the line break \n
  mutate(CocoaPercent1=str_remove(CocoaPercent, "%")) #added a new column and named it CocoaPercent 1 and remove the % sign
#Data Cleaning-removing the blank white spaces in the dataset 
library(tidyverse)
choc
names(choc) <- gsub("[[:space:]+]", "_", names(choc))
str(choc) #check the data type of the columns in the chococlateData
### return a data frame with the mean and sd of the rating column from chocolate dataset
library(dplyr)
choc %>%
  summarise(averageRating = mean(Rating),
            sdRating = sd(Rating)) 
### return the average and sd ratings by the year a rating was given
choc %>% 
  group_by(ReviewDate) %>% 
    summarise(averageRating = mean(Rating),
                  sdRating = sd(Rating))
###return dataframe with average and sd CocoaPercent1 by the year review 
choc %>% 
  group_by(ReviewDate)
    summarise(averageCocoaPercent = mean(CocoaPercent),
              sdCocoaPercent = sd(CocoaPercent))
#Graphing the data
library(ggplot2)
ggplot(choc, aes(x= ReviewDate, y= Rating))
###plot review date on x axis and rating on y axis and add point for each data point 
ggplot(choc, aes(x=ReviewDate, y=Rating)) + geom_point() + geom_jitter() # the jitter makes it so each point is not on top of each other
###adding a smooth line to test for linearity 
ggplot(choc, aes(x=ReviewDate, y=Rating)) + 
  geom_point() + 
  geom_jitter() + 
  geom_smooth(method = 'lm')
#encoding cocoapercent as a color   
ggplot(choc, aes(x=ReviewDate, y=Rating, color= CocoaPercent)) + 
  geom_point() + 
  geom_jitter() + 
  geom_smooth(method = 'lm')
#relationship between cocoa percentage and ratings 
ggplot(choc, aes(x=CocoaPercent, y=Rating, color= CocoaPercent)) + 
  geom_point() + 
  geom_jitter() + 
  geom_smooth(method = 'lm')
