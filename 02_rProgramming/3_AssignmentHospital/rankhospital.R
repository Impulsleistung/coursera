rankhospital<-function(state,outcome, num="best") {
  
  # Definitions
  setwd(dir = "/home/impulsleistung/Dokumente/coursera_git//02_rProgramming/3_AssignmentHospital/")
  x_pwd<-getwd()
  x_file_hospital<-"data/hospital-data.csv"
  x_file_outcome<-"data/outcome-of-care-measures.csv"
  
  # Definition of search
  h_att_11<-list(type="heart attack",col=11,short="heartAttac")   # EQUAL2 - 11
  h_fai_17<-list(type="heart failure", col=17,short="heartFail")  # EQUAL2 - 17
  h_pne_23<-list(type="pneumonia",col=23,short="heartPneu")      # EQUAL2 - 23
  
  qual_crit<-"best"
  
  # Get all data in raw
  dat_hospital<-read.csv(file = x_file_hospital ,header = TRUE ,sep = ",", colClasses = "character")
  dat_outcome<-read.csv(file = x_file_outcome  ,header = TRUE ,sep = ",", colClasses = "character")
  
  # Folgende Spalten werden bei hospital benötigt: # - Provider Number,  Hospital Name, State
  dat_hospital<-data.frame(provider=as.numeric(dat_hospital$Provider.Number), 
                           name=as.character(dat_hospital$Hospital.Name), 
                           state=as.factor(dat_hospital$State), stringsAsFactors = FALSE)
  
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
  
  # Plausi STATES
  if (!is.element(el = state,set = dat_outcome$out_state)) {
    state<-NA
    stop("invalid state")
  }
  
  # Now, that everything is fine, get the tapply
  out_byState<-split(x = dat_outcome,f = dat_outcome$out_state)
  out_byState<-out_byState[[state]]
  
  if(is.character(num)) {
    qual_crit<-num
  }
  
  #dynamic
  if(qual_crit=="best") {
    res<-head(out_byState[order(out_byState[outcome$short]),])
  } else if(qual_crit=="worst") {
    res<-head(out_byState[order(-out_byState[outcome$short]),])
  } else {
    res<-NA
    stop("False criteria")
  }
  
  erg<-res[,c("out_name",outcome$short)] #fixed here
  colnames(erg)<-c("Hospital.Name","Rate")
  erg<-erg[order(erg$Rate,erg$Hospital.Name),]
  
  
  erg<-na.exclude(object = erg)
  num_max<-dim(erg)[1]
  
  if(is.character(num)) {
    if(num=="best") {
      erg<-erg[1,]
    }
    else {
      erg<-erg[num_max,]
    }
  } else if(num<=num_max) {
    erg<-erg[num,]
  } else {
    return(NA)
  }
  
  erg$Hospital.Name
}

