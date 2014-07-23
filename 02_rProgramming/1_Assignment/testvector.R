
rm(list=ls())
# Definitions
setwd(dir = "/home/impulsleistung/Dokumente/coursera_git//02_rProgramming//1_Assignment")
x_pwd<-getwd()
x_path<-"specdata"
x_customRange<-c(20:23)

# Alle Dateien lokalisieren
x_files<-dir(path = x_path,recursive = TRUE)
x_files<-list(x_files)

x_selectedFiles<-x_files[[1]][x_customRange]

# Test einzelnen Import
# CSV-Typ: Komma und " als Trenner
x_targetFile<-paste(x_path,x_selectedFiles[2],sep = "/")
file.exists(x_targetFile)
dat<-read.csv(file = x_targetFile,header = TRUE,sep = ",",quote = "\"")
colMeans(x = dat[2:3],na.rm = TRUE)

for(i in x_selectedFiles) {
  print(i)
  x_targetFile<-paste(x_path,i,sep = "/")
  isAvailable<-file.exists(x_targetFile)
  dat<-read.csv(file = x_targetFile,header = TRUE,sep = ",",quote = "\"")
  erg<-colMeans(x = dat[,c("sulfate","nitrate")],na.rm = TRUE)
  erg_mat<-matrix(data = erg,nrow = 1,ncol = 2)
  print(erg)
}

