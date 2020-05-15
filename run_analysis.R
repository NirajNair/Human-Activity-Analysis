library(dplyr)

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subTest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"))
testX <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
testY <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = c("code"))
subTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"))
trainX <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
trainY <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c("code"))
 
X <- rbind(trainX, testX)
Y <- rbind(trainY, testY)
Subject <- rbind(subTrain, subTest)

dt <- cbind(Subject, Y, X)

tidyData <- dt %>%
    select(subject, code, contains("mean"), contains("std"))

tidyData$code <- activities[tidyData$code, 2]

names(tidyData)[2] <- "activity"
names(tidyData) <- gsub("time", "Time",names(tidyData))
names(tidyData) <- gsub("^f", "Frequency",names(tidyData))
names(tidyData) <- gsub("^angle", "Angle",names(tidyData))
names(tidyData) <- gsub("acc", "Accelerometer",names(tidyData))
names(tidyData) <- gsub("^t", "Time",names(tidyData))
names(tidyData) <- gsub("Gyro", "Gyroscope",names(tidyData))
names(tidyData) <- gsub("BodyBody", "Body",names(tidyData))
names(tidyData) <- gsub("Mag", "Magnitude",names(tidyData))
names(tidyData) <- gsub("tbody", "TimeBody",names(tidyData))
names(tidyData) <- gsub("gravity", "Gravity",names(tidyData))
names(tidyData) <- gsub("-mean()", "Mean", names(tidyData), ignore.case = TRUE)
names(tidyData) <- gsub("-std()", "STD", names(tidyData), ignore.case = TRUE)

finalData <- tidyData %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean)) 
write.table(finalData, 'Result.txt', row.names = FALSE)

