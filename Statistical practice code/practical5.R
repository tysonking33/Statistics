library(readxl)

#set working directory
setwd("~/R")

#getting data
SPIP5 <- read_xlsx("SPIP5.xlsx")

#setting up the data frame
treatments <- c("A", "B")

subjects <- data.frame(
  IDs = 1:50,
  observation = (SPIP5$observation),
  treatment = rep(treatments, each = 25))

#randomly permeating the treatment
subjects$treatment <- sample(subjects$treatment)

#making sample for each treatment
aggregate(observation~subjects$treatment, data = SPIP5, mean)

sampleA <- sample(subjects$observation[subjects$treatment == "A"], size = 10)
sampleB <- sample(subjects$observation[subjects$treatment == "A"], size = 10)

#mean
mean(sampleA)
mean(sampleB)

#standard deviation
sd(sampleA)
sd(sampleB)

#median
median(sampleA)
median(sampleB)


#IQR
IQR(sampleA)
IQR(sampleB)


#making a boxplot
boxplot(subjects$observation ~ subjects$treatment, data = SPIP5,
        main = "Boxplot of the effect of treatments A and B
        on the response variable",
        xlab = "Treatments",
        ylab = "Frequency")

#making a histogram for A
hist(subjects$observation[subjects$treatment == 'A'],
     main  = "Histogram of the effect of treatment A
     on the observation",
     xlab = "Observation")

#making a histogram for B
hist(subjects$observation[subjects$treatment == 'B'],
     main  = "Histogram of the effect of treatment B
     on the observation",
     xlab = "Observation")
