
rm(list=ls())
# Definitions
setwd(dir = "/home/impulsleistung/Dokumente/coursera_git//02_rProgramming//1_Assignment")
x_pwd<-getwd()
x_path<-"specdata"
#x_customRange<-c(20:23) #läuft
x_customRange<-c(1:10)
x_pollutant<-"sulfate"
DBG_variante<-1 # Das ist die Richtige
# Alle Dateien lokalisieren
x_files<-dir(path = x_path,recursive = FALSE)
x_files<-list(x_files)

x_selectedFiles<-x_files[[1]][x_customRange]


## Von jedem File die Matrix
if(DBG_variante==1) {
  for(i in x_selectedFiles) {
    print(i)
    x_targetFile<-paste(x_path,i,sep = "/")
    
    dat<-read.csv(file = x_targetFile,header = TRUE,sep = ",",quote = "\"")
    
    if(!exists("erg_mat")) {
      erg_mat<-dat
    }
    else {
      erg_mat<-rbind(erg_mat,dat)
    }
  }
}

## Von jedem File der Vector
if(DBG_variante==2) {
  
}

# Von jedem File der MEAN
if(DBG_variante==3) {
  for(i in x_selectedFiles) {
    print(i)
    x_targetFile<-paste(x_path,i,sep = "/")
    #isAvailable<-file.exists(x_targetFile)
    dat<-read.csv(file = x_targetFile,header = TRUE,sep = ",",quote = "\"")
    erg<-colMeans(x = dat[,c("sulfate","nitrate")],na.rm = TRUE)
    if(!exists("erg_mat")) {
      erg_mat<-matrix(data = erg,nrow = 1,ncol = 2)
      colnames(erg_mat)<-c("sulfate","nitrate")
    }
    else {
      erg_mat<-rbind(erg_mat,matrix(data = erg,nrow = 1,ncol = 2))
    }
  }
}
erg_frame<-data.frame(erg_mat)
# Achtung, gefordert wird aber nur der MEANwert von Sulfat oder Nitrat
x_pol_vec<-with(erg_frame,get(x_pollutant))
rm("dat", "erg_frame", "erg_mat")
# In der letzten Zeile steht das Endergebnis
x_resultNR<-mean(x = x_pol_vec,na.rm = TRUE)
round(x_resultNR,digits = 3)
