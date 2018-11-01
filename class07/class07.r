#recisit rescale function
source("http://tinyurl.com/rescale-R")
rescale(1:10)
rescale2(c(1,5,"string"))
#bothna
x <- c( 1, 2, NA, 3, NA)
y <- c(NA, 3, NA, 3,  4)
is.na(x)
is.na(y)
is.na(x)&is.na(y)
sum(is.na(x)&is.na(y))
both_na <- function(x, y) {
  sum( is.na(x) & is.na(y) )
}
#error testing
x <-  c(NA, NA, NA)
y1 <- c( 1, NA, NA)
y2 <- c( 1, NA, NA, NA)
both_na(x, y2)
both_na2 <- function(x, y) {
  if(length(x) != length(y)) {
    stop("Input x and y should be the same length")
  }
  sum( is.na(x) & is.na(y) )
}
#recycling demo
rbind(x,c(y2,y2))
#bothna3

both_na3 <- function(x, y) {
  if(length(x) != length(y)) {
    stop("Input x and y should be vectors of the same length")
  }
  na.in.both <- ( is.na(x) & is.na(y) )
  na.number  <- sum(na.in.both)
  na.which   <- which(na.in.both)
  message("Found ", na.number, " NA's at position(s):", 
          paste(na.which, collapse=", ") ) 
  return( list(number=na.number, which=na.which) )
}
# gene problem
x <- df1$IDs
y <- df2$IDs

intersect(x,y)
inds <- x%in%y
y[y%in%x]
df1[df1$IDs %in% df2$IDs,]
