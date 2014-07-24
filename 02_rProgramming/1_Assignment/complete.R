complete <- function(directory, id = 1:332) {

  # Argumente
  x_path<-directory
  x_customRange<-id
  
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
    m_compl<-complete.cases(dat)
    m_compl<-m_compl*1
    x_complete_single<-sum(m_compl)
    
    if(!exists("compl_mat")) {
                      compl_mat<-data.frame(id=x_customRange[compl_counter],nobs=x_complete_single)    
    }
    else {
      compl_mat<-rbind(compl_mat,data.frame(id=x_customRange[compl_counter],nobs=x_complete_single))
    }  
  }
  
  compl_mat
}