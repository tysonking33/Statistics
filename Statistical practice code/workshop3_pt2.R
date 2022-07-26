library(readxl)

#set working directory
setwd("~/R")

#getting the data
osteo <- read.csv("bone.csv")

#scatter plot
plot(NonDom ~ Dom, data = osteo)

#discuss the strength, direction, linear
#is a strong, positive and linear relationship

#fitting a linear relationship
#making a linear model
osteo.lm <- lm(NonDom ~ Dom, data = osteo)

#linear regression
summary(osteo.lm)

#equation
beta_0 <- 0.31891    
beta_1 <- 0.98133    
#y = beta_0 +beta_1*20
beta_0 + beta_1 * 20