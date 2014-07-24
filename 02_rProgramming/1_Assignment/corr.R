corr <- function(directory, threshold = 0) {
  source("complete.R")
  m_complete<-complete("specdata")
  
  setwd(dir = "/home/impulsleistung/Dokumente/coursera_git//02_rProgramming//1_Assignment")
  x_path<-directory
  # Alle Dateien lokalisieren
  x_files<-dir(path = x_path,recursive = FALSE)
  x_files<-list(x_files)
  
  m_tres<- subset(x = m_complete,subset = m_complete$nobs>threshold, select = id)
  m_tres<-as.vector(as.matrix(m_tres))
  
  x_selectedFiles<-x_files[[1]][m_tres]
  
  for(i in x_selectedFiles) {
    x_targetFile<-paste(x_path,i,sep = "/")  
    dat<-read.csv(file = x_targetFile,header = TRUE,sep = ",",quote = "\"")
    dat<-dat[complete.cases(dat),]
    cor_single<-cor(x = dat$sulfate,y = dat$nitrate)
    if(!exists("corr_vec")) {
      corr_vec<-cor_single;
    }
    else {
      corr_vec<-c(corr_vec,cor_single)
    }
  }
  
  if(!exists("corr_vec")) {
    corr_vec<-vector('numeric');
  }
  
  round(corr_vec,digits = 5)
  
  
  
}