# Preprocessing the data
rm(list=ls())
options(warn=-1)
library(data.table)
library(lubridate)
#
# 
# IMPORTANT set the path to the file with the data
largeFile_NEI<-"/home/impulsleistung/Dokumente/Coursera_largeData/exdata-data-NEI_data/summarySCC_PM25.rds"
largeFile_SCC<-"/home/impulsleistung/Dokumente/Coursera_largeData/exdata-data-NEI_data/Source_Classification_Code.rds"
# Check the external data source
if(!file.exists(largeFile_NEI)) {
  stop("Data does not exist")
}
setwd(dir = "/home//impulsleistung/Dokumente/coursera_git/04_ExploratoryAnalysis/C_PRJ_2/")
NEI<-readRDS(file = largeFile_NEI)
SCC<-readRDS(file = largeFile_SCC)
NEI_DT<-data.table(NEI)
rm(NEI)
