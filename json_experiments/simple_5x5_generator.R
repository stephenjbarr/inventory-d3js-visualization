library(cumplyr)
library(rjson)


x   = 1:5
y   = 1:5
pts = cartesian_product(c('x','y'))
d1 = cbind(pts, runif(nrow(pts),min=0,max=1), 1)
d2 = cbind(pts, runif(nrow(pts),min=0,max=4), 2)
colnames(d1) = colnames(d2) = c("x","y","val","k")
d  = rbind(d1,d2)
colnames(d) <-  c("si", "wi", "cost", "k")

quote <- function(x) { paste("\"", x, "\"", sep="")}
jsrow <- function(x) { cat(paste(
    "{",
    paste(quote(names(x)),x, sep=":", collapse=", "),
    "}\n"))}

apply(d,1,jsrow)

