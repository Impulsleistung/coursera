# Testbench for HospitalQuality
###############################
rm(list = ls())
source("rankall.R")
source("forEachSate.R")
source("doWithErg.R")
#options(warn=-1)
graphics.off()
# Call arguments
print (    head(rankall(outcome = "heart attack",num = 20),10)   )
print (    tail(rankall(outcome = "pneumonia",num = "worst"),3)  )
print (    tail(rankall(outcome = "heart failure"),10)  )