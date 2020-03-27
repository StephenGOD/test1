getwd()
library(tidyverse)
ggplot2::diamonds
view(diamonds)

ggplot(diamonds, aes(cut, stat(prop), group = 1)) + #convert the graph in percentage
  geom_bar()


ggplot(diamonds) +
  stat_count(mapping = aes(cut))

ggplot(diamonds) +
  stat_summary(mapping = aes(cut, depth),
               fun.min = min,
               fun.max = max,
               fun= median)

ggplot(diamonds, aes(carat)) +
  geom_histogram(bins = 500) #bandwidth

ggplot(diamonds) +
  geom_pointrange(mapping = aes(cut, depth, fill = cut ),
                  fun.min = min,
                  fun.max = max,
                  fun = median,
                  stat = "summary") #stat is necessary, as default is identity, we need summary of the data

ggplot(diamonds, aes(cut, stat(prop), group = 1)) + #can try what if exclude group = 1
  geom_bar(aes(fill = cut))

ggplot(diamonds) +
  geom_bar(aes(cut, fill = clarity, alpha = 1/5),
           position = "fill")

ggplot(diamonds, aes(cut, colour = clarity)) +
  geom_bar(fill = NA, position = "identity")

ggplot(diamonds, aes(cut, fill = clarity)) +
  geom_bar(alpha = 0.5
           , position = "fill") # position "fill", makes the height the same

ggplot(diamonds, aes(cut, fill = clarity)) +
  geom_bar(alpha = 0.5
           , position = "dodge")

ggplot(diamonds, aes(cut, fill = clarity)) +
  geom_bar(position = "fill")


