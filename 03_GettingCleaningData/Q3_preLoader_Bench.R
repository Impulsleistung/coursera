# Questions Walktrough
rm(list=ls())
library(jpeg)
setwd("/home/impulsleistung/Dokumente/coursera_git/03_GettingCleaningData/")

if(!file.exists("data_q3/")) {
  dir.create("data_q3/")
}

file_q1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
file_q2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
file_q3_country<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
file_q3_edu<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

discFile_q1<-"data_q3/file_q1.csv"
discFile_q2<-"data_q3/file_q2.jpg"
discFile_q3_country<-"data_q3/file_q3_country.csv"
discFile_q3_edu<-"data_q3/file_q3_edu.csv"

# Runterladen
if(FALSE) {
  download.file(file_q1,discFile_q1 , method = "wget",quiet = TRUE)
  download.file(file_q2, discFile_q2, method = "wget",quiet = TRUE)
  download.file(file_q3_country,discFile_q3_country , method = "wget",quiet = TRUE)
  download.file(file_q3_edu, discFile_q3_edu, method = "wget",quiet = TRUE)
}

rm(... = "file_q1","file_q2","file_q3_country","file_q3_edu")

#Einlesen
if(TRUE) {
  DF_q1<-read.csv(file = discFile_q1)
  DF_q2<-readJPEG(discFile_q2,native = TRUE)
  DF_q3_country<-read.csv(file = discFile_q3_country)
  DF_q3_edu<-read.csv(file = discFile_q3_edu)
}

rm(... = "discFile_q1","discFile_q2","discFile_q3_country","discFile_q3_edu")