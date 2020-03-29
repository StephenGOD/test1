library(nycflights13)
library(tidyverse)
nycflights13::flights
view(flights)
head(flights)
summary(flights$flight)

#dplyr
#filter
filter(flights, month == 1, day == 2)

#comparison
#<, <=, >,>=, != (not equal to), == (equal to)
1/2 ==1
1/2 *2 ==1
sqrt(2)^2 ==2
near(sqrt(2)^2, 2) #approximation

#logical operator
#&= and, |= or, !=not, xor()= exclude the overlap
filter(flights, month == 11 | month == 12)

nov_dec <- filter(flights, month %in% c(11,12)) # x %in% y= select every row where x is in one of the value in y

filter(flights, !(arr_delay>120 & dep_delay>120))
filter(flights, !arr_delay>120 & !dep_delay>120)
    #delay no greater than 120min

is.na(yiwen) #determine if the obj is defined

view(flights)

#exercise
filter(flights, !arr_delay<120)
filter(flights, dest %in% c("IAH", "HOU")) # "string"
filter(flights, month %in% c(7:9)) #from july to sep, = 7,8,9
filter(flights, arr_delay>120 & dep_delay <= 0)
filter(flights, dep_time %in% c(0000:0600))

filter(flights, between(month, 7,9)) #new arg, between, used for numerical data

is.na(NA&F)

#arrange rows 
arrange(flights, year, month, day)
arrange(flights, desc(dep_delay))

df <- tibble(x=c(2,5,NA))
arrange(df, x)
arrange(df, desc(x)) #look the position of NA, always in the end

#exercise
arrange(df, desc(is.na(x)))
arrange(flights, dep_delay)
arrange(flights, desc(distance/hour*60+minute))
view(arrange(flights, desc(air_time)))

flights %>%
  arrange(-air_time) %>%
  select(carrier, flight, air_time)

#select
select(flights, year, month, day, carrier)
select(flights, year:day)
select(flights, -(year:day)) #exclude year:day

rename(flights, tail_num = tailnum) #be careful with how u put it, tail_num= new name, tailnum=old name
select(flights, dep_delay, arr_delay, everything()) #put the 2 var in front of others
select(flights, contains("delay"))
select(flights, contains("delay"), ends_with("time"), -starts_with("sched"), -starts_with("air"))

vars <- c("year", "month", "day", "dep_delay", "arr_delay")
select(flights, one_of(vars)) #same as select 'year:day+ dep_delay+ arr_delay

select(flights, contains("TIME")) #case insensitive
select(flights, contains("Time",ignore.case = F ))

#mutate= add new var
flights_sml <- select(flights,
                      year:day, 
                      ends_with("delay"), 
                      distance, 
                      air_time)
mutate(flights_sml,
       gain = dep_delay - arr_delay,
       speed= distance/ (air_time*60),
       gain_per_hour= gain/speed
       )

#if only want the new vars created
transmute(flights,
          gain = dep_delay - arr_delay,
          hours = air_time/60,
          gain_per_hour= gain/hours)

#useful creation function
transmute(flights,
          air_time,
          hour = air_time %/% 100,  #%/%= integel part
          minute = air_time %% 100) # %%= remainder part

x <- 1:10
lag(x)
lag(x,2)
lead(x)
cumsum(x)
cumprod(x)
cummin(x)
cummax(x)
cummean(x)

y <- c(1,2,2,NA,3,4,5)
min_rank(y)
row_number(y)
