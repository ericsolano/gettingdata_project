

##########################################################################
#### Getting and Cleaning Data
##########################################################################
library(dplyr)
library(plyr)
library(reshape2)

########################################################################
## 1. Merge the training and the test sets to create one data set.

## 2. Extract only the measurements on the mean and standard deviation for each measurement. 

## 3. Use descriptive activity names to name the activities in the data set.

## 4. Appropriately label the data set with descriptive variable names. 
########################################################################

# 1.1. read label files

activity <- read.table("UCI HAR Dataset/activity_labels.txt", sep=" ", header=FALSE,
                       col.names=c("activity_id", "activity_name"))


featnames <- read.table("UCI HAR Dataset/features.txt", sep=" ", header=FALSE, col.names=c("feature_id", "feature_name"))


#----------------------------------------------------
##            TEST FILES
#----------------------------------------------------
# 1.2 read TEST feature files

#--- subject id
subjectid <- read.table("UCI HAR Dataset/test/subject_test.txt", sep=" ", header=FALSE, col.names=c("subject_id"))
ntestrows <-nrow(subjectid)
subjectid$record_id <- seq.int(ntestrows)
subjectid <- subjectid[,c(2,1)]

#--- activ id
activid <- read.table("UCI HAR Dataset/test/y_test.txt", sep=" ", header=FALSE, col.names=c("activity_id"))
activid <- inner_join(activid, activity, by="activity_id")
activid$record_id <- seq.int(ntestrows)

#--- features
fcolnames <- as.character(featnames$feature_name)
mean_std <- grepl("mean", fcolnames) | grepl("std", fcolnames)

selcolClasses <- ifelse(mean_std, "numeric", "NULL")

features <- read.table("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE, 
                       colClasses=selcolClasses, 
                       col.names=fcolnames)
features$record_id <- seq.int(ntestrows)


### merge all data test frames
dfList <- list(subjectid, activid, features)
test_data_set <- join_all(dfList)
#--- add column with test vs train id
test_data_set$partition <- "test"



#----------------------------------------------------
##            TRAIN FILES
#----------------------------------------------------
# 1.3 read train feature files



#--- subject id
subjectid <- read.table("UCI HAR Dataset/train/subject_train.txt", sep=" ", header=FALSE, col.names=c("subject_id"))
ntrainrows <-nrow(subjectid)
trainids <- seq.int(nrow(test_data_set)+1,nrow(test_data_set)+ntrainrows,1)
subjectid$record_id <- trainids
subjectid <- subjectid[,c(2,1)]

#--- activity id
activid <- read.table("UCI HAR Dataset/train/y_train.txt", sep=" ", header=FALSE, col.names=c("activity_id"))
activid <- inner_join(activid, activity, by="activity_id")
activid$record_id <- trainids

#--- features
fcolnames <- as.character(featnames$feature_name)
features <- read.table("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE,  
                       colClasses=selcolClasses, 
                       col.names=fcolnames)
features$record_id <- trainids


### merge all data train frames
dfList <- list(subjectid, activid, features)
train_data_set <- join_all(dfList)
#--- add column with train vs train id
train_data_set$partition <- "train"

###-- merge datasets
HumanActivityRecognition <- merge(test_data_set, train_data_set, all=TRUE)

write.table(HumanActivityRecognition, file="HumanActivityRecognition.csv", row.names=FALSE, sep=",")


#############################################################################################
##  5. From the data set in step 4, create a second, independent tidy data set with the average 
#      of each variable for each activity and each subject.
#############################################################################################

## new column names
f <- list(subject_id=HumanActivityRecognition$subject_id, activity_id=HumanActivityRecognition$activity_id)
HumanActivityRecognition2 <- aggregate(HumanActivityRecognition[,c(5:83)], f, mean)
## add activity name
HumanActivityRecognition2 <- inner_join(HumanActivityRecognition2, activity, by="activity_id")



