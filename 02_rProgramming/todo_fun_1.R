# Funktionen

col_mean <- function(werte_mat, removeNA = FALSE) {
  nc <- ncol(werte_mat)
  # Leeren Vektor initalisieren
  means <- numeric(nc)
  for(i in 1:nc) {
    means[i] <- mean(x = werte_mat[,i],na.rm = removeNA)    
  }
  means
}


# Teil 2

## For() auf vector()
for (i in seq_along(x))
  for(letters in x)
    
    ## For() auf matrix
    m_mat<-matrix(11:16,2,3)
for(i in seq_len(nrow(m_mat))) {
  for(j in seq_len(ncol(m_mat))) {
    print(m_mat[i,j])
  }
}

## Binominalverteilung
rbinom(10,1,0.5)

## Standardverteilung
daten<-rnorm(100)
sd(daten,na.rm = TRUE)

## Logisches Subset
above10 <- function(x) {
  use <- x > 10
  x[use]
}

## Replicating Vectors
rep(1:4,each=3,len=10)
rep(1:4,3)
A<-matrix(1:4,2,2)
B<-matrix(rep(10,4),2,2)

## Falsche Matrizenmultiplikation 
A*B
## Echte Matrizenmultiplikation 
A%*%B

## Das Datum
x<-Sys.time()
as.POSIXlt(x)
[1] "2014-07-19 21:40:23 CEST"
p<-as.POSIXlt(x)

names(unclass(p))
[1] "sec"   "min"   "hour"  "mday"  "mon"   "year"  "wday"  "yday"  "isdst"

p$sec
[1] 23.14041

## Kalendarische Operationen
Wie spät ist es gerade in NewYork, absolut, relativ

Der Interkonti-Flug von D->Singapore, Duaration 12h
Start: 5am, 10pm
Arr: ??, ??

Der Interkonti-Flug von D->SanFrancisco, Duaration 12h
Start: 5am, 10pm#
Arr: ??, ??

Wann war seit 1999 die kürzeste Wartezeit zwischen Weihnachten