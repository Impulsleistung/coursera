# Assignment, by Kevin Ostheimer
options(warn=-1)
library(data.table)
library(plyr)
# Debug Switches
DBG_DOWNLOAD<-FALSE
DBG_CACHE<-FALSE
DBG_MERGE_1<-FALSE

if(!file.exists("assignment_data")) {
  print("Setting up environment...")
  DBG_DOWNLOAD<-TRUE
  DBG_CACHE<-TRUE
  DBG_MERGE_1<-TRUE
  dir.create("assignment_data")
}

file_zip<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
discFile_zip<-"dataset.zip"

if(DBG_DOWNLOAD) {
  print("Downloading...")
  # wget is for LINUX
  download.file(file_zip, discFile_zip, method = "wget",quiet = TRUE)
  print("Unzipping...")
  unzip(zipfile = discFile_zip,exdir = "assignment_data/")
  rm(file_zip,discFile_zip)
}
if(DBG_CACHE) {
  print("Converting to Big Data Tables...")
  # I use Datatables, the ammount of data will be massive
  # 70% is training data
  DF_X_TRAIN<-read.table(file = "assignment_data/UCI HAR Dataset/train/X_train.txt",header = FALSE)
  # 30% is test data
  DF_X_TEST <-read.table(file = "assignment_data/UCI HAR Dataset/test/X_test.txt",header = FALSE)
  # Get it in the fast cache
  DT_X_TRAIN<-data.table(DF_X_TRAIN)
  DT_X_TEST <-data.table(DF_X_TEST )
  rm(DF_X_TEST,DF_X_TRAIN,discFile_zip,file_zip)
}
if(DBG_MERGE_1) {
  print("Getting peripheral tables and doing the main work...")
  # The subject ID of person, 30 is max
  DF_PERSON_TEST <-read.csv(file = "assignment_data/UCI HAR Dataset/test/subject_test.txt",header = FALSE)
  DF_PERSON_TRAIN<-read.csv(file = "assignment_data/UCI HAR Dataset/train/subject_train.txt",header = FALSE)
  # The activity, 6 is max
  DF_ACTIVITY_TEST<-read.csv(file = "assignment_data/UCI HAR Dataset/test/y_test.txt",header = FALSE)
  DF_ACTIVITY_TRAIN<-read.csv(file = "assignment_data/UCI HAR Dataset//train//y_train.txt",header = FALSE)
  # The description of the activity
  DESC_ACTIVITY<-read.csv(file = "assignment_data/UCI HAR Dataset//activity_labels.txt",header = FALSE,sep = " ")
  # The colnames for the big data tables
  DESC_DT<-read.csv(file = "assignment_data/UCI HAR Dataset//features.txt",header = FALSE,sep = " ")
  DESC_DT$V2<-as.character(DESC_DT$V2)
  # Give the two big data tables the colnames. There is a warning, but colnames is still safer for a reason
  colnames(DT_X_TEST) <-DESC_DT$V2
  colnames(DT_X_TRAIN)<-DESC_DT$V2
  # Now, DF_ACTIVITY_TEST and DF_ACTIVITY_TRAIN should get their real names and a proper header
  DESC_ACTIVITY$V2<-as.character(DESC_ACTIVITY$V2)
  colnames(DF_ACTIVITY_TEST)<-"activity"
  colnames(DF_ACTIVITY_TRAIN)<-"activity"
  # Bind the activity
  DT_X_TEST_BIND<-cbind(DF_ACTIVITY_TEST,DT_X_TEST)
  DT_X_TRAIN_BIND<-cbind(DF_ACTIVITY_TRAIN,DT_X_TRAIN)
  # Now we name the activity by a simple join
  colnames(DESC_ACTIVITY)<-c("V1","desc_activity")
  print("Super bindings...")
  DT_TEST_COMPLETE <-merge(x = DT_X_TEST_BIND,y = DESC_ACTIVITY, by.x = "activity",by.y = "V1")
  DT_TRAIN_COMPLETE<-merge(x = DT_X_TRAIN_BIND,y = DESC_ACTIVITY, by.x = "activity",by.y = "V1")
  print("Cleaning...")
  # Clean cache, otherwise memory explodes
  rm(DESC_ACTIVITY,DESC_DT,DF_ACTIVITY_TEST,DF_ACTIVITY_TRAIN,DF_PERSON_TEST,DF_PERSON_TRAIN,DT_X_TEST,DT_X_TEST_BIND,DT_X_TRAIN,DT_X_TRAIN_BIND)
}

print("Merging the two complete Data Table Sets...")
DT_COMPLETE_SET<-rbind(DT_TEST_COMPLETE,DT_TRAIN_COMPLETE)
print("DONE...")
