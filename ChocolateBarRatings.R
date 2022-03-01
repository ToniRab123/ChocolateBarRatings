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

library(tidyverse)
library(dplyr)
library(stringr)
choc<- chocolateData %>% #this is where i reference the data and point it to new dataframe
  rename_with( ~str_remove(., "\n"), everything()) %>% #renamed with string remove and removed the line break \n
  mutate(CocoaPercent1=str_remove(CocoaPercent, "%")) #added a new column and named it CocoaPercent 1 and remove the % sign

 
