forEachSate<-function(dat_outcome,qual_crit,outcome,dat_split_out) {
  
  # For each state, find the hospital of the given rank
  # rankall("pneumonia", "worst")
  
#   # Plausi STATES
#   if (!is.element(el = state,set = dat_outcome$out_state)) {
#     state<-NA
#     stop("invalid state")
#   }
  
  erg_df<-data.frame(hospital=as.character(), rate=as.numeric(), state=as.character())
  
  for (stateSet in dat_split_out) {
    # Wichtig: Sortierreihenfolge, Zuerst Rang, dann Name
    erg<-stateSet[order(stateSet[outcome$short], stateSet$out_name),]
    erg<-erg[,c("out_name",outcome$short,"out_state")]
    erg<-na.exclude(erg)
    colnames(erg)<-c("hospital","rate","state")
    single_res<-doWithErg(erg = erg,qual_crit = qual_crit,stateSet = stateSet)
    erg_df<-rbind(erg_df, single_res)
  }
  
  erg_df
}