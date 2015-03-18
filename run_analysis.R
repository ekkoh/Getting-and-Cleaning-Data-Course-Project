#
# Coursera Data Science Specializations
#   Getting and Cleaning Data
#   Course Project
#
# Data source:
#   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# Requirements
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#

library(dplyr)
library(reshape2)

files.exist <- function()
{
	#
	# Check that all the required files are present
	#
	if (!file.exists("train/X_train.txt") || 
	    !file.exists("train/y_train.txt") ||
	    !file.exists("train/subject_train.txt") ||
	    !file.exists("test/X_test.txt") ||
	    !file.exists("test/y_test.txt") ||
	    !file.exists("test/subject_test.txt") ||
	    !file.exists("features.txt") ||
	    !file.exists("activity_labels.txt"))
	{
		print("Please refer to README.md on the data file requirements")
		FALSE
	}
	else
		TRUE
}

file.read<-function(fullpathname)
{
	#
	# same settings for reading all the files
	#
	read.csv(fullpathname, sep="", header=FALSE)
}


if (files.exist())
{
	#
	# Read in the raw data
	#
	x_train<-file.read("train/X_train.txt")
	y_train<-file.read("train/y_train.txt")
	subject_train<-file.read("train/subject_train.txt")

	x_test<-file.read("test/X_test.txt")
	y_test<-file.read("test/y_test.txt")
	subject_test<-file.read("test/subject_test.txt")

	features<-file.read("features.txt")
	activity_labels<-file.read("activity_labels.txt")

	#
	# Assign column names to datasets
	#
	colnames(subject_test)<-"subjectid"
	colnames(y_test)<-"activityid"
	colnames(subject_train)<-"subjectid"
	colnames(y_train)<-"activityid"

	#
	# 1. Merges the training and the test sets to create one data set.
	#
	x_consolidate<-rbind(x_train, x_test)
	y_consolidate<-rbind(y_train, y_test)
	subject_consolidate<-bind_rows(subject_train, subject_test)

	rm(x_train)
	rm(x_test)
	rm(y_train)
	rm(y_test)
	rm(subject_train)
	rm(subject_test)

	#
	# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
	#
	mean_list<-grep("mean", features[,2], ignore.case=TRUE)
	std_list<-grep("std", features[,2], ignore.case=TRUE)
	meanfreq_list<-grep("meanfreq", features[,2], ignore.case=TRUE)
	angle_list<-grep("angle", features[,2], ignore.case=TRUE)
	features_selected<-sort(c(mean_list, std_list))
	features_selected<-features_selected%>%setdiff(meanfreq_list)%>%setdiff(angle_list)
	x_selected<-x_consolidate[,features_selected]
	rm(mean_list)
	rm(std_list)
	rm(meanfreq_list)
	rm(angle_list)

	#
	# 3. Uses descriptive activity names to name the activities in the data set
	#
	activity<-factor(y_consolidate[,1], labels=tolower(activity_labels[,2]))

	#
	# 4. Appropriately labels the data set with descriptive variable names. 
	#
	x_colnames<-make.names(features[,2])
	x_colnames<-sub('^t','time', x_colnames)
	x_colnames<-sub('^f', 'freq', x_colnames)
	x_colnames<-tolower(gsub('.', '', x_colnames, fixed=TRUE))
	colnames(x_selected)<-x_colnames[features_selected]

	colnames(subject_consolidate)<-"subjectid"
	x<-cbind(subject_consolidate, activity, x_selected)

#
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#

	x_dt<-tbl_df(x) %>% group_by(subjectid, activity)
	x_melt<-melt(x_dt, id=c("subjectid", "activity"))
	x_clean_data<-dcast(x_melt, subjectid + activity ~ variable, mean)
	View(x_clean_data)


	x_dt<-tbl_df(x) %>%
	group_by(subjectid, activity)
	x_names<-names(x_dt[c(-1, -2)])
	dots<-sapply(x_names, function(x) substitute(mean(x), list(x=as.name(x))))
	x_summary<-do.call(summarize, c(list(.data=x_dt), dots))
	View(x_summary)

}
