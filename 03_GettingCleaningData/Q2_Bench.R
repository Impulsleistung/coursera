# Questions Walktrough
rm(list=ls())
library(xlsx)
library(XML)
library(jsonlite)
library(data.table)
library(DBI)
library(RMySQL)
library(sqldf)
setwd("/home/impulsleistung/Dokumente/coursera_git/03_GettingCleaningData/")

if(!file.exists("data")) {
  dir.create("data")
}

file_q1<-"https://api.github.com/users/jtleek/repos" # JSON, Data
file_q2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
file_q4<-"http://biostat.jhsph.edu/~jleek/contact.html"
file_q5<-"https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
discFile_q1<-"./data/q1_dat.json"
discFile_q2<-"./data/q2_dat.csv"
discFile_q4<-"./data/q4_dat.html"
discFile_q5<-"./data/q5_dat.for"

# Runterladen
if(TRUE) {
  download.file(file_q1, discFile_q1, method = "wget",quiet = TRUE)
  download.file(file_q2, discFile_q2, method = "wget",quiet = TRUE)
  download.file(file_q5, discFile_q5, method = "wget",quiet = TRUE)
  download.file(file_q4, discFile_q4, method = "wget",quiet = TRUE)
}

if(FALSE) {
  data_json<-fromJSON(txt = file_q1)
  data_json[data_json$name=="datasharing",c("name","created_at")]
  acs<-read.csv.sql(discFile_q2)
}

# ja geil, das ist echt der Hammer
sst<-read.fwf(   file=discFile_q5,   skip=4,   widths=c(12, 7,4, 9,4, 9,4, 9,4))


lll<-readLines(con = discFile_q4)
erg<-nchar(x = lll[c(10,20,30,100)],type = "chars")