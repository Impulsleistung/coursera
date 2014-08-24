# Questions Walktrough
library(jpeg)
setwd("/home/impulsleistung/Dokumente/coursera_git/03_GettingCleaningData/")

if(FALSE) {
  # Nur eine Testbench
  set.seed(13435)
  X<-data.frame("var1"=sample(1:5), "var2"=sample(6:10),"var3"=sample(11:15))
  X<-X[sample(1:5),  ]; X$var2[c(1,3)]=NA
}

# DF_q1$ACR  = 3 Größe
# DF_q1$AGS = 6 Selling
agricultureLogical<-(DF_q1$ACR == 3 & DF_q1$AGS == 6)
erg_q1<-which(agricultureLogical==TRUE)
erg_q2<-quantile(x = DF_q2,probs = c(0.3,0.8))

#DF_q3_country$V1 Das ist der Index

if(TRUE) {
  # read.csv(file, header = TRUE, sep = ",", quote="\"", dec=".", fill = TRUE, comment.char="", ...)
  discFile_q3_country<-"data_q3/file_q3_country.csv"
  discFile_q3_edu<-"data_q3/file_q3_edu.csv"
  DF_q3_country<-read.table(file = discFile_q3_country,header = FALSE, sep = ",",skip = 5,quote = "\"",stringsAsFactors = FALSE)
  DF_q3_edu<-read.table(file = discFile_q3_edu,header = TRUE, sep = ",",quote = "\"",stringsAsFactors = FALSE)
  DF_q3_country$V5<-as.numeric(gsub(",","", DF_q3_country$V5)) 
  DF_MRG<-merge(x = DF_q3_country,y = DF_q3_edu,by.x = "V1",by.y = "CountryCode",all.y = TRUE)
  erg_q3<-DF_MRG[order(DF_MRG$V5),]
  
}

#clean
DF_MRG$V2<-as.numeric(DF_MRG$V2)
erg_q3<-DF_MRG[order(DF_MRG$V2),]
erg_q3<-erg_q3[which(erg_q3$V2>0),]
# GDP mean of ranking
# "High income: OECD"
# "High income: nonOECD"

v_high__OECD<-erg_q3[(erg_q3$Income.Group=="High income: OECD"),]
v_high_nOECD<-erg_q3[(erg_q3$Income.Group=="High income: nonOECD"),]
v_low_mid_in<-erg_q3[(erg_q3$Income.Group=="Lower middle income"),]
