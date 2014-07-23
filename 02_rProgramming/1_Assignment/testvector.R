
x_path<-"specdata"
x_customRange<-c(2, 4, 8, 10, 12)
x_pollutant<-"nitrate"

# Definitions
setwd(dir = "/home/impulsleistung/Dokumente/coursera_git//02_rProgramming//1_Assignment")
x_pwd<-getwd()

# Alle Dateien lokalisieren
x_files<-dir(path = x_path,recursive = FALSE)
x_files<-list(x_files)

x_selectedFiles<-x_files[[1]][x_customRange]
compl_counter<-0
## Von jedem File die Matrix
for(i in x_selectedFiles) {
  compl_counter<-compl_counter+1
  x_targetFile<-paste(x_path,i,sep = "/")  
  dat<-read.csv(file = x_targetFile,header = TRUE,sep = ",",quote = "\"")
  if(!exists("erg_mat")) {
    erg_mat<-dat

  }
  else {
    erg_mat<-rbind(erg_mat,dat)
  }
  x_complete_fac_tab<-factor(x = complete.cases(dat))
  x_complete_mat<-table(matrix(x_complete_fac_tab))
  x_complete_mat<-matrix(x_complete_mat)
  x_complete_single<-(x_complete_mat[2,1])
  
  if(!exists("compl_mat")) {
    compl_mat<-data.frame(id=x_customRange[compl_counter],nobs=x_complete_single)
    
  }
  else {
    compl_mat<-rbind(compl_mat,data.frame(id=x_customRange[compl_counter],nobs=x_complete_single))
  }
  
}

erg_frame<-data.frame(erg_mat)
# Achtung, gefordert wird aber nur der MEANwert von Sulfat oder Nitrat
x_pol_vec<-with(erg_frame,get(x_pollutant))
compl_final<-compl_mat
rm("dat", "erg_frame", "erg_mat", "compl_mat", "x_complete_mat")
# In der letzten Zeile steht das Endergebnis
x_resultNR<-mean(x = x_pol_vec,na.rm = TRUE)
#round(x_resultNR,digits = 3) # Das war die erste Benotung
compl_final