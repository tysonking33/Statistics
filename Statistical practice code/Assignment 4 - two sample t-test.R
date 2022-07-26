library(readxl)

#set working directory
setwd("~/R")

#getting data
movies <- read_xlsx("movies.xlsx")

#histogram
hist(movies$imdb[movies$genre == 'Drama'],
     main = "A histogram showing the frequency
     imdb rating on different Drama movies",
     xlab = "Imdb rating")

hist(movies$imdb[movies$genre == 'Horror'],
     main = "A histogram showing the frequency
     imdb rating on different Horror movies",
     xlab = "Imdb rating")

#median
median(movies$imdb[movies$genre == 'Drama'])

mean(movies$imdb[movies$genre == 'Horror'])

#IQR
IQR(movies$imdb[movies$genre == 'Drama'])

sd(movies$imdb[movies$genre == 'Horror'])


par(mfrow = c(1,2)) #to compare distribution

#making a boxplot
boxplot(imdb ~ genre, data = movies)

#running a two sample t test
t.test(imdb ~ genre, data = movies)

#making qq-plots to check for normality
#qqnorm(movies$imdb[movies$genre == 'Drama'])
qqnorm(movies$imdb[movies$genre == 'Horror'])

#putting a line in the qq-plot
#qqline(movies$imdb[movies$genre == 'Drama'])
qqline(movies$imdb[movies$genre == 'Horror'])
