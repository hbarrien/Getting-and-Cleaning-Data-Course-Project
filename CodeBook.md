# Code Book

## Project name
Collecting, working with, and cleaning a data set  

## Context description
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.  
  
A full description is available at the site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

## Date
2015-12-27  

## Data download information
Data URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
Data directory: data/UCI HAR Dataset/

## Files
a) General definitions
  * **features.txt:** contains the variable names for both train and test data sets
  * **activity_labels.txt:** contains the names of the measured activities performed by the train and test subjects (e.g., WALKING, SITTING, STANDING, etc.)
  * **features_info.txt:** contains a description of the train and test data set variables
  * **README.txt:** the data set code book

b) Train data  
  * **train/subject_train.txt:** contains the subject identifiers for each obervation in the train data set  
  * **train/y_train.txt:** contains the activity identifiers for each obervation in the train data set  
  * **train/X_train.txt:** contains the train data set in 561 variables  

c) Test data  
  * **test/subject_train.txt:** contains the subject identifiers for each obervation in the test data set  
  * **test/y_train.txt:** contains the activity identifiers for each obervation in the test data set  
  * **test/X_train.txt:** contains the test data set in 561 variables  
  
d) Tidy data
  * **tidydata.txt:** from the extracted data frame containing means and standard deviations, this file contains the average of each variable for each activity and each subject
  
## R script variables
  * **featuresDT:** contains the test and train variable names
  * **activityLabelsDT:** contains the activity names
  * **trainSubjectsDT:** contains the subject identifiers for each observation in trainSetDT
  * **trainActivityDT:** contains the activity identifiers for each observation in trainSetDT
  * **trainSetDT:** contains the train data in 561 variables
  * **trainMerge:** contains the merged train data in 563 variables (the original 561 plus the subject and activity variables)
  * **testSubjectsDT:** contains the subject identifiers for each observation in testSetDT
  * **testActivityDT:** contains the activity identifiers for each observation in testSetDT
  * **testSetDT:** contains the test data in 561 variables
  * **testMerge:** contains the merged test data in 563 variables (the original 561 plus the subject and activity variables)
  * **mergedDT:** contains a data merge involving trainMerge and testMerge
  * **extractedDT:** contains an extract from mergedDT, composed of the subject and activity variables plus all mean and standard deviation variables
  * **tidyData:** contains a report extracted from extractedDT
