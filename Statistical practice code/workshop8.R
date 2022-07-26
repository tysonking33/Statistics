library(readxl)

#set working directory
setwd("~/R")

#getting data
beans <- read_xlsx("beans.xlsx")

#creating a new variable called difference between
#the dominant and non dominant hands
beans$Difference <- beans$Dominant-beans$'Non Dominant'

#making a histogram
hist(beans$Difference)
#making a boxplot
boxplot(beans$Difference)

#the distribution is:
# slightly positively skewed
# uni modal
# lacks outliers
# the center of the distribution is 1
median(beans$Difference)
# uses IQR to analyse the spread = 3
IQR(beans$Difference)


#analysing the difference
#making a t.test
t.test(beans$Difference)
#null hypothesis
# Ho: mewD = 0 (i.e. no difference)
# Hd: mewD != 0
# Where mewD is the population mean difference 
# for the number of beans placed in a cup
# using the dominant hand and the dominant hand
# test statistic t = 1.6974
# distribution of test statistic if null hypothesis is true: T~t14
# p-value = 0.1117
# retain null hypothesis because p-value > 0.05

#making a qq-plot
#normal qq plot
qqnorm(beans$Difference)

#putting a line in the qq-plot
qqline(beans$Difference)

#we are checking the assumption of normality
# we are checking by looking at a normal qq-plot
# if the assumption of normality is reasonable, we expect to see linear data points that fall on the trend line
# here the data points look approximately linear and we conclude the assumption of normality is reasonable.

#independence of difference

#conclusion based on CI
# we are unable to find a difference in the number of beans placed in a cup
# using the dominant and non dominant hand.
# we are 95% confident that the dominant hand moves between 0.281 less beans and 2.415 more beans than the non dominant hand.