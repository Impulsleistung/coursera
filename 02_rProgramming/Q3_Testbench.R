# Quiz 3
library(datasets)
data(iris)

s<-split(x = iris,f = iris$Species)
print(sapply(X = s,FUN = function(x) colMeans(x[, c(1:4)] ,na.rm=TRUE)))

data(mtcars)
print(sapply(split(x = mtcars$mpg,mtcars$cyl),mean))

diff_vec<-sapply(split(x = mtcars$hp,f = mtcars$cyl), mean)

print( sapply(split(x = mtcars$hp,f = mtcars$cyl), mean) )
# Es geht aber auch:
print( tapply(X = mtcars$hp,INDEX = mtcars$cyl,mean) )
