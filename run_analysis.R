
######################################################################
######## Coursera's Getting and Cleaning Data course May 2015 ########
######################################################################
#                        COURSE PROJECT                              #
######################################################################


## Step 1: merging the train and test data sets to create one
 # Train data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt") #activities
x_train <- read.table("UCI HAR Dataset/train/X_train.txt") #dim (7352*561)
 # Test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt") #activities
x_test <- read.table("UCI HAR Dataset/test/X_test.txt") #dim (2947*561)
 # Merging
subjects <- rbind(subject_train, subject_test) # dim (10299*1)
activities <- rbind(y_train, y_test)
rawdata <- rbind(x_train, x_test) #dim (10299*561)

## Step 2: extracting mean and std dev data
features <- read.table("UCI HAR Dataset/features.txt") #dim (561*2)
meanstd_pos <- grep("mean\\(\\)|std\\(\\)", features[, 2]) #66 matches
features <- features[meanstd_pos,] #subsetting features
rawdata <- rawdata[,meanstd_pos] #subsetting rawdata
features[,2] <- gsub("mean", "Mean", features[,2])
features[,2] <- gsub("std", "Std", features[,2])
features[,2] <- gsub("\\(\\)", "", features[,2])
features[,2] <- gsub("-", " ", features[,2])
names(rawdata) <- features[,2] #assigning the labels to the measurements

## Step 3: using descriptive activity names to name the activities in the data set
activitiesLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activitiesLabels[,2] <- gsub("_", " ", activitiesLabels[,2])
activities <- as.factor(activities[,1])
levels(activities) <- activitiesLabels[,2]

## Step 4: labeling the data set with descriptive variable names
mydata <- cbind(subjects, activities, rawdata) # final data set
names(mydata)[c(1,2)] <- c("Subject", "Activity")
rm(activitiesLabels, features, rawdata, subject_test, subject_train, subjects, x_test, x_train, y_test, y_train, activities, meanstd_pos)


## Step 5: creating a second, independent tidy data set with the average of each 
#          variable for each activity and each subject
if (!require("dplyr")){
        install.packages("dplyr")
}
library("dplyr")
mytidy_data <- group_by(mydata, Subject, Activity) %>% summarise_each(funs(mean))
write.table(mytidy_data, "avg_data.txt", row.name=FALSE)