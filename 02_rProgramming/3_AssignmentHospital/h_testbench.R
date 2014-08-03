# Testbench for HospitalQuality
###############################
rm(list=ls())
#options(warn=-1)
graphics.off()
# Call arguments
state<-""
outcome<-""

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
state<-"MD"
outcome<-"heart attack"

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
  print("False outcome")
}

# Plausi STATES
if (!is.element(el = state,set = dat_outcome$out_state)) {
  state<-NA
  print("False state")
}

# Now, that everything is fine, get the tapply
out_byState<-split(x = dat_outcome,f = dat_outcome$out_state)
out_byState<-out_byState[[state]]

#dynamic
if(qual_crit=="best") {
  res<-head(out_byState[order(out_byState[outcome$short]),])
} else if(qual_crit=="worst") {
  res<-head(out_byState[order(-out_byState[outcome$short]),])
} else {
  res<-NA
  print("False criteria")
}

print(res[1,"out_name"])
