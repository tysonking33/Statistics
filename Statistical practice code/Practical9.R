library(readxl)

#set working directory
setwd("~/R")

#getting data
calcium <- read_xlsx("calcium.xlsx")

#identifying outliers
#making a frequency table, of Sex and Lab variables
xtabs(~Sex+Lab, data=calcium)

#making a table of 2 variables
table(calcium$Sex, calcium$Lab)

#making a histogram of age
hist(calcium$Age)

calcium$Age
calcium$Lab
calcium$Age[calcium$Age<30]

hist(calcium$AlkPhos)

#making a boxplot
boxplot(calcium$CaMol~calcium$Lab)

#getting rid of lab 3
boxplot(calcium$CaMol[calcium$Lab != "3"]~calcium$Lab[calcium$Lab != "3"])
boxplot(calcium$CaMol[calcium$Lab != 3]~calcium$Lab[calcium$Lab != 3])

#getting rid of lab 3, 21, 43
boxplot(calcium$CaMol[calcium$Lab != 3 & calcium$Lab != 21 & calcium$Lab != 43]~calcium$Lab[calcium$Lab != 3 & calcium$Lab != 21 & calcium$Lab != 43])

