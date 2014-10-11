#AS1bnech
rm(list=ls())
options(warn=-1)
library(data.table)
library(lubridate)
setwd("/home/impulsleistung/Dokumente/coursera_git//04_ExploratoryAnalysis")
largeFile<-"/home/impulsleistung/Dokumente/Coursera_largeData/household_power_consumption.txt"
# Check the external data source
if(!file.exists(largeFile)) {
  stop("Data does not exist")
}

# For algo opti, I extract the head of the large data set
DT_RAW<-fread(input = largeFile,na.strings = '?')
# The first two cols have to be corrected in type

DT_RAW<-transform(DT_RAW,Global_active_power  =as.numeric(DT_RAW$Global_active_power))
DT_RAW<-transform(DT_RAW,Global_reactive_power=as.numeric(DT_RAW$Global_reactive_power))
DT_RAW<-transform(DT_RAW,Voltage              =as.numeric(DT_RAW$Voltage))
DT_RAW<-transform(DT_RAW,Global_intensity     =as.numeric(DT_RAW$Global_intensity))
DT_RAW<-transform(DT_RAW,Sub_metering_1       =as.numeric(DT_RAW$Sub_metering_1))
DT_RAW<-transform(DT_RAW,Sub_metering_2       =as.numeric(DT_RAW$Sub_metering_2))
DT_RAW<-transform(DT_RAW,Sub_metering_3       =as.numeric(DT_RAW$Sub_metering_3))


DT_RAW<- DT_RAW[, POSIX_DATE:=paste(DT_RAW$Date,DT_RAW$Time,sep = " ")]
DT_RAW<- DT_RAW[, POSIX_DATE:=dmy_hms(DT_RAW$POSIX_DATE)]
# Delete what not needed
DT_RAW<- DT_RAW[, Date:=NULL]
DT_RAW<- DT_RAW[, Time:=NULL]
# Clean the NA'S in an elegant way
DT_COMP<-na.exclude(DT_RAW)
# Extract the desired range
startDate<-ymd("2007-02-01")
endDate<-ymd("2007-02-03")
DT_TARGET_SET<-subset(DT_COMP, POSIX_DATE >= startDate & POSIX_DATE < endDate)
rm(DT_COMP,DT_RAW,endDate,startDate,largeFile)