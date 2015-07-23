Original data > https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Data from the orignal files were modified as follows:
1. Combine test and train datasets for data , label and subjects
2. Extract the mean and standard deviation for each measurement.
3. Format the header of the combined datasets
                replace(/) > ""
                replace mean > Mean
                replace std > Std
                replace - > "" 
4. Give descriptive activity names to name the activities and subjects in the dataset
5. Finaly make an independent tidy data set with the average of each variable for each activity and each subject.

Names of Columns(headers) in final "means_data.txt"
[1] "subject"                  "activity"                 "tBodyAccMeanX"           
[4] "tBodyAccMeanY"            "tBodyAccMeanZ"            "tBodyAccStdX"            
[7] "tBodyAccStdY"             "tBodyAccStdZ"             "tGravityAccMeanX"        
[10] "tGravityAccMeanY"         "tGravityAccMeanZ"         "tGravityAccStdX"         
[13] "tGravityAccStdY"          "tGravityAccStdZ"          "tBodyAccJerkMeanX"       
[16] "tBodyAccJerkMeanY"        "tBodyAccJerkMeanZ"        "tBodyAccJerkStdX"        
[19] "tBodyAccJerkStdY"         "tBodyAccJerkStdZ"         "tBodyGyroMeanX"          
[22] "tBodyGyroMeanY"           "tBodyGyroMeanZ"           "tBodyGyroStdX"           
[25] "tBodyGyroStdY"            "tBodyGyroStdZ"            "tBodyGyroJerkMeanX"      
[28] "tBodyGyroJerkMeanY"       "tBodyGyroJerkMeanZ"       "tBodyGyroJerkStdX"       
[31] "tBodyGyroJerkStdY"        "tBodyGyroJerkStdZ"        "tBodyAccMagMean"         
[34] "tBodyAccMagStd"           "tGravityAccMagMean"       "tGravityAccMagStd"       
[37] "tBodyAccJerkMagMean"      "tBodyAccJerkMagStd"       "tBodyGyroMagMean"        
[40] "tBodyGyroMagStd"          "tBodyGyroJerkMagMean"     "tBodyGyroJerkMagStd"     
[43] "fBodyAccMeanX"            "fBodyAccMeanY"            "fBodyAccMeanZ"           
[46] "fBodyAccStdX"             "fBodyAccStdY"             "fBodyAccStdZ"            
[49] "fBodyAccJerkMeanX"        "fBodyAccJerkMeanY"        "fBodyAccJerkMeanZ"       
[52] "fBodyAccJerkStdX"         "fBodyAccJerkStdY"         "fBodyAccJerkStdZ"        
[55] "fBodyGyroMeanX"           "fBodyGyroMeanY"           "fBodyGyroMeanZ"          
[58] "fBodyGyroStdX"            "fBodyGyroStdY"            "fBodyGyroStdZ"           
[61] "fBodyAccMagMean"          "fBodyAccMagStd"           "fBodyBodyAccJerkMagMean" 
[64] "fBodyBodyAccJerkMagStd"   "fBodyBodyGyroMagMean"     "fBodyBodyGyroMagStd"     
[67] "fBodyBodyGyroJerkMagMean" "fBodyBodyGyroJerkMagStd" 