

activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activitylabels[,2] <- as.character(activitylabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])


featureswanted <- grep(".*mean.*|.*std.*", features[,2])
featureswantednames <- features[featureswanted,2]
featureswantednames <- gsub('-mean', 'Mean', featureswantednames)
featureswantednames <- gsub('-std', 'Std', featureswantednames)
featureswantednames <- gsub('[-()]', '', featureswantednames)



train <- read.table("UCI HAR Dataset/train/X_train.txt")[featureswanted]
trainlabels <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainset <- cbind(subject_train, trainlabels, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")[featureswanted]
testlabels <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
testset <- cbind(subject_test, testlabels, test)


dataset <- rbind(trainset, testset)
colnames(dataset) <- c("subject", "activity", featureswantednames)

dataset$activity <- factor(dataset$activity, levels = activitylabels[,1], labels = activitylabels[,2])
dataset$subject <- as.factor(dataset$subject)

library(reshape2)

datasetmelted <- melt(dataset, id = c("subject", "activity"))
datasetmean <- dcast(datasetmelted, subject + activity ~ variable, mean)

write.table(datasetmean, "tidy.txt", row.names = FALSE, quote = FALSE)