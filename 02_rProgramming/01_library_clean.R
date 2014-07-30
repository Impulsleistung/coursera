#Operative Funktionen

# Datensatz laden
dat<-read.table(unz("rprog-data-quiz1_data.zip","hw1_data.csv"), sep = ",",header = TRUE,quote = "\"")

# --Prüfungsfragen
# - Wie viele Zeilen haben einen ungültigen Wert (Ozon)
good_dat<-dat[complete.cases(dat),]
dim(good_dat)

# - Mittelwert jeder Spalte
colMeans(x = dat, na.rm = TRUE)

# - Mittelwert eines Subset (Solar.R bei Ozon>31 && Temp>90)
dat_sub <- subset(x = good_dat, subset = good_dat$Oz>31 & good_dat$Te>90)
colMeans(x = dat_sub)
# - Maximalwert einer Spalte (Ozon im Monat Mai)
dat_sub <- subset(x = good_dat, subset = good_dat$Month==5)
max(dat_sub$Ozone)

# Statische Funktionen mit Speicherobjekten
make.f <- function() {
  count <- 0 # Speichervariable
  # Wenn die Funktion instanziert wurde ist "x" der Übergabeparameter
  f <- function(x) {
    count <<- count + 1 # Die statische Variable des übergeordneten Frame schreiben
    return( list(mean=mean(x), count=count) ) # Das Rückgabeobjekt geht in den übergeordneten Frame
  }
  return( f ) # Erst hier geht das Rückgabeobjekt in den Workspace
}

f1<-make.f()
result<-f1(1:10)
result<-f1(1:10)

# Dieser Prototyp hat Konstruktorvariablen
# Dies ist aber nur eine intelligente Datenstruktur
makeVector <- function(x = numeric()) {
  m <- NULL
  # Die Konstruktorvariable x und die Variable m sind statisch
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() 
    x
  # Diese Funktion wird von aussen Aufgerufen
  setmean <- function(mean) 
    m <<- mean
  getmean <- function() 
    m
  # Damit die Funktionen wie Variablen im Frame ansprechbar sind wird eine Liste generiert
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}
# Die Realisierung und Adressierung ist wie folgt
x<-makeVector(1:10)
x$get()
x$set(1:5)


# Die obige Datenstruktur enthält die abstrakten Funktionen $setmean und $getmean
# Die folgende Funktion wendet Routinen auf die statischen Variable m an
cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

# Loop Functrions

## For() auf matrix
m_mat<-matrix(11:16,2,3)
for(i in seq_len(nrow(m_mat))) {
  for(j in seq_len(ncol(m_mat))) {
    print(m_mat[i,j])
  }
}

#lapply Funktionen auf Listen und Vektoren
x<-1:4
lapply(x, runif)
lapply(x, runif, min=0, max = 10)


a=matrix(1:4,2,2); b=matrix(1:6,3,2)
x<-list(a,b)
doex<-function(m) {
  m[,1,drop=FALSE]
}
# Extrahiere aus allen Matrizen in der Liste nur die erste Spalte
lapply(x,doex)

# Eine Funktion auf die Dimension (Zeilen oder Spalten) einer Matrix bezogen
m<-matrix(rnorm(30),10,3)
apply(X = m,MARGIN = 1,FUN = sum) # Gibt 10 Zeilen aus mit der Summe der Spalten, rowSums
apply(X = m,MARGIN = 2,FUN = sum) # Gibt 3 Spalten aus mit der Summe der 10 Zeilen, colSums
# Für jede Zeile die Quantile berechnen
apply(X = m,MARGIN = 1,FUN = quantile, probs=c(0.25,0.75))

