---
output:
  html_document: default
  pdf_document: default
  word_document: default
---
The *run_analysis.R* script performs the task of data cleaning in 5 steps required as described in the instructions.

1. # Download the dataset
+ Dataset downloaded and extracted under the folder called UCI HAR Dataset

2. # Assign each data to variables
+ *features <- features.txt*. 
The features selected for this databset comes from the accelerometer and gyroscope of the smartphone.

+ *activities <- activity_labels.txt*. 
List of all activities performed when the corresponding measurements were taken and its labels.

+ *subject_test <- test/subject_test.txt*. 
Contains test data of test subjects being observed.

+ *testX <- test/X_test.txt*. 
Contains recorded features of test data.

+ *testY <- test/y_test.txt*. 
Contains test data of activities’ code labels.

+ *subTrain <- test/subject_train.txt*. 
Contains training data of test subjects being observed.

+ *trainX <- test/X_train.txt*. 
Contains recorded features of training data.

+ *trainY <- test/y_train.txt*. 
Contains training data of activities’ code labels.

3. # Merges the training and the test sets to create one data set
+ *X* is created by merging trainX and testX using rbind() function. 
+ *Y* is created by merging trainY and testY using rbind() function. 
+ *Subject* is created by merging subject_train and subject_test using rbind() function. 
+ *dt* is created by merging Subject, Y and X using cbind() function. 

4. # Extracts only the measurements on the mean and standard deviation for each measurement
+ *tidyData* is created by subsetting *dt*, selecting only columns: subject, code and the measurements on the mean and standard deviations for each measurement. 

+ The activity names are changed to simple names which descrioe the activity. 
+ Entire numbers in code column of the *dt* is replaced with corresponding activity name taken from second column of the *activities* variable.

+ Appropriately labels the data set with descriptive variable names
code column in TidyData renamed into activities
All Acc in column’s name replaced by Accelerometer
All Gyro in column’s name replaced by Gyroscope
All BodyBody in column’s name replaced by Body
All Mag in column’s name replaced by Magnitude
All start with character f in column’s name replaced by Frequency
All start with character t in column’s name replaced by Time

5. # From the data set obtained in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
*finalData* is created by sumarizing *tidyData* taking the means of each variable for each activity and each subject, after groupped by subject and activity.

Export *finalData* into Result.txt file.