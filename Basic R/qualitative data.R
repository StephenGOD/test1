getwd()
library(MASS)
library(tidyverse)
painters
view(painters)
painters$School
painters["School"]
school_ferq= table(painters$School)
ggplot(painters, aes(School, fill = School)) +
  geom_bar(show.legend = F)+
  geom_text(stat = "count", aes(label= ..count..), vjust=-0.5)


summary(painters$School)
summary(painters$Composition)
Composition <- table(painters$Composition)
c <- painters$Composition
c.freq <- table(c)
c.freq
cbind(c.freq)
ggplot(painters, aes(Composition))+
  geom_bar(color = "red")+
  geom_text(stat = "count", aes(label= ..count..), vjust=-0.5)

#relative freq
school_relfreq <-  school_ferq/ nrow(painters)
old <- options(digits = 1)
cbind(school_relfreq)

composition_relfreq <- c.freq/ nrow(painters)  
cbind(composition_relfreq)

#bar plot
barplot(table(painters$School))
barplot(table(painters$Composition))

#pie chart
pie(school_ferq, main = "Distribution of School")
