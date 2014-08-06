# Testbench
rm(list=ls())
setwd("/home/impulsleistung/Dokumente/coursera_git/03_GettingCleaningData/")

# Dateien herunterladen

if(!file.exists("data")) {
  dir.create("data")
}
fileUrl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
discFile <- "./data/cameras.csv"

# Runterladen
download.file(fileUrl, discFile, method = "wget",quiet = TRUE)

