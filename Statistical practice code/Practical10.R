library(readxl)

#set working directory
setwd("~/R")

#getting data
density <- read_xlsx("density.xlsx")

#getting the summary of the data
summary(density)

#replacing density exercise as a facotr
density$Exercise <- as.factor(density$Exercise)

summary(density)

#
density$Exercise <- factor(density$Exercise, levels=c("Control", "Low Jump", "High Jump"))
summary(density)

#making boxplot
boxplot(BoneDensity ~ Exercise, data = density)

#one way anova
fit1 <- aov(BoneDensity~Exercise, data = density)

#summary of fit1
summary(fit1)
summary(aov(BoneDensity~Exercise, data = density))

#null hypothesis
#mew1 = mew2 = mew3

#alternative hypothesis
#at least one of the mewi is different

#where mew1 is the population mean of bone density of rats in the control group
#where mew2 is the population mean of bone density of rats in the low jump group
#where mew3 is the population mean of bone density of rats in the high jump group

#observed values of test statistic
#f test statistic, with f dristibution
#f value  = 7.978
#f distribution: F(2, 27)
#2 = # of treatment groups - 1 = k - 1 
#27 = n - k  = #total number of subjects - # of treatment groups
  
#p value = 0.0019, reject null hypothesis
#we have strong evidence to suggest that at least 1 of the group of rats,
#has a statistically significant different bone density to at least 1 other group of rats
  
#this suggests that jumping exercise has an effect on the bone density of rats
  
  
#using aggregation to check assumption of constant variances
aggregate(BoneDensity~Exercise, data = density, sd)

control_sd <- sd(density$BoneDensity[density$Exercise== "Control"])

high_jump_sd <- sd(density$BoneDensity[density$Exercise== "High Jump"])

control_sd/high_jump_sd

par(mfrow = c(1,3))
#normality check
qqnorm(density$BoneDensity[density$Exercise== "Control"], main = "Control")
qqline(density$BoneDensity[density$Exercise== "Control"], main = "Control")

qqnorm(density$BoneDensity[density$Exercise== "Low Jump"], main = "Low Jump")
qqline(density$BoneDensity[density$Exercise== "Low Jump"], main = "Low Jump")

qqnorm(density$BoneDensity[density$Exercise== "High Jump"], main = "High Jump")
qqline(density$BoneDensity[density$Exercise== "High Jump"], main = "High Jump")

#multiple comparision using tukey
TukeyHSD(fit1)
#different High jump and Control p value < 0.05
#null hypothesis  mew3 = mew1
#null hypothesis  mew3 != mew1
#interpretation using CI
#CI = (13.666043, 61.53396)
#we are 95% confident that the mean bone density for rats in the
#high jump group is between 13.666043 to 61.53396 units higher than the
#rats in the control group
