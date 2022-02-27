foodPreferences <- read.csv("food_coded.csv")
library(tidyverse)
###getting the four lines of the foodPrefences dataframe you read in
head(foodPreferences)
tail(foodPreferences,3)
###acess data by its index
####making a little example vector
a <- c(5,10,15)
###getting the first row of the foodPreferences data_frame 
#####dataframe[row,column]
foodPreferences[1,]
###getting the value from cells in 100 row and column 4
foodPreferences[100,4]
##                    Removing unwanted data 
