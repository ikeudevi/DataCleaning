#
#Week 4 Getting and Cleaning Data Project
#	CodeBook.md

1	The Data Source
	The data for this project was downloaded from:
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
	and unzipped in a directory ("UCI HAR Dataset").Subsequently, all relevant files were read from 
	this directory.
	
2	About The Dataset
	The data consists of data collected from 30 volunteers engaged in six different activities namely:
	WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and, LAYING. With each wearing 
	that measures each participant response under different experimental conditions.
	
3	Four files were submitted: 'tidy_data.txt', 'README.md', 'CodeBook.md', and 'run_analysis.R' file.
	The 'tidy_data.txt' may be recreated using the 'run_analysis.R' file as follows:
	
4	Read in the training, testing, subject, features and activity data values
    
	TrainSubjects <- read.table(file.path("train/subject_train.txt"))
    TrainValues <- read.table(file.path("train/X_train.txt"))
    TrainingActivity <- read.table(file.path("train/y_train.txt"))
    TestSubjects <- read.table(file.path("test/subject_test.txt"))
    TestValues <- read.table(file.path("test/X_test.txt"))
    TestActivity <- read.table(file.path("test/y_test.txt"))
    DataFeatures <- read.table(file.path("features.txt"), as.is = TRUE)
    ActivityData <- read.table(file.path("activity_labels.txt"))
	
5	Assign column names to the activity variables. 
    
6	Column bind the training datasets. Also, column bind the testing datasets. Then row bind the 
	two resulting tables (training and test data tables). 
     
7	Assign column names to the variables
	
8	Extract the mean and standard deviation of each measurement.

9	Use Descriptive names to label the dataset 
	
10	Delete the special characters in the column names and then use more descriptive 
	variable names for the variables in the dataset.
	
11	Group the resulting dataset by activity and subject and then, extract a tidy dataset that consists
	of only the mean value of each variable for each activity in the dataset for each subject and activity. 
		
12	Output this tidy dataset as a text file named 'tidy_data.txt'

13 The tidy dataset: 'tidy_data.txt' contains the following 81 numeric variables that are the average values of the 
	activities for each subject.
	
TimeBodyGyroscopeJerkMeanX                             TimeBodyGyroscopeJerkMeanY                                
TimeBodyGyroscopeJerkMeanZ                                 TimeBodyGyroscopeJerkStdDeviationX                        
TimeBodyGyroscopeJerkStdDeviationY                         TimeBodyGyroscopeJerkStdDeviationZ                        
TimeBodyAccelerometerMagnitudeMean                         TimeBodyAccelerometerMagnitudeStdDeviation                
TimeGravityAccelerometerMagnitudeMean                     TimeGravityAccelerometerMagnitudeStdDeviation             
TimeBodyAccelerometerJerkMagnitudeMean                     TimeBodyAccelerometerJerkMagnitudeStdDeviation            
TimeBodyGyroscopeMagnitudeMean                             TimeBodyGyroscopeMagnitudeStdDeviation                    
TimeBodyGyroscopeJerkMagnitudeMean                         TimeBodyGyroscopeJerkMagnitudeStdDeviation                
FreqDomainBodyAccelerometerMeanX                           FreqDomainBodyAccelerometerMeanY                          
FreqDomainBodyAccelerometerMeanZ                           FreqDomainBodyAccelerometerStdDeviationX                  
FreqDomainBodyAccelerometerStdDeviationY                  FreqDomainBodyAccelerometerStdDeviationZ                  
FreqDomainBodyAccelerometerMeanFrequencyX                  FreqDomainBodyAccelerometerMeanFrequencyY                 
FreqDomainBodyAccelerometerMeanFrequencyZ                 FreqDomainBodyAccelerometerJerkMeanX                      
FreqDomainBodyAccelerometerJerkMeanY                       FreqDomainBodyAccelerometerJerkMeanZ                      
FreqDomainBodyAccelerometerJerkStdDeviationX               FreqDomainBodyAccelerometerJerkStdDeviationY              
FreqDomainBodyAccelerometerJerkStdDeviationZ               FreqDomainBodyAccelerometerJerkMeanFrequencyX             
FreqDomainBodyAccelerometerJerkMeanFrequencyY              FreqDomainBodyAccelerometerJerkMeanFrequencyZ             
FreqDomainBodyGyroscopeMeanX                               FreqDomainBodyGyroscopeMeanY                              
FreqDomainBodyGyroscopeMeanZ                               FreqDomainBodyGyroscopeStdDeviationX                      
FreqDomainBodyGyroscopeStdDeviationY                       FreqDomainBodyGyroscopeStdDeviationZ                      
FreqDomainBodyGyroscopeMeanFrequencyX                      FreqDomainBodyGyroscopeMeanFrequencyY                     
FreqDomainBodyGyroscopeMeanFrequencyZ                      FreqDomainBodyAccelerometerMagnitudeMean                  
FreqDomainBodyAccelerometerMagnitudeStdDeviation           FreqDomainBodyAccelerometerMagnitudeMeanFrequency         
FreqDomainHumanBodyAccelerometerJerkMagnitudeMean          FreqDomainHumanBodyAccelerometerJerkMagnitudeStdDeviation 
FreqDomainHumanBodyAccelerometerJerkMagnitudeMeanFrequency  FreqDomainHumanBodyGyroscopeMagnitudeMean                 
FreqDomainHumanBodyGyroscopeMagnitudeStdDeviation          FreqDomainHumanBodyGyroscopeMagnitudeMeanFrequency        
FreqDomainHumanBodyGyroscopeJerkMagnitudeMean              FreqDomainHumanBodyGyroscopeJerkMagnitudeStdDeviation     
FreqDomainHumanBodyGyroscopeJerkMagnitudeMeanFrequency    
 
  
   
  