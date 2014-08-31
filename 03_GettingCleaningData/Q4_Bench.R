# Q4_Bench
# rm(list=ls())
library(data.table)
library(quantmod)
library(lubridate)
setwd("/home/impulsleistung/Dokumente/coursera_git/03_GettingCleaningData/")

if(!file.exists("data_q4/")) {
  dir.create("data_q4/")
}

disc_file_q1_MIC     <- "data_q4/file_q1_MIC.csv"
disc_file_q2_q4_GDP  <- "data_q4/file_q2_q4_GDP.csv"
disc_file_q4_EDU     <- "data_q4/file_q4_EDU.csv"

if(FALSE) {
  file_q1_MIC<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  file_q2_q4_GDP<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  file_q4_EDU<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
  
  download.file(file_q1_MIC, disc_file_q1_MIC, method = "wget",quiet = TRUE)
  download.file(file_q2_q4_GDP, disc_file_q2_q4_GDP, method = "wget",quiet = TRUE)
  download.file(file_q4_EDU, disc_file_q4_EDU, method = "wget",quiet = TRUE)
}
if(TRUE) {
  DT_MIC<-fread(input = disc_file_q1_MIC)
  DT_GDP<-fread(input = disc_file_q2_q4_GDP)
  DT_EDU<-fread(input = disc_file_q4_EDU)
}
#setkey(DT_EDU,CountryCode)
#setkey(DT_GDP,V1)
mic_name<-colnames(DT_MIC)
# Q1 Solution
spli1<-strsplit(x = mic_name,split = "wgtp")

# Bereinigen
DT_GDP$V2<-as.numeric(DT_GDP$V2)
DT_GDP<-DT_GDP[complete.cases(DT_GDP$V2)]
DT_GDP$V5<-gsub(",","",DT_GDP$V5)
DT_GDP$V5<-as.numeric(DT_GDP$V5)
# Q2 solution
mean(DT_GDP$V5)

# Q3 Solution
grep(pattern = "^United",x = DT_GDP$V4)

# Q4, set keys
DF_EDU<- data.frame(DT_EDU)
DF_GDP<- data.frame(DT_GDP)
DF_M<-merge(x = DF_EDU,y = DF_GDP,by.x = "CountryCode",by.y = "V1")
# Q4 solution
erg<-grep(pattern = "Fiscal(.*)June*",x = DF_M$Special.Notes)

# Q5
amzn = getSymbols("AMZN",auto.assign = FALSE)
DF_AMZ<-data.frame(amzn)
rowN_amz<-rownames(DF_AMZ)
erg_rows<-grep(pattern = "2012",x = rowN_amz)
erg_set<-rowN_amz[erg_rows]
# Q5 Where are the Mondays
erg_date<-as.Date(erg_set)
str<-weekdays.Date(erg_date)
monday_set<-grep(pattern = "Montag",x = str)