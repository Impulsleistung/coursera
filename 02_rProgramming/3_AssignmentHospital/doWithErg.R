doWithErg<-function(erg,qual_crit,stateSet) {
  # Das Ergebnis aus dem set auswählen
  # qual_crit   ----   best, worst, 5
  
  if(qual_crit=="best") {
    targetLine<-1
  }
  if(is.numeric(qual_crit)) {
    targetLine<-qual_crit
  }
  if(qual_crit=="worst") {
    targetLine<-dim(erg)[1]
  }
  
  single_res<-erg[targetLine,]
  single_res$state<-as.character(stateSet$out_state[[1]])
  
  single_res
}