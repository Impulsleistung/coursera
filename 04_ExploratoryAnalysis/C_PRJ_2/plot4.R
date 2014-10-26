#plot4.R
# Which SCC's contain coal?
library(data.table)
if(TRUE) {
  erg<-SCC[grep("Coal", SCC$Short.Name,ignore.case = TRUE), ]
  erg_tabs<-as.numeric(as.character(erg$SCC))
  unique_SCC_coal<-unique(erg_tabs)
  NEI_coal<-data.table(subset(NEI_DT, SCC %in% unique_SCC_coal))
  #rm(NEI_DT,SCC,erg,erg_tabs)
}
# The calculation goes here
if(TRUE) {
  NEI_coal <- NEI_coal[, year:=as.factor(year)]
  setkey(NEI_coal,Emissions,year)
  erg<-NEI_coal[,list(PM25=sum(Emissions)),by=year]    
}
png(file = "plot4.png", bg = "white")
plot(  x = erg$year,  y = erg$PM25 ,type="n"  ,   ylab = "PM_2.5 of Coal Combustion related", xlab = "Year")
lines(  x = erg$year,  y = erg$PM25 ,type="b")
dev.off()