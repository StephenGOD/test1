library(faraway)
getwd()
counts <- read.csv("data/GSE60450_GeneLevel_Normalized(CPM.and.TMM)_data.csv")
sort(counts$GSM1480291)
summary(counts)

library(tidyverse)

ggplot2::mpg
ggplot(data = mpg, aes(x = displ,
                       y = hwy),
       color = displ) +
  geom_point() +
  labs(title = "Does car with big engines use more fuel")
view(mpg)

#aesthetic mapping, map a 3rd variable to the graph
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ,
                           y = hwy,
                           color = class))  #aesthetic/ visual property of the graph

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ,
                           y = hwy,
                           alpha = class)) #alpha= controls the transparency of the dot

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ,
                           y = hwy,
                           shape = class)) # R only up to 6 diff shape, beyond that will get unplotted


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ,
                           y = hwy,
                           ),
             colour = "Blue",
             shape = 14) #assign the aesthetic property manually, the colour doesnt convey any var


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ,
                           y = hwy,
                           color = blue)) #color should be outside aes

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ,
                           y = hwy,
                           stroke = )) #color should be outside aes

ggplot(mpg, aes(displ, hwy)) +
  geom_point(shape = 21, colour = "red", fill = "blue", size = 5, stroke = 2)

ggplot(mpg, aes(displ, hwy, colour = hwy < 25)) + # set a condition, use colour to diff them
  geom_point()

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(~class, nrow = 2)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_grid(cyl ~ drv) # subplots with 2 more vars, row*col

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_grid(. ~ drv) #if only want 1 more var instead of 2

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl)) +
  facet_grid(drv ~ cyl) #row

getwd()
setwd("E:\R courses")
library(tidyverse)

#geometric objects
ggplot(mpg, aes(displ, hwy, group= drv)) + #separate according to drv
  geom_smooth()

ggplot(mpg, aes(displ, hwy, linetype= drv)) + #separate according to drv
  geom_smooth()

ggplot(mpg, aes(displ, hwy, color= drv)) + #separate according to drv
  geom_smooth()

#display multi-geoms in same plot
ggplot(mpg, aes(displ, hwy)) + #global mapping
  geom_point(aes(color = class)) + #local mapping
  geom_smooth()

ggplot(mpg, aes(displ, hwy)) + #global mapping
  geom_point(aes(color = class)) + #local mapping
  geom_smooth(data = filter(mpg, class == "subcompact"), #only show subcompact car, subset of class
              se= TRUE)

ggplot(mpg, aes(displ, hwy)) +
  geom_point(position = "jitter") +
  geom_smooth(aes(linetype = drv), se = FALSE)











