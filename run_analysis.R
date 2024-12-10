
##Reading train datasets

xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")
subjecttrain <- read.table("train/subject_train.txt")


##Reading test datasets
xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/y_test.txt")
subjecttest <- read.table("test/subject_test.txt")

## Reading the headers
features <- read.table("features.txt")
actLabels <- read.table("activity_labels.txt")

##Assigning the headers to the datasets

colnames(xtest) <- features[,2]
colnames(xtrain) <- features[,2]

colnames(actLabels) <- c("class", "activity name")
colnames(ytest) <- "class"
colnames(ytrain) <- "class"

colnames(subjecttest) <- "subjectID"
colnames(subjecttrain) <- "subjectID"


##Merging all datasets

trainDF <- cbind(xtrain, ytrain, subjecttrain)
testDF <- cbind(xtest, ytest, subjecttest)
totalDF <- rbind(trainDF, testDF)


##Extracts only the measurements on the mean and standard deviation for each measurement

meanstd <- grepl("class|subjectID|mean\\(\\)|std\\(\\)", colnames(totalDF))
submeanstd <- totalDF[,meanstd]


##Uses descriptive activity names to name the activities in the data set


submeanstNames <- merge(submeanstd, actLabels, by= "class", all.x = TRUE)


##Appropriately labels the data set with descriptive variable names

colnames(submeanstNames) <- gsub("^t", "Time", colnames(submeanstNames))
colnames(submeanstNames) <- gsub("^f", "Frequency", colnames(submeanstNames))
colnames(submeanstNames) <- gsub("Acc", "Accelerometer", colnames(submeanstNames))
colnames(submeanstNames) <- gsub("Gyro", "Gyroscope", colnames(submeanstNames))
colnames(submeanstNames) <- gsub("Mag", "Magnitude", colnames(submeanstNames))



##From the data set in step 4, creates a second, 
##independent tidy data set with the average of each variable 
##for each activity and each subject.

library(dplyr)

tidy <- submeanstNames %>% group_by(subjectID, `activity name`, class) %>% summarise_all(mean)

write.table(tidy, "tidy.txt", row.names = FALSE)
