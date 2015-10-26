# CodeBook.md

# one of the Week 3 project requirements

- Read the project's requirements
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

- Get the information about the study, get the sense of what is the source or raw about from given URL
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones   

- Get the source or raw data from provided URL
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

- Download and unzip the raw data under your working directory such as 
<working_directory or wd>/data/UCI_HAR_Dataset

- Read the data from files and load into R data objects - data frame with the necessary library loaded such as 
library(data.table)
Here is the raw data file locations
features_file: <wd>/data/UCI_HAR_Dataset/features.txt
actlabel_file: <wd>/data/UCI_HAR_Dataset/activity_labels.txt
train_sub_file: <wd>/data/UCI_HAR_Dataset/train/subject_train.txt
train_set_file: <wd>/data/UCI_HAR_Dataset/train/X_train.txt
train_lab_file: <wd>/data/UCI_HAR_Dataset/train/y_train.txt
test_sub_file: <wd>/data/UCI_HAR_Dataset/test/subject_test.txt
test_set_file: <wd>/data/UCI_HAR_Dataset/test/X_test.txt
test_lab_file: <wd>/data/UCI_HAR_Dataset/test/y_test.txt
such as
train_set <- read.table(train_set_file)
tests_set <- read.table(test_set_file)

- Merge source data sets into one data set by features, activities with train and test group
useing rbind() function such as

comb_set1 <- rbind(train_set, tests_set)
comb_set2 <- rbind(train_actlab, test_actlab)
comb_set3 <- rbind(train_sbj_set, test_sbj_set)names(comb_set3)

and use names() and dim() function to verify the merge or combination

- Extracts only the measurements on the mean and standard deviation for each measurement.
extract or filter the data with mean or std


- Add descriptive activity names to name the activities in the data set
such as 
names(comb_set2) <- "activity"

- combine three data set into one data set with approperately labels with descriptive variable names.
such as names(comb_set3) <- "subject


- create another tidy data set which is able to contain all combined data
the sizes columns and rows are matched up.


