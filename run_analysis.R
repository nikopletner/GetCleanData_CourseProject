## The script for course project of Getting and Cleaning Data course.
## Preparing tidy data from UCI HAR Dataset.

## Put this script near UCI HAR Dataset folder and run it without parameters
## or run it by specifying "pathname" as path to dir wich include 
## UCI HAR Dataset dir. Put "/" at the end of pathname.

## This script uses dplyr package (must be installed).

run_analysis <- function(pathname = "") {
        
        library(dplyr)
        
## 0. Getting data

        path <- paste(pathname, "UCI HAR Dataset/", sep = "")
        xtest <- read.table(paste(path, "test/X_test.txt", sep = ""))
        xtrain <- read.table(paste(path, "train/X_train.txt", sep = ""))
        ytest <- read.table(paste(path, "test/Y_test.txt", sep = ""))
        ytrain <- read.table(paste(path, "train/Y_train.txt", sep = ""))
        stest <- read.table(paste(path, "test/subject_test.txt", sep = ""))
        strain <- read.table(paste(path, "train/subject_train.txt", sep = ""))
        actlabels <- read.table(paste(path, "activity_labels.txt", sep = ""))
        
## 1. Merging the training and the test sets to create one data set
        
        X <- rbind(xtest, xtrain)
        Y <- rbind(ytest, ytrain)
        S <- rbind(stest, strain)
        
## 2. Extracting only the measurements on the mean and standard deviation 
## for each measurement. 
        
        DataSet<- data.frame(Y, S, rowMeans(X), apply(X, 1, sd))
        
## 3. Naming the activities in the data set

        DataSet <- merge(DataSet, actlabels, sort = FALSE)
                
## 4. Subsetting, sorting and naming columns (variables)

        DataSet <- DataSet[, c(2, 5, 3, 4)]
        names(DataSet) <- c("Subject", "Activity", "Mean", "SD")
        
## 5. Creating a second, independent tidy data set with the average 
## of each variable for each activity and each subject

        RES <- group_by(DataSet, Subject, Activity)
        RES <- summarize(RES, Average.of.Means = mean(Mean), Average.of.SDs = mean(SD))
                
## Result

        RES
}