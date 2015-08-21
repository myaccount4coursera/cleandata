## Course project for Clean Data course
##

#load the datasets
trainX <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
testX  <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)

trainY <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
testY  <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
subject_test  <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)


#load the name of features and activities
features <- read.table("UCI HAR Dataset/features.txt", header=FALSE)
activities <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE)


#put appropriate names to colums in datasets
colnames(trainX) <- features$V2
colnames(testX)  <- features$V2
colnames(trainY) <- "activity"
colnames(testY)  <- "activity"
colnames(subject_train) <- "subject"
colnames(subject_test)  <- "subject"


#put together the vector values (including subject) and its associated activity
train <- cbind(trainX, subject_train, trainY)
test  <- cbind(testX, subject_test,  testY)

#merge the train and the test datasets
data <- rbind(train, test)


# put appropriate names to activities 
# (by converting that column's values to a factor)
data$activity <- factor(data$activity, levels = activities$V1, labels=activities$V2 )


#select only colums with mean and std
columns4mean <- grep("mean",names(data))
columns4std  <- grep("std",names(data))
selected_columns <- sort(c(columns4mean,columns4std,562,563))

# THIS IS THE FINAL DATASET
DF1 <- data[,selected_columns]




## now I wan to summarize the data: tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
longDF <- melt(DF1, id=c("subject","activity"))
DF2 <- dcast(longDF, longDF$subject + longDF$activity ~ longDF$variable, mean)

write.table(DF2, file="finalDF.txt", row.name=FALSE)



