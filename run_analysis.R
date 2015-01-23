## load the dplyr library
library(dplyr)
## load the feature name file "y_test.txt"
features <- read.table("features.txt",sep = " ", col.names = c("feature_number", "feature_name"))
## create legal names for columns. Delete "-", "(" and ")"
features$feature_name <- gsub("-", "_", features$feature_name)
features$feature_name <- gsub("\\(\\)", "", features$feature_name)
## load the activity name file "activity_labels.txt"
activities <- read.table("activity_labels.txt",col.names = c("act_label","act_name"))

## load test data
## load the subject id file "subject_test.txt"
subjectTest <- read.table("./test/subject_test.txt", sep = " ", col.names = c("Subject"))
## load the activities id file "y_test.txt"
activityTest <- read.table("./test/y_test.txt",sep = " ", col.names = c("Activity"))
## load test data file "X_test.txt"
dataTest <- read.table("./test/X_test.txt")
## Appropriately label the test data set with descriptive variable names.
## change the name of columns using features in "features.txt" file
colnames(dataTest) <- as.character(features$feature_name)
## add the subject column to test data
dataTest$Subject <- subjectTest$Subject
## add the activity column to test data
dataTest$Activity <- activityTest$Activity

## load training data
## load the subject id file "subject_train.txt"
subjectTrain <- read.table("./train/subject_train.txt", sep = " ", col.names = c("Subject"))
## load the activities id file "y_train.txt"
activityTrain <- read.table("./train/y_train.txt",sep = " ", col.names = c("Activity"))
## load test data file "X_train.txt"
dataTrain <- read.table("./train/X_train.txt")
## Appropriately label the train data set with descriptive variable names.
## change the name of columns using features in "features.txt" file
colnames(dataTrain) <- as.character(features$feature_name)
## add the subject column to test data
dataTrain$Subject <- subjectTrain$Subject
## add the activity column to test data
dataTrain$Activity <- activityTrain$Activity

## put together both data sets in one named dataAll
dataAll <- rbind(dataTrain,dataTest)

## Extract the measurements on the mean and standard deviation for each measurement.
columnsToAdd <- append(c(562,563), grep("mean|std",names(dataAll)))
dataMeanStd <- dataAll[,columnsToAdd]

## Put descriptive activity names to name the activities in the data set
dataMeanStd[,2] <- activities[dataMeanStd[,2],2]

## From the data set obtaining in last step ("dataMeanStd"), create a second, independent tidy data set
## with the average of each variable for each activity and each subjec
dataFinal <- summarise_each(group_by(dataMeanStd,Subject,Activity),funs(mean),tBodyAcc_mean_X:fBodyBodyGyroJerkMag_meanFreq)

## Write the final summarizing table to a file "dataStep5.txt"
write.table(dataFinal, file = "dataStep5.txt", row.name = FALSE)

## End of Script
