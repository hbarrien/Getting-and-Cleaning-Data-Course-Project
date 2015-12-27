# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
# The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers 
# on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data 
# set as described below, 2) a link to a Github repository with your script for performing the analysis, 
# and 3) a code book that describes the variables, the data, and any transformations or work that you 
# performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with 
# your scripts. This repo explains how all of the scripts work and how they are connected.  

# You should create one R script called run_analysis.R that does the following. 
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
#
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.

library(data.table)
library(dplyr)

# Variables
subJectColumnName  <- "Subject"
activityColumnName <- 'Activity'

# Set the download URL, the download directory name, the downloaded zip file name, and resulting (unzipped) data directory name
dataDownloadURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
downloadDir     <- paste0(getwd(), "/get&cleandata/ucihar/")
downloadZipName <- paste0(downloadDir, "data.zip")
dataDirName     <- paste0(downloadDir, "data")

# Make sure the download directory exists
if (!file.exists(downloadDir))
  dir.create(downloadDir)

# Download and unzip the data files. Overwrite exisiting file, if any
download.file(dataDownloadURL, destfile=downloadZipName)
unzip(zipfile=downloadZipName, exdir=dataDirName)

# Set the working directory name for this project
projectWD <- paste0(downloadDir, "data/UCI HAR Dataset/")

# Read the Features and Activitiy Labels file names
featuresFname <- paste0(projectWD, "features.txt")
featuresDT    <- read.table(featuresFname)

activityLabelsFname <- paste0(projectWD, "activity_labels.txt")
activityLabelsDT    <- read.table(activityLabelsFname)

# Set the train Subjects, Activity, and Data file names
trainSubjectsFname <- paste0(projectWD, "train/subject_train.txt")
trainActivityFname <- paste0(projectWD, "train/y_train.txt")
trainSetFname      <- paste0(projectWD, "train/X_train.txt")

# Read train files
trainSubjectsDT <- read.table(trainSubjectsFname)
trainActivityDT <- read.table(trainActivityFname)
trainSetDT      <- read.table(trainSetFname)

# Change the train Subjects and Activity column names
colnames(trainSubjectsDT) <- subJectColumnName
colnames(trainActivityDT) <- activityColumnName

# Use descriptive activity names to name the activities in the data set
trainActivityDT$Activity <- as.factor(trainActivityDT$Activity)
levels(trainActivityDT$Activity) <- activityLabelsDT$V2

# Change train data set column names
colnames(trainSetDT) <- featuresDT$V2

# Column-bind the train Subjects, Activity, and Data files
trainMerge <- cbind(trainSubjectsDT, trainActivityDT, trainSetDT)

# Set the test Subjects, Activity, and Data file names
testSubjectsFname <- paste0(projectWD, "test/subject_test.txt")
testActivityFname <- paste0(projectWD, "test/y_test.txt")
testSetFname      <- paste0(projectWD, "test/X_test.txt")

# Read test files
testSubjectsDT <- read.table(testSubjectsFname)
testActivityDT <- read.table(testActivityFname)
testSetDT      <- read.table(testSetFname)

# Change the test Subjects and Activity column names
colnames(testSubjectsDT) <- subJectColumnName
colnames(testActivityDT) <- activityColumnName

# Use descriptive activity names to name the activities in the data set
testActivityDT$Activity <- as.factor(testActivityDT$Activity)
levels(testActivityDT$Activity) <- activityLabelsDT$V2

# Change test data set column names
colnames(testSetDT) <- featuresDT$V2

# Column-bind the test Subjects, Activity, and Data files
testMerge <- cbind(testSubjectsDT, testActivityDT, testSetDT)

# Merge the train and test data tables
mergedDT <- rbind(trainMerge, testMerge, all = TRUE)

# Remove Activity NAs reported during the merge
x <- !is.na(mergedDT$Activity)
mergedDT <- mergedDT[x,]

# Extract the means and standard deviations features for each measurement
features    <- grep("(.*[m|M]ean.*)|(.*[s|S]td.*)", featuresDT[,2], value = TRUE)
features    <- append(c("Subject", "Activity"), features)
extractedDT <- mergedDT[,features]

# Appropriately label the data set with descriptive variable names
names(extractedDT) <- gsub("^t", "time", names(extractedDT))
names(extractedDT) <- gsub("^f", "frequency", names(extractedDT))
names(extractedDT) <- gsub("Acc", "Accelerator", names(extractedDT))
names(extractedDT) <- gsub("AccJerk", "AcceleratorJerk", names(extractedDT))
names(extractedDT) <- gsub("Gyro", "Gyroscope", names(extractedDT))
names(extractedDT) <- gsub("GyroJerk", "GyroscopeJerk", names(extractedDT))
names(extractedDT) <- gsub("BodyBody", "Body", names(extractedDT))
names(extractedDT) <- gsub("Mag", "Magnitude", names(extractedDT))
names(extractedDT) <- gsub("\\(t", "\\(time", names(extractedDT))
names(extractedDT) <- gsub("std", "StdDev", names(extractedDT))
names(extractedDT) <- gsub("mean", "Mean", names(extractedDT))
names(extractedDT) <- gsub("\\(\\)", "", names(extractedDT))

# From the data set in step 4, creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject
tidyData <- aggregate(. ~Subject + Activity, extractedDT, mean)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]

tidyDataFname <- paste0(projectWD, "tidydata.txt")
write.table(tidyData, file = tidyDataFname, row.names = FALSE)
