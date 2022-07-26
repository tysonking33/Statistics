# setting up our treatment
#creating a variable called treatments
#c() to make a vector, 2 treatments A and B
treatments <- c("A", "B", "C", "D")

#setting up the data frame, called subjects
#data.frame() to make a data frame
subjects <- data.frame(
  #name of first column
  IDs = 1:100,
  #2nd column, treatment
  treatment = rep(treatments, each = 25)
)

#random allocation of the treatments
#taking a sample of data w/o replacement
subjects$treatment <- sample(subjects$treatment)

#load library
library(readxl)


#loading fvc dataset
FVC <- read_excel("FVC.xlsx")


#calculating the mean height of all the subjects
#for this prac this is the population mean
mean(FVC$Height)

#randomly sampling 10 subjects
sample_subjects <- sample(FVC$Height, size = 10)

#calculate the sample mean
mean(sample_subjects)

#get lots of samples of sample means

#making an empty vector
means <- numeric(100)

#making a for loop
for (i in 1:100){
  #[] is a subset
  means[i] <- mean(sample(FVC$Height, size = 100))
}

#making a histogram of the means
hist(means)

#average of sample means to estimate population mean
mean(means)
