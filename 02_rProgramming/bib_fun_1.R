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

f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}