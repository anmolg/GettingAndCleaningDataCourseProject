# Section 1 --------------------------------------------------------------

features <- read.table("./UCI HAR Dataset/features.txt")

subjectTrainData <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjectTestData <- read.table(".//UCI HAR Dataset/test/subject_test.txt")
subjectData <- rbind(subjectTrainData, subjectTestData)
names(subjectData) <- c("subjectID")

xTrainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
xTestData <- read.table("./UCI HAR Dataset/test/X_test.txt")
xData <- rbind(xTrainData, xTestData)
names(xData) <- features[,2]

yTrainData <- read.table("./UCI HAR Dataset/train/Y_train.txt")
yTestData <- read.table("./UCI HAR Dataset/test/Y_test.txt")
yData <- rbind(yTrainData, yTestData)
names(yData) <- c("activityID")

activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activityLabels) <- c("activityID", "activity")

data <- cbind(subjectData, xData, yData)

# Section 2 --------------------------------------------------------------

## Filtering all mean + std
dataColNames <- colnames(data)
dataColNames <- (grepl("activityID", dataColNames) | 
                   grepl("mean()-X", dataColNames) |
                   grepl("mean()-Y", dataColNames) |
                   grepl("mean()-Z", dataColNames) |
                   grepl("std", dataColNames) | 
                   grepl("subjectID", dataColNames))

## Only data that contains Mean and STD.
combinedData <- data[dataColNames == TRUE]

# Section 3 --------------------------------------------------------------

## Merging the data lables.
mData <- merge(activityLabels, combinedData, by="activityID")

#Filter out ActivityID no longer needed
mDataFiltered <- within(mData, rm("activityID"))

# Section 4 --------------------------------------------------------------

## Creating data to group by
groupedData <- within(mDataFiltered, rm("activity", "subjectID"))

mDataFinal <- aggregate(groupedData, by=list(mDataFiltered$subjectID, mDataFiltered$activity), mean)

## rename Group.2 to Activity and Group.1 to Subject
names(mDataFinal)[names(mDataFinal) == "Group.2"] <- "Activity"
names(mDataFinal)[names(mDataFinal) == "Group.1"] <- "Subject"

# Section 5 --------------------------------------------------------------

write.table(mDataFinal, "finalDataSet.txt", row.names = FALSE)
