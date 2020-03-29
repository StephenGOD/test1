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

#coordinate sys
ggplot(mpg, aes(class, hwy)) +
  geom_boxplot()+
  coord_flip() #flip x&y

#coord_polar
ggplot2::diamonds

bar <- ggplot(diamonds) +
  geom_bar(
    aes(cut, fill = cut),
    show.legend = FALSE,
    width = 1) +
  labs(x = NULL, y = NULL)+
  theme(aspect.ratio = 1)

bar+coord_map()

bar1 <- bar + coord_flip() + labs(title = "Bar")
bar2 <- bar + coord_polar() + labs(title = "Polar")

library(gridExtra)
grid.arrange(bar1, bar2, ncol=2)

unfixed <- ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  labs(title = "UNFIXED")


fixed <- ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed(ratio = 1) + #fixed the ratio of x+y axis
  labs(title = "FIXED,ratio=1")

grid.arrange(unfixed, fixed, ncol=2)
ggsave("unfixed vs fixed.pdf",
       plot = grid.arrange(unfixed, fixed, ncol=2))


ggplot2::diamonds
ggplot(diamonds, aes(cut, fill = cut)) +
  stat_count(show.legend = F)+
  labs(x=NULL, y=NULL)+
  coord_flip()






