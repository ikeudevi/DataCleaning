#
#Week 4 Getting and Cleaning Data Project
# 			run_analysis.R
#
#		The data for the project was downloaded from:
#		https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#		Unzipped in a directory ("UCI HAR Dataset"). The files were read and processed from this 
#		directory. Following the instructions, this R script does the following:
#
#     1	Merges the training and the test data sets.
#     2	From this dataset, it extracts the mean and standard deviation for each measurement.
#     3	Uses descriptive names to label activities described in the data set
#     4	Uses descriptive labels for the variables names in this dataset.
#     5	From 2 & 4, it creates a second dataset; a tidy dataset with the variable means of all 
#		  activities engaged by each subject.
#     

		library("data.table")
		library(dplyr)

#	1 Read in the training and the test datasets.
#
    TrainSubjects <- read.table(file.path("train/subject_train.txt"))
    TrainValues <- read.table(file.path("train/X_train.txt"))
    TrainingActivity <- read.table(file.path("train/y_train.txt"))
#
    TestSubjects <- read.table(file.path("test/subject_test.txt"))
    TestValues <- read.table(file.path("test/X_test.txt"))
    TestActivity <- read.table(file.path("test/y_test.txt"))
#Features and the activity lables
    DataFeatures <- read.table(file.path("features.txt"), as.is = TRUE)
    ActivityData <- read.table(file.path("activity_labels.txt"))
#
#use column names to describe the activity variables. 
    
    colnames(ActivityData) <- c("activityID", "activityLabel")
  
#
# 2 Merge the training and the test datasets. With column binding, bind the training and the test 
#   datasets respectively; then use row binding to merge them. name the resulting dataset as 
#   ExerciseData
#
    TrainingData  <- cbind(TrainSubjects, TrainValues, TrainingActivity)
    TestingData   <- cbind(TestSubjects, TestValues, TestActivity)
    ExerciseData <- rbind(TrainingData,TestingData)
#
# Assign column names to this new dataset
# 
    colnames(ExerciseData) <- c("subject",  DataFeatures[, 2], "activity")
#    View(ExerciseData)
#
# 3 Extract the mean and standard deviation of each measurement.
#   
   mean_and_sd_columns <- grepl("subject|activity|mean|std", colnames(ExerciseData))
   ExerciseData <- ExerciseData[, mean_and_sd_columns]
#   View(ExerciseData)
#
# 4 Use Descriptive names to label the dataset 
# 
   ExerciseData$activity <- factor(ExerciseData$activity, levels = ActivityData[, 1], labels = ActivityData[, 2])
#
# 5 Remove all special characters in the columnnames and then use descriptive variable names for
#   the variables in the dataset.
#
   ActivityColumns   <- colnames(ExerciseData)
   ActivityColumns   <- gsub("[\\(\\)-]", "", ActivityColumns)
   ActivityColumns   <- gsub("Acc", "Accelerometer",ActivityColumns )
   ActivityColumns   <- gsub("Gyro", "Gyroscope", ActivityColumns)
   ActivityColumns   <- gsub("Mag", "Magnitude", ActivityColumns)
   ActivityColumns   <- gsub("Freq", "Frequency", ActivityColumns)
   ActivityColumns   <- gsub("mean", "Mean", ActivityColumns)
   ActivityColumns   <- gsub("std", "StdDeviation", ActivityColumns)
   ActivityColumns   <- gsub("BodyBody", "HumanBody", ActivityColumns)
   ActivityColumns   <- gsub("^f", "FreqDomain", ActivityColumns)
   ActivityColumns   <- gsub("^t", "Time", ActivityColumns)
   
#
   colnames(ExerciseData) <- ActivityColumns
  #View(ExerciseData)
   
#   
# 6 From this dataset, extract a tidy dataset that consists of the mean value of each variable
#   for each activity in the dataset. 
#
   TidyData  <- ExerciseData %>% group_by(subject, activity) %>% summarise_all(funs(mean))
#
# 7 Output this tidy dataset as a text file
#
   write.table(TidyData, "tidy_data.txt", quote = FALSE, row.names = FALSE) 
 #View(TidyData)
 
 