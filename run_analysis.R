# task 1: Merge test and train datasets
# read X,Y,and subject for train and test data 
# and row bind X,Y and subject

trainData <- read.table("./UCIHARDataset/train/X_train.txt")
testData <- read.table("./UCIHARDataset/test/X_test.txt")

trainLabel <- read.table("./UCIHARDataset/train/y_train.txt")
testLabel <- read.table("./UCIHARDataset/test/y_test.txt") 

trainSubject <- read.table("./UCIHARDataset/train/subject_train.txt")
testSubject <- read.table("./UCIHARDataset/test/subject_test.txt")

#row bind the test and train data,label and subject
joinedData <- rbind(trainData, testData)
joinedLabel <- rbind(trainLabel, testLabel)
joinedSubject <- rbind(trainSubject, testSubject)

#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
f <- read.table("./UCIHARDataset/features.txt")
meanstdInx <- grep("mean\\(\\)|std\\(\\)", f[, 2])
joinedData <- joinedData[, meanstdInx]

#4.Appropriately labels the data set with descriptive variable names. 
names(joinedData) <- gsub("\\(\\)", "", f[meanstdInx, 2]) # relace(/) > ""
names(joinedData) <- gsub("mean", "Mean", names(joinedData)) # replace mean > Mean
names(joinedData) <- gsub("std", "Std", names(joinedData)) # replace std > Std
names(joinedData) <- gsub("-", "", names(joinedData)) # replace - > "" 

#3.Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
activity <- read.table("./UCIHARDataset/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[joinedLabel[, 1], 2]
joinedLabel[, 1] <- activityLabel
names(joinedLabel) <- "activity"

names(joinedSubject) <- "subject"
merged_data <- cbind(joinedSubject, joinedLabel, joinedData)
write.table(merged_data, "joined_data.txt") # write the merged file


#5.From the data set in step 4, creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject.
subject_len <- length(table(joinedSubject))
activity_len <- dim(activity)[1]
column_len <- dim(merged_data)[2]
mean_result <- as.data.frame(matrix(NA, nrow=subject_len*activity_len, ncol=column_len) )
colnames(mean_result) <- colnames(merged_data)
row <- 1
mean_result[, 1] <- sort(unique(joinedSubject)[, 1])
mean_result[, 2] <- activity[, 2]

for(i in 1:subject_len) 
  {
  for(j in 1:activity_len) 
    {
    subj <- i == merged_data$subject
    activ <- activity[j, 2] == merged_data$activity
    mean_result[row, 3:column_len] <- colMeans(merged_data[subj&activ, 3:column_len])
    row <- row + 1
    }
  }

write.table(mean_result, "means_data.txt") # write the file
