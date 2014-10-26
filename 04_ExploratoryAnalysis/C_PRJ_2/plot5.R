#plot5.R
# Which SCC's contain motor vehicles?
library(data.table)
if(TRUE) {
  erg<-SCC[grep("vehicle", SCC$Short.Name,ignore.case = TRUE), ]
  erg_tabs<-as.numeric(as.character(erg$SCC))
  unique_SCC_motor<-unique(erg_tabs)
  NEI_motor<-data.table(subset(NEI_DT, SCC %in% unique_SCC_motor))
  NEI_motor_baltimore<-data.table(subset(NEI_motor, fips %in% "24510"))
  
  #rm(NEI_DT,SCC,erg,erg_tabs)
}

# # The calculation goes here
# if(TRUE) {
#   NEI_motor <- NEI_motor[, year:=as.factor(year)]
#   setkey(NEI_motor,Emissions,year)
#   erg<-NEI_motor[,list(PM25=sum(Emissions)),by=year]    
# }
# #png(file = "plot4.png", bg = "white")
# plot(  x = erg$year,  y = erg$PM25 ,type="n"  ,   ylab = "PM_2.5 of Coal Combustion related", xlab = "Year")
# lines(  x = erg$year,  y = erg$PM25 ,type="b")
# #dev.off()