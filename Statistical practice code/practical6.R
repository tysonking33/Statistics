library(readxl)

#set working directory
setwd("~/R")

#getting data
songs <- read_xlsx("songs.xlsx")

#making a histogram
hist(songs$total_secs,
     main = "Histogram of spotify song duration",
     xlab = "observation")
#shape:unimodal, right skewed
#location:using median
median(songs$total_secs)
#spread: using Iqr, because skewed
IQR(songs$total_secs)
#outliers: yes (find out more)

#making a boxplot
boxplot(songs$total_secs,
     main = "Histogram of spotify song duration",
     xlab = "observation")


#alternative hypothesis
#mew != 240

#1 parameter - mew

#running a 1 sample t test
t.test(songs$total_secs, mu = 240)

#t = 2.62 - t-test statistic
#p-value = 0.01168
#df = number of subjects - 1 = 49
#reject null hypothesis if  p-value < 0.05
#0.01168 < 0.05 , reject null hypothesis
#95% confidence interval [266.5823, 441.6177]
#reject null hypothesis as 240 is not within the 95% confidence interval

#checking assumptions
qqnorm(songs$total_secs)
qqline(songs$total_secs)

#how to assess an assumption
# what assumption am i checking - normality
# how do i check/which plot - (looking a normal Q-Q plot)
# what do i expect to see -roughly linear data points that follow the trend line
# what do i observe - data points that don't follow the trend line
#    , curvature present in data points
# conclusion - normality is not reasonable (what was expected was not what was observed)

#other assumptions
# independence
#looking at experimental design
# what we expect to see - see randomly selected subjects
#

#how to address the normality of data- using central limit theorem

#is it reasonable to use the one sample t test
#yes, because we can invoke the central limit theormne which states
#for a arge enough sample size (>30), out sample eajn should be noramlly distributed