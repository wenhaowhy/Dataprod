library(dplyr)
library(tidyr)
library(reshape2)

setwd("C:/Users/sharon/Desktop")

# import activity labels and features to R.  Data already downloaded
activityLabels <- read.table("activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("features.txt")
features[,2] <- as.character(features[,2])

# Extracts only the measurements on the mean and standard deviation for each measurement.
Extraction <- grep(".*mean.*|.*std.*", features[,2])
Extraction.names <- features[Extraction,2]
Extraction.names = gsub('-mean', 'Mean', Extraction.names)
Extraction.names = gsub('-std', 'Std', Extraction.names)
Extraction.names <- gsub('[-()]', '', Extraction.names)


# import datasets for train
train <- read.table("X_train.txt")[Extraction]
trainActivities <- read.table("Y_train.txt")
trainSubjects <- read.table("subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("X_test.txt")[Extraction]
testActivities <- read.table("Y_test.txt")
testSubjects <- read.table("subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

# merge datasets and add labels
combined <- rbind(train, test)
colnames(combined) <- c("subject", "activity", Extraction.names)

# turn activities & subjects into factors
combined$activity <- factor(combined$activity, levels = activityLabels[,1], labels = activityLabels[,2])
combined$subject <- as.factor(combined$subject)

combined.melted <- melt(combined, id = c("subject", "activity"))
combined.mean <- dcast(combined.melted, subject + activity ~ variable, mean)

write.table(combined.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
