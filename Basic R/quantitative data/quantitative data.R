head(faithful)
library(tidyverse)
ggplot(faithful, aes(eruptions, waiting))+
  geom_point()+
  geom_abline()

duration <- faithful$eruptions #define eruptions
range(duration) #find the range of the data set
breaks <- seq(1.5,5.5, by=0.5) #set up subset according to interval, by 0.5
duration_cut <- cut(duration, breaks,right = F) #cut the "duration" according to the "breaks", right =F means close on left, open on right
(duration_freq <- table(duration_cut)) #show the freq of duraiton in each interval
cbind(duration_freq)

waiting_time <- faithful$waiting
range(waiting_time)
breaks <- seq(40, 100, by=10)
waiting_time_cut <- cut(waiting_time, breaks, right = F)
waiting_time_freq <- table(waiting_time_cut)
cbind(waiting_time_freq)

eurption_duration <- hist(duration, xlim= c(1,6), ylim= c(0,1),breaks = 5, probability = T, 
     main = "duration of valcano eruptions") #how to change x/y axis
lines(density(duration))

waiting_duration <- hist(waiting_time,xlim = c(40,100), ylim = c(0,70), breaks = 10)

par(mfrow= c(2,2))
plot(eurption_duration)
plot(waiting_duration)

#relative freq
real_duration_freq= duration_freq/ nrow(faithful)
old = options(digits = 1)
cbind(duration_freq, real_duration_freq)

real_waiting_time <- waiting_time_freq/ nrow(faithful)
cbind(waiting_time_freq, real_waiting_time)

#cumulative freq
duration_cumfreq <- cumsum (duration_freq)
cbind(duration_freq, duration_cumfreq)

waiting_cumfreq <- cumsum(waiting_time_freq)
cbind(waiting_time_freq, waiting_cumfreq)

cumfreq0 <- c(0, duration_cumfreq)
plot(breaks, cumfreq0,
     main = "Cumulative freq of eruption duration",
     xlab = "duration time",
     ylab = "cumulative eruptions",
     ylim = c(0,300))
lines(breaks, cumfreq0)

cum_waiting_freq0 <- c(0, waiting_cumfreq)
plot(breaks_1, cum_waiting_freq0,
     main = "Cumulative waiting time",
     xlab = "Waiting time",
     ylab = "Cumulative time")
lines(breaks_1, cum_waiting_freq0)

#cumulative relative freq
duration_cumrelfreq <- duration_cumfreq/ nrow(faithful)
waiting_cumrelfreq <- waiting_cumfreq/ nrow(faithful)

options(old)
old = options(digits = 1)
cbind(duration_cumfreq, duration_cumrelfreq)
cbind(waiting_cumfreq, waiting_cumrelfreq)

duration_relcumfreq0 <- c(0, duration_cumrelfreq)
plot(breaks, duration_relcumfreq0,
     main = "Relative CumFreq of duration",
     xlab = "Duration Time",
     ylab = "RelCum Freq")
lines(breaks, duration_relcumfreq0)

waiting_relcumfreq0 <- c(0, waiting_cumrelfreq)
plot(breaks_1, waiting_relcumfreq0,
     main = "RelCum waiting freq",
     xlab = "Waiting time",
     ylab = "RelCum Freq")
lines(breaks_1, waiting_relcumfreq0)

#ECDF, no need to compute relative cumulative freq first
fn <- ecdf(duration)
plot(fn,
     main= "ECDF of duration time",
     xlab= "duration time",
     ylab = "cumulative relFreq")

fn1 <- ecdf(waiting_time)
plot(fn1,
     main="ECDF of waiting time",
     xlab= "waiting time",
     ylab= "cumulative relFreq")

#stem leaf plot
stem(duration)

#scatterplot
plot(duration, waiting_time,
     main = "Eruption duration vs waiting time",
     xlab = "Eruption duration",
     ylab = "time waited")
abline(lm(waiting_time~duration)) # lm(y~x)
