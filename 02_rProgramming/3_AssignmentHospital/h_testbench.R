# Testbench for HospitalQuality
###############################
rm(list=ls())
# Call arguments
state<-""
outcome<-""

# Definitions
setwd(dir = "/home/impulsleistung/Dokumente/coursera_git//02_rProgramming/3_AssignmentHospital/")
x_pwd<-getwd()
x_file_hospital<-"data/hospital-data.csv"
x_file_outcome<-"data/outcome-of-care-measures.csv"

# Definition of search
h_att_11<-"heart attack"   # EQUAL2 - 11
h_fai_17<-"heart failure"  # EQUAL2 - 17
h_pne_23<-"pneumonia"      # EQUAL2 - 23
qual_crit<-factor(c("best","worst"))
qual_rank<-list(rank=c(1:5))

state<-"dummy"
outcome<-"dummy"

# Get all data in raw
dat_hospital<-read.csv(file = x_file_hospital ,header = TRUE ,sep = ",", colClasses = "character")
dat_outcome<-read.csv(file = x_file_outcome  ,header = TRUE ,sep = ",", colClasses = "character")

all_states<-list(states_hos=factor(unique(dat_hospital$State)),states_out=factor(unique(dat_outcome$State)))
l_search = list(search_state=all_states, search_outcome=c(h_att_11, h_fai_17, h_pne_23), search_qCrit=qual_crit, search_TopRank<-qual_rank)

# Key is the Provider.Number

# Sort results by name

