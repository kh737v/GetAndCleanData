# run_analysis.R

# Week 3 project requirements

# 1.  Merges the training and the test sets to create one data set.

library(data.table)
dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

features_file <- "./data/UCI_HAR_Dataset/features.txt"
actlabel_file <- "./data/UCI_HAR_Dataset/activity_labels.txt"

train_sub_file <- "./data/UCI_HAR_Dataset/train/subject_train.txt"
train_set_file <- "./data/UCI_HAR_Dataset/train/X_train.txt"
train_lab_file <- "./data/UCI_HAR_Dataset/train/y_train.txt"

test_sub_file <- "./data/UCI_HAR_Dataset/test/subject_test.txt"
test_set_file <- "./data/UCI_HAR_Dataset/test/X_test.txt"
test_lab_file <- "./data/UCI_HAR_Dataset/test/y_test.txt"

# Merge train and test data set
train_set <- read.table(train_set_file)
tests_set <- read.table(test_set_file)
comb_set1 <- rbind(train_set, tests_set)
# verify the merge
dim(train_set)
dim(tests_set)
dim(comb_set1)
names(comb_set1)

# Merge activity label set
train_actlab <- read.table(train_lab_file)
test_actlab <- read.table(test_lab_file)
comb_set2 <- rbind(train_actlab, test_actlab)
names(comb_set2)

# Merge subject train and subject test data sets
train_sbj_set <- read.table(train_sub_file)
test_sbj_set <- read.table(test_sub_file)
comb_set3 <- rbind(train_sbj_set, test_sbj_set)
names(comb_set3)

# 2.  Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table(features_file)
names(features)
dim(features)
head(features)
extract_mean_std <- grep("-mean\\(\\)|-std\\(\\)", features$V2)
sub_comb_set <- comb_set1[, extract_mean_std]
names(sub_comb_set) <- features[extract_mean_sd, 2]

# 3.  Uses descriptive activity names to name the activities in the data set

activities <- read.table(actlabel_file)
activities$V2 <- gsub("_", "", activities$V2)
comb_set2$V1 <- activities[comb_set2$V1, 2]
names(comb_set2) <- "activity"

# 4.  Appropriately labels the data set with descriptive variable names.

names(comb_set3) <- "subject"
comb_all <- cbind(comb_set1, comb_set2, comb_set3)
dim(comb_all)  # it should have rownum=10299, colnum=563=561+1+1
write.table(comb_all, "./data/UCI_HAR_Dataset/merged_all_data.txt")

# 5.  From the data set in step 4, creates a second, independent tidy data set with 
#     the average of each variable for each activity and each subject.

num_subjects <- length(unique(comb_set3[,1]))
num_activity <- length(activities$V1)
tidy_set <- comb_all[1:(numSubjects*numActivities), ]


