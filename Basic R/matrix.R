#Matrix
library(tidyverse)
A <- matrix(
  c(1,2,3,4,5,6),
  nrow = 2,
  ncol = 3,
  byrow = T)
A
A[2,3] #row*col
A[2, ] #2nd row
A[ ,3] #3rd col
A[ ,c(1,3)] #col1+ col3

#name rows+ col
dimnames(A)= list(
  c("row1", "row2"),
  c("col1", "col2", "col3")
)
A["row1", "col1"]

B <- matrix(
  c(2,3,4,5,6,10),
  nrow = 3,
  ncol = 2,
  byrow = T
)
view(B)
B[ ,2]
dimnames(B)=list(
  c("row1", "row2", "row3"),
  c("col1", "col2")
)
B["row2", "col1"]
t(B) #exchange number of rows with col 3*2 => 2*3

C <- matrix(
  c(7,4,2),
  nrow = 3,
  ncol = 1,
  byrow = T
)
cbind(B,C) #combind if 2 matrices have same #row

D <- matrix(
  c(1,2),
  nrow= 1,
  ncol=2,
  byrow = T
)
rbind(B,D) #combine if 2 matrices have same #col

c(B) #deconstruct B col by col
view(B)




