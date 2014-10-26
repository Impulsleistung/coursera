#plot1.R
library(data.table)

# The calculation goes here
if(TRUE) {
  NEI <- NEI_DT[, year:=as.factor(year)]
  rm(NEI_DT)
  setkey(NEI,Emissions,year)
  erg<-NEI[,list(PM25=sum(Emissions)),by=year]    
}
png(file = "plot1.png", bg = "white")
plot(  x = erg$year,  y = erg$PM25 ,type="n"  ,   ylab = "PM_2.5", xlab = "Year")
lines(  x = erg$year,  y = erg$PM25 ,type="b")
dev.off()