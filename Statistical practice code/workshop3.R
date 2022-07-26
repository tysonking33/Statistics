library(readxl)

#set working directory
setwd("~/R")

#getting the data
titanic <- read.csv("titanic.csv")
# or
titanic <- read.csv("titanic.csv")

#making a contingency table
titanic_tab <- table(titanic$survived, titanic$pclass)
titanic_tab

#getting row and column sums
addmargins(titanic_tab)

#get proportions
#column sum - margin=2
#row sum - margin =1
titanic_prop <- prop.table(titanic_tab, margin = 2)
titanic_prop

#making a bar chart of titanic count
barplot(titanic_tab, 
        beside = TRUE,
        legend.text = TRUE, 
        args.legend = list(x = "topleft"))

#making a bar chart of titanic proportions
barplot(titanic_prop, 
        beside = TRUE,
        legend.text = TRUE, 
        args.legend = list(x = "topleft"))
