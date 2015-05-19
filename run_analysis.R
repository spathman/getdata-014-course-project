# Coursera - Getting and Cleaning Data Course Project

## Step 1 - Merges the training and the test sets to create one data set.
### Download the zipped data file into the working directory and unzipp it.
# Install the required library.
library(dplyr)
# fileUrl - the url of the file to download.

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Download the file using 'curl' and store it with the name 'dataset.zip' in the working directory.

download.file(fileUrl, destfile = "dataset.zip", method = "curl")

# Unzip the file into the 'data' sub-directory of the working directory. If the 'data' sub-directroy does't exists it will be created.

unzip("dataset.zip", exdir = "data/")

# Create a base file path to the sub-directory that has 'test' and 'train' sub-directories.

dataPath <- file.path("data", "UCI HAR Dataset")

### Process the 'test' data.
#### Read the 'X_test.txt' file into a data frame.

X_test <- read.table(file.path(dataPath, "test", "X_test.txt"))

##### Study the data set.
# Get dimension (size) of the data set.

dim(X_test) # 2947 x 561

# See a bit of the data and its structure.

head(X_test); tail(X_test); str(X_test)

# Check for any missing values in the data set.

any(is.na(X_test)) # FALSE indicates there are no missing values

## Read the subject's data for the test into 'subject_test' variable.

subject_test <- read.table(file.path(dataPath, "test", "subject_test.txt"))

## Study the data set.
# Get dimension (size) of the data set.

dim(subject_test) # 2947 x 1 - same n0 of rows as X_test

# See a bit of the data and its structure.

head(subject_test); tail(subject_test); str(subject_test)

# Check for any missing values in the data set.

any(is.na(subject_test)) # FALSE indicates there are no missing values

## Read the activity class data for the test into 'activity_test' variable.

activity_test <- read.table(file.path(dataPath, "test", "y_test.txt"))

## Study the data set.
# Get dimension (size) of the data set.

dim(activity_test) # 2947 x 1

# See a bit of the data and its structure.

head(activity_test); tail(activity_test); str(activity_test)

# Check for any missing values in the data set.

any(is.na(activity_test)) # FALSE indicates there are no missing values

# Combine the three data sets for test data. Change the activity_test and subject_test column names to more meaningful names.

test_data <- cbind(Activities = activity_test$V1, Subject = subject_test$V1, X_test)

### Process the 'train' data.
## Read the 'X_train.txt' file into a data frame.

X_train <- read.table(file.path(dataPath, "train", "X_train.txt"))

##### Study the data set
# Get dimension (size) of the data set.

dim(X_train) # 7352 x 561

# See a bit of the data and its structure.

head(X_train); tail(X_train); str(X_train)

# Check for any missing values in the data set.

any(is.na(X_train)) # FALSE indicates there are no missing values

## Read the subject's data for the train into 'subject_train' variable.

subject_train <- read.table(file.path(dataPath, "train", "subject_train.txt"))

## Study the data set.
# Get dimension (size) of the data set.

dim(subject_train) # 7352 x 1 - same n0 of rows as X_train

# See a bit of the data and its structure.

head(subject_train); tail(subject_train); str(subject_train)

# Check for any missing values in the data set.

any(is.na(subject_train)) # FALSE indicates there are no missing values

## Read the activity class data for the train into 'activity_train' variable.

activity_train <- read.table(file.path(dataPath, "train", "y_train.txt"))

## Study the data set.
# Get dimension (size) of the data set.

dim(activity_train) # 7352 x 1

# See a bit of the data and its structure.

head(activity_train); tail(activity_train); str(activity_train)

# Check for any missing values in the data set.

any(is.na(activity_train)) # FALSE indicates there are no missing values.

# Combine the three data sets for train data. Change the activity_train and subject_train column names to more meaningful names.

train_data <- cbind(Activities = activity_train$V1, Subject = subject_train$V1, X_train)

# Combine the 'test_data' and 'train_data' into one data set.

all_data <- rbind(test_data, train_data)

## Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
# Read the 'features.txt' file so that it can be used to set the column names.

features <- read.table(file.path(dataPath, "features.txt"))

# Convert the second column that contains the variable names to characters. This will enable to identify the column indices of those for mean and std

var_names <- as.character(features[,2])

# Get indices of the columns containg the text 'mean()' or 'std()'

required_column_indices <- grep("mean()|std()", var_names)
required_column_names <- grep("mean()|std()", var_names, value = TRUE)

## Select method used below requires the package 'dplyr' installed.

# select columns 1 & 2 (activities and subject) plus required columns offset by 2
other_cols <- required_column_indices + 2
final_working_data <- select(all_data, 1:2, other_cols)

## Step 3 - Uses descriptive activity names to name the activities in the data set.
# Read the activity labels

activity_labels <- read.table(file.path(dataPath, "activity_labels.txt"))

# Assign descriptive names to the activities

final_working_data$Activities <- factor(final_working_data$Activities, labels = activity_labels$V2)

## Step 4 - Appropriately labels the data set with descriptive variable names.
# Name the other columns with meaningfull names

colnames(final_working_data)[3:ncol(final_working_data)] <- required_column_names

## Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

df <- final_working_data[, 3:ncol(final_working_data)] # data to calculate the mean
gby1 <- final_working_data$Activities # used for group by
gby2 <- final_working_data$Subject # used for group by
# calculate the mean for all measurements and group by Activities and Subject
tidy_data <- aggregate(x = df, by = list(Activities = gby1, Subject = gby2), FUN = "mean")
View(tidy_data) # View the data in a tabular format

## Step 6 - Write the tidy_data to a text file

write.table(tidy_data, file = file.path("data", "tidy_data.txt"), row.names = FALSE)

## Sanity check
# 'tidy_data' row 1 has mean values for all variables for activity walking and subject 1.
# Arrange 'final_working_data' in subject followed by activity order.
# The first 95 columns contain the data for activity walking and subject 1.
# Extract this data and calculate the mean for all the variables and compare it with row 1 data of 'tidy_data'.
# They should be the same!!
    ```{r}
set1 <- as.numeric(tidy_data[1, 3:ncol(tidy_data)])
View(set1)
# Extract the data for walking and subject 1 from 'final_working_data'
# Arrange the data on subject followed by activity order
x <- arrange(final_working_data, Subject,  Activities)
View(x)
df <- x[x$Activities == "WALKING" & x$Subject == 1, ]
View(df)
# Calculate the mean for all variables for Walking and subject 1
set2 <- c(sapply(df[, 3:ncol(df)], mean))
View(set2)
# Check that they are equal
set1 == set2
# View side by side
View(cbind(set1 = set2, set2 = set2))
```
## That's all folks!!
