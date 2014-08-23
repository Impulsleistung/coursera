# Questions Walktrough
rm(list=ls())
library(xlsx)
library(XML)
library(jsonlite)
library(data.table)
library(DBI)
library(RMySQL)
setwd("/home/impulsleistung/Dokumente/coursera_git/03_GettingCleaningData/")

if(!file.exists("data")) {
  dir.create("data")
}

file_q1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
file_q2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
file_q4<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
file_q5<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
discFile_q1<-"./data/q1_dat.csv"
discFile_q2<-"./data/q2_dat.xlsx"
discFile_q4<-"./data/q4_dat.xml"
discFile_q5<-"./data/q5_dat.csv"

# Runterladen
if(FALSE) {
  download.file(file_q1, discFile_q1, method = "wget",quiet = TRUE)
  download.file(file_q2, discFile_q2, method = "wget",quiet = TRUE)
  download.file(file_q4, discFile_q4, method = "wget",quiet = TRUE)
  download.file(file_q5, discFile_q5, method = "wget",quiet = TRUE)
}

dat_q1<-read.table(discFile_q1,sep=",",header=TRUE, stringsAsFactors = FALSE)
dat_q2<-read.xlsx(file = discFile_q2,sheetIndex = 1,startRow = 18,endRow = 23,colIndex = c(7:15))
dat<-dat_q2
# erg<-dat_q1$VAL>23
# erg<-erg*1
# erg<-na.exclude(erg)


dat_xml<-xmlInternalTreeParse(discFile_q4)
rootNode<-xmlRoot(dat_xml)
all_zips<-xpathApply(rootNode, "//zipcode" ,xmlValue)
all_zips<-all_zips==21231
all_zips<-all_zips*1

DT<-fread(discFile_q5)

A1<-system.time(tapply(DT$pwgtp15,DT$SEX,mean))
A2<-system.time(mean(DT$pwgtp15,by=DT$SEX))
A3<-system.time(DT[,mean(pwgtp15),by=SEX])
A5<-system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))

