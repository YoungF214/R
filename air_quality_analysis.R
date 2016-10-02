data <- read.csv("hw1_data.csv")

## 1. What are the column names of the dataset?
colnames(data)
## Ozone, Solar.R, Wind, Temp, Month, Day

## 2. Extract the first 2 rows of the data frame and print them to the console. 
##    What does the output look like?
data[1:2, ]
## or 
head(data, 2)
##    Ozone Solar.R Wind Temp Month Day
## 1    41     190  7.4   67     5   1
## 2    36     118  8.0   72     5   2

## 3. How many observations (i.e. rows) are in this data frame?
nrow(data)
## 153

## 4. Extract the last 2 rows of the data frame and print them to the console. 
##    What does the output look like?
tail(data, 2)
##     Ozone Solar.R Wind Temp Month Day
## 152    18     131  8.0   76     9  29
## 153    20     223 11.5   68     9  30

## 5. What is the value of Ozone in the 47th row?
data[47, 1]
## or 
x <- data$Ozone
x[47]
## 21

## 6. How many missing values are in the Ozone column of this data frame?
x <- data$Ozone
sum(is.na(x))
## 37

## 7. What is the mean of the Ozone column in this dataset? 
##    Exclude missing values (coded as NA) from this calculation
x <- data$Ozone
good <- complete.cases(x)
mean(x[good])
## 42.1

## 8. Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. 
##    What is the mean of Solar.R in this subset?
x <- subset(data, Ozone>31 & Temp>90, select = Solar.R)
apply(x, 2, mean)
## 212.8

## 9. What is the mean of "Temp" when "Month" is equal to 6?
x<- subset(data, Month == 6, select = Temp)
apply(x, 2, mean)
## 79.1

## 10. What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
x <- subset(data, Month == 5 & !is.na(Ozone), select = Ozone)
apply(x, 2, max)
## 115
