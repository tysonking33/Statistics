library(readxl)

#set working directory
setwd("~/R")

#getting data
Maths_Marks <- read_xlsx("Maths_Marks.xlsx")

#finding summary statistics
summary(Maths_Marks)

#finding sample mean
mean(Maths_Marks$A1)
mean(Maths_Marks$A2)

#finding sample standard deviation
sd(Maths_Marks$A1)
sd(Maths_Marks$A2)

#finding sample median
median(Maths_Marks$A1)
median(Maths_Marks$A2)

#finding sample IQR
IQR(Maths_Marks$A1)
IQR(Maths_Marks$A2)


#making a histogram
hist(Maths_Marks$A1,
     main = "A histogram showing the frequency
     marks on Assignment 1",
     xlab = "Mark")

hist(Maths_Marks$A2,
     main = "A histogram showing the frequency
     marks on Assignment 2",
     xlab = "Mark")

#finding the difference between A1 and A2
Maths_Marks$Difference <- Maths_Marks$A1-Maths_Marks$A2

#making a matched pair t test
t.test(Maths_Marks$Difference)


#making a qq plot to check normality
qqnorm(Maths_Marks$Difference)
qqline(Maths_Marks$Difference)