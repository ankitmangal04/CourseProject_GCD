# Read test data, labels and subjects

subject_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
dim(subject_test)
# 2947 X 1
X_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
dim(X_test)
# 2947 X 561
y_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
dim(y_test)
# 2947 X 1

# Reading train data, subject and lables

subject_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
dim(subject_train)
# 7352 X 1
X_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
dim(X_train)
# 7532 X 561
y_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
dim(y_train)
# 7352 X 1

# add column name for subject files
names(subject_train) <- "subject"
names(subject_test) <- "subject"

# add column names for measurement files
featureNames <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2

# add column name for label files
names(y_train) <- "activity"
names(y_test) <- "activity"


# Step1: Merges the training and the test sets to create one data set.
X_TT <- rbind(X_train, X_test)
dim(X_TT)
# 10299 X 561

y_TT <- rbind(y_train, y_test)
dim(y_TT)
# 10299 X 1

subject_TT <- rbind(subject_train, subject_test)
dim(subject_TT)
# 10299 X 1

# Merging subject, activity and data files
syX_TT <- cbind(subject_TT,y_TT,X_TT)
dim(syX_TT)
# 10299 X 563


# Step2: Extracts only the measurements on the mean and standard deviation for each measurement. 
# Extract columns contain "mean()" or "std()"
cols_meanstd <- grepl("mean\\(\\)", names(syX_TT)) |
  grepl("std\\(\\)", names(syX_TT))

# keep the subject and activity columns by changing the values of 
# column 1 and 2 from False to True
cols_meanstd[1:2] <- TRUE

# limit dataset to desired columns only
syX_TT <- syX_TT[, cols_meanstd]

# Step3: Uses descriptive activity names to name the activities in the data set
# Converting activity field from integer to factor so that values can be replaced by name of activity
syX_TT$activity <- factor(syX_TT$activity, labels=c("Walking","Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

# Step4: Appropriately labels the data set with descriptive variable names.
# already done in previous stages and all variables have descriptive lables.
# head(syX_TT)

# Step5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# create the tidy data set - use reshape2
tidydata <- melt(syX_TT, id=c("subject","activity"))
tidydata_final <- dcast(tidydata, subject+activity ~ variable, mean)

write.table(tidydata_final, "./tidy.txt", row.names=FALSE)

