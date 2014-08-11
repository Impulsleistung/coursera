
# Testbench
rm(list=ls())
library(xlsx)
library(XML)
library(jsonlite)
setwd("/home/impulsleistung/Dokumente/coursera_git/03_GettingCleaningData/")

# Dateien herunterladen
# Die Seite ist: https://data.baltimorecity.gov/Transportation/Baltimore-Fixed-Speed-Cameras/dz54-2aru

if(!file.exists("data")) {
  dir.create("data")
}
fileUrl_CSV<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
fileUrl_XLSX<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
fileUrl_JSON<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.json?accessType=DOWNLOAD"
fileUrl_XML<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xml?accessType=DOWNLOAD"
file_ONLINE_XML<-"http://www.w3schools.com/xml/simple.xml"
file_COMPLX_JSON<-"https://api.github.com/users/impulsleistung/repos"
discFile_CSV  <- "./data/cameras.csv"
discFile_XLSX <- "./data/cameras.xlsx"
discFile_JSON <- "./data/cameras.json"
discFile_XML  <- "./data/cameras.xml"

# Runterladen
if(FALSE) {
  download.file(fileUrl_CSV,  discFile_CSV, method = "wget",quiet = TRUE)
  download.file(fileUrl_XLSX, discFile_XLSX, method = "wget",quiet = TRUE)
  download.file(fileUrl_JSON, discFile_JSON, method = "wget",quiet = TRUE)
  download.file(fileUrl_XML,  discFile_XML, method = "wget",quiet = TRUE)
}

cameraData_CSV<-read.table(discFile_CSV,sep=",",header=TRUE, stringsAsFactors = FALSE)
cameraData_XLSX<-read.xlsx2(file = discFile_XLSX,sheetIndex = 1)

# Einfache XML Operationen
if(FALSE) {
  xml_doc<-xmlTreeParse(file_ONLINE_XML,useInternalNodes = TRUE)
  rootNode<-xmlRoot(xml_doc)
  # Element von rootNode.2.3 mit den Tags
  print (  rootNode[[2]][[3]]   )
  # Den Baum durchparsen
  print (  xmlSApply(rootNode, xmlValue)  ) 
  # Element von rootNode.2.3 ohne Tags
  print (  xmlValue(rootNode[[2]][[3]])   )  
}

data_JSON<-fromJSON(txt = file_COMPLX_JSON)
