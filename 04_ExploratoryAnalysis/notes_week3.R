## Hierarchical clustering
rm(list=ls())
set.seed(1234)
par(mar=c(1,3,3,1))
# Aufbau von drei Clustern mit je 4 Elementen
x<-rnorm(12, mean=rep(1:3,each=4),sd=0.2)
y<-rnorm(12, mean=rep(c(1,2,1),each=4),sd=0.2)
plot(x,y,col="blue",pch=19,cex=2)
# Punkte im plot beschriften
text(x+0.05,y+0.05,labels=as.character(1:12))
# Analyse der euklidischen Distanz
dataFrame<-data.frame(x=x,y=y)
dist(dataFrame)
# Darstellung der euklidischen Distanzen in einem Dendogram
distxy<-dist(dataFrame)
hClustering<-hclust(distxy)
plot(hClustering)

# Die Maximale Distanz zwischen zwei Clustern wird complete distance genannt

# Grafische Darstellung von Clustern in einer Heatmap
# Eine Heatmap ist ein 2D-Dendogram
dataMatrix<-as.matrix(dataFrame)
heatmap(dataMatrix)

## K-means Clustering
# Cluster-Schwerpunkt ist der Centroid
set.seed(1234)
x<-rnorm(12, mean=rep(1:3,each=4),sd=0.2)
y<-rnorm(12, mean=rep(c(1,2,1),each=4),sd=0.2)
# Algorithmus start
# 1. Die Position der Centroids wird geraten
# 2. Alle Punkte die am nächsten an einem Centroid liegen werden mit der
#    Farbe dieses Centroid eingefärbt
# Algorithmus n-te Iteration
# 1. Die Centroids verschieben sich in den Mittelpunkt ihrer eingefärbten Punkte
# 2. Alle Punkte die am nächsten an einem Centroid liegen werden mit der
#    Farbe dieses Centroid eingefärbt
dataFrame<-data.frame(x,y)
# Die Anzahl der Cluster muss vom Benutzer geraten werden
kmeansObj<-kmeans(dataFrame, centers=3)
# Die Zuordnung der Punkte nach Cluster
kmeansObj$cluster
# Darstellung der Kmeans
plot(x,y,col=kmeansObj$cluster,pch=19,cex=2)
points(kmeansObj$centers,col=1:3, pch=3,cex=3,lwd=3)

# Singular Value Decomposition
# https://class.coursera.org/exdata-007/lecture/55
set.seed(12345)
par(mar=rep(0.2,4))
dataMatrix<-matrix(rnorm(400), nrow=40)
image(1:10,1:40,t(dataMatrix)[,nrow(dataMatrix):1])
# Nachfolgend wird in zufälligen Zeilen ein Offset addiert
set.seed(678910)
for(i in 1:40) {
  coinFlip<-rbinom(1,size=1,prob=0.5)
  if (coinFlip) {
       dataMatrix[i,]<-dataMatrix[i,]+rep(c(0,3),each=5)
  }
}

# SVD Zerlegung einer Matrix nach ihren unabhängigen Variablen
# X=UDV wobei: X=Original, U=links_singulär, V=rechts_singulär, D=Diagonal
########
# PCA beschreibt: Bei jeder Spalte von X wird der Mittelwert abgezogen und
#  danach wird jede Spalte durch die jeweilige std.Abweichung geteilt
########
# Die Zeilen können nach ihrem Cluster neu sortiert werden
hh<-hclust(dist(dataMatrix))
dataMatrixOrdered<-dataMatrix[hh$order,]

# Beispiel einer SVD bei einer Bilddatenzerlegung

# Einstellung der Farbcodierung auf Plots