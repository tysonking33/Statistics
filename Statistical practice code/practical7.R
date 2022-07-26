library(readxl)

#set working directory
setwd("~/R")

#getting data
movies <- read_xlsx("bechdel.xlsx")

#making a histogram

par(mfrow = c(1,2)) #to compare distribution

hist(movies$profit[movies$bechdal=="PASS"],
     main = "Movies that pass the bechdal test",
     xlab = "Profit")

hist(movies$profit[movies$bechdal=="FAIL"],
     main = "Movies that fail the bechdal test",
     xlab = "Profit")

#making a boxplot
boxplot(profit ~ bechdal, data = movies)

#mean of movies that passed and failed
mean(movies$profit[movies$bechdal== "PASS"])
mean(movies$profit[movies$bechdal== "FAIL"])

#running a 2 sample t-test
t.test(profit~bechdal, data=movies)
#mean1 =241.3306, mean2 = 464.3615
#null hypothesis mean1 = mean2
#alternative hypothesis mean1 != mean2
#observed values of the test statistic = -2.6915
#distribution of the test statistic if the null hypothesis is true = 248.22 
#p-value=0.007596
#95% confidence interval -386.23760<= mean2 - mean1<=-59.82417
#making qq-plot testing for normality
qqnorm(movies$profit[movies$bechdal=="FAIL"], main="FAIL")
qqline(movies$profit[movies$bechdal=="FAIL"])
qqnorm(movies$profit[movies$bechdal=="PASS"], main="PASS")
qqline(movies$profit[movies$bechdal=="PASS"])