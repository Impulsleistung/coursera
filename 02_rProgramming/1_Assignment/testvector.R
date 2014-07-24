rm(list=ls())

source("corr.R")
source("complete.R")
cr <- corr("specdata",2000)
summary(cr)
head(cr)