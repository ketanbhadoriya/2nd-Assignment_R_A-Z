#Start of the Script

#Loading required packages

library(ggplot2)

#Loading the data

movie.hw <- read.csv("Section6-Homework-Data.csv")

#Exploring the Data

head(movie.hw)

tail(movie.hw)

str(movie.hw)

colnames(movie.hw)

summary(movie.hw)

levels(movie.hw$Genre)

levels(movie.hw$Studio)

#Making the data for visualization

#Filter for Genre
filter1 <- (movie.hw$Genre == "action") | (movie.hw$Genre == "adventure") |
  (movie.hw$Genre == "animation") | (movie.hw$Genre == "comedy") |
  (movie.hw$Genre == "drama")

#Filter for Studio
filter2 <- (movie.hw$Studio == "Buena Vista Studios") | (movie.hw$Studio == "WB") |
  (movie.hw$Studio == "Fox") | (movie.hw$Studio == "Universal") | (movie.hw$Studio=="Sony")|
  (movie.hw$Studio == "Paramount Pictures")

#New DataFrame
movie.hw2 <- movie.hw[filter1 & filter2,]

head(movie.hw2)

#Visualizing the Data

d <- ggplot(data=movie.hw2,aes(x=Genre,y=Gross...US))

f <- d +geom_jitter(aes(size= Budget...mill.,color=Studio)) + 
  geom_boxplot(alpha=0.6, outlier.colour = NA)

final <- f + xlab("Genre") +
             ylab("Gross % US") +
             ggtitle("Domestic Gross % by Genre") +
             theme(text = element_text(family = "Comic Sans MS"),
             axis.title = element_text(color = "Blue"),
             plot.title = element_text(size = 20))

final$labels$size = "Budget in Millions(US $)"

final

##Conclusion
# 
# * Comedy has the highest Gross % in US and Adventure the least
# * Drama has the least variation
# * Most movies made are Action

####Reference

# Please note that the above datasets, and research question has been 
# obtained from https://www.superdatascience.com/
# obtained while pursuing a course by Kirill Eremenko
