### Peer-graded Assignment: Getting and Cleaning Data Course Project

This repository is a submission for Getting and Cleaning Data course project by Niraj Nair. It has the instructions on how to run analysis on Human Activity dataset gathered by smartphones.

#### Dataset
The dataset used for the following assignment was obtained from the following link.

[Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

#### Files
* *Codebook.md* is a code book that describes the variables, the data, and process that I performed to tidy the data.

* *run_analysis.R* performs the task of preparing data and then follow the 5 steps as described in the assignment's instructions:
    + Merges the training and the test datasets to create one dataset.
    + Extracts only the measurements on the mean and standard deviation for each measurement.
    + Uses descriptive activity label names to name the activities in the data set
    + Appropriately labels the data set with descriptive variable names.
    + From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* *Result.txt* is the exported final dataset after following the instructions described above.