getwd()
x <- list(
  n <- c(2,3,5),
  s <- c("aa", "bb", "cc", "dd", "ee"),
  b <- c(TRUE, FALSE, TRUE, FALSE, FALSE),
  3
)
x[2]
x[4]
x[c(2,4)]

y <- list(n,s,b,4)
y[[2]][1] = "stephen"
y[2] # compare the diff w s
s #value in s didnt change to stephen

v <- list(bob = c(2,3,5), john = c("aa", "bb"))
v$bob
attach(v) #attach a list to R search path
bob #can refer to bob without refering to v
detach(v) #need to detach v from search path for clearing uo

#data.frame
mtcars
mtcars[1,2]
nrow(mtcars)
ncol(mtcars)

mtcars[[9]]# refer to col9 with [[]]
mtcars$am
mtcars$mpg
mtcars["mpg"]
library(tidyverse)
library(dplyr)
select(mtcars, "mpg", "hp")
mtcars[c("Datsun 710", "Camaro Z28"), ]

#logical indexing
L = mtcars$am == 0
L
view(mtcars)
mtcars[L, ] #cars with am=0
mtcars[L, ]$mpg #car's mpg with am=0
