## The script for course project of Getting and Cleaning Data course.
## Preparing tidy data from UCI HAR Dataset.

## Put this script near UCI HAR Dataset folder and run it without parameters
## or run it by specifying "pathname" as path to dir wich include 
## UCI HAR Dataset dir. Put "/" at the end of pathname.

## This script uses dplyr package (must be installed).

run_analysis <- function(pathname = "") {
        
        library(dplyr)
        library(reshape2)
        
## 0. Getting data

        path <- paste(pathname, "UCI HAR Dataset/", sep = "")
        xtest <- read.table(paste(path, "test/X_test.txt", sep = ""))
        xtrain <- read.table(paste(path, "train/X_train.txt", sep = ""))
        ytest <- read.table(paste(path, "test/Y_test.txt", sep = ""))
        ytrain <- read.table(paste(path, "train/Y_train.txt", sep = ""))
        stest <- read.table(paste(path, "test/subject_test.txt", sep = ""))
        strain <- read.table(paste(path, "train/subject_train.txt", sep = ""))
        actlabels <- read.table(paste(path, "activity_labels.txt", sep = ""))
        features <- read.table(paste(path, "features.txt", sep = ""))
        
## 1. Merging the training and the test sets to create one data set
        
        X <- rbind(xtest, xtrain) 

## 2. Extracting only the measurements on the mean and standard deviation 
## for each measurement and naming variables. 
        
        m <- grep("mean()", features[, 2], fixed = TRUE)
        s <- grep("std()", features[, 2], fixed = TRUE)
        ext <- sort(c(m, s))
        
        X <- X[, ext]
                
## 3. Merging subjects and activities with dataset and naming the activities in it

        Y <- rbind(ytest, ytrain)       # activity numbers
        S <- rbind(stest, strain)       # subject
        A <- actlabels$V2[Y$V1]         # activity names
        DS <- cbind(S, A, X)            # big data set

## 4. Naming columns (variables) of DataSet

        col_names <- c("Subject", "Activity", as.character(features[ext, 2]))
        names(DS) <- col_names

## 5. Creating a second, independent tidy data set with the average 
## of each variable for each activity and each subject
        
        RES <- group_by(DS, Subject, Activity)
        RES <- summarise_each(RES, funs(mean))
                
## Result

        RES
}