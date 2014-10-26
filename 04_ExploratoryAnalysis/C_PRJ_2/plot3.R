#plot3.R
library(data.table)
library(ggplot2)
# The calculation goes here
if(TRUE) {
  NEI <- NEI_DT[, year:=as.factor(year)]
  rm(NEI_DT)
  setkey(NEI,Emissions,year,type)
  NEI_Baltimore= subset(NEI,fips=="24510")
  erg<-NEI_Baltimore[,list(PM25=sum(Emissions)),by=list(year,type)]   
  erg2<-erg[,type:=as.factor(type)]
  
  rm(NEI,NEI_Baltimore,SCC,erg)
  
}
g<-ggplot(data=erg2, aes(x=year, y=PM25)) + 
  geom_line(data = erg2, aes(group=type,color=type,linetype=type)) +
  ylab("PM25 by type in Baltimore City")
ggsave(file="plot3.png", plot=g)
