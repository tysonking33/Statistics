library(readxl)

#set working directory
setwd("~/R")

#getting data
bank <- read_xlsx("bank.xlsx")

#making a histogram
hist(bank$deposits,
     main = "Histogram of deposit amounts
     and the corresponding frequency",
     xlab = "Deposit amount")
#median
median(bank$deposits)

#iqr
IQR(bank$deposits)

#running a 1 sample t test
t.test(bank$deposits, mu = 120)

#making a qq-plot
#normal qq plot
qqnorm(bank$deposits)

#putting a line in the qq-plot
qqline(bank$deposits)
