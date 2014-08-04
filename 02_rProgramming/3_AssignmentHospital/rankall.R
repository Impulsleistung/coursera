rankall<-function(outcome, num="best") {
  
  # Definitions
  setwd(dir = "/home/impulsleistung/Dokumente/coursera_git//02_rProgramming/3_AssignmentHospital/")
  x_pwd<-getwd()
  x_file_hospital<-"data/hospital-data.csv"
  x_file_outcome<-"data/outcome-of-care-measures.csv"
  qual_crit<-num
  # Definition of search
  h_att_11<-list(type="heart attack",col=11,short="heartAttac")   # EQUAL2 - 11
  h_fai_17<-list(type="heart failure", col=17,short="heartFail")  # EQUAL2 - 17
  h_pne_23<-list(type="pneumonia",col=23,short="heartPneu")      # EQUAL2 - 23
  
  # Get all data in raw
  dat_outcome<-read.csv(file = x_file_outcome  ,header = TRUE ,sep = ",", colClasses = "character")
  
  # Folgende Spalten werden bei outcome benötigt:  # - Provider Number, Hospital Name, State, 11, 17, 23
  dat_outcome<-data.frame(provider=as.numeric(dat_outcome$Provider.Number),
                          out_name=as.character(dat_outcome$Hospital.Name),
                          heartAttac=as.numeric(dat_outcome[,h_att_11$col]),
                          heartFail=as.numeric(dat_outcome[,h_fai_17$col]),
                          heartPneu=as.numeric(dat_outcome[,h_pne_23$col]),
                          out_state=as.factor(dat_outcome$State), stringsAsFactors = FALSE)
  
  # Plausi OUTCOME
  if(outcome=="heart failure") {
    outcome<-h_fai_17
  } else if (outcome=="heart attack") {
    outcome<-h_att_11
  } else if (outcome=="pneumonia") {
    outcome<-h_pne_23
  } else {
    outcome<-NA
    stop("invalid outcome")
  }
  
  dat_split_out<-split(x = dat_outcome,f = dat_outcome$out_state)
  
  erg_df<-forEachSate(dat_outcome = dat_outcome,
                      qual_crit = qual_crit,
                      outcome = outcome,
                      dat_split_out = dat_split_out)
  
  erg_df[,c("hospital", "state")]   
}