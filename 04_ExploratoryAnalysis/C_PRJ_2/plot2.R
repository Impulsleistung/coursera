#plot2.R
library(data.table)

# The calculation goes here
if(TRUE) {
  NEI <- NEI_DT[, year:=as.factor(year)]
  rm(NEI_DT)
  setkey(NEI,Emissions,year)
   
}
NEI_Baltimore= subset(NEI,fips=="24510")
erg<-NEI_Baltimore[,list(PM25=sum(Emissions)),by=year]   
png(file = "plot2.png", bg = "white")
plot(  x = erg$year,  y = erg$PM25 ,type="n"  ,   ylab = "PM_2.5 in Baltimore", xlab = "Year")
lines(  x = erg$year,  y = erg$PM25 ,type="b")
dev.off()