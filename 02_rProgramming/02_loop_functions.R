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
