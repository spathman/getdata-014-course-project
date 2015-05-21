cat("\f")  # clear the console
# If package 'dplyr' is not installed, inform the user that the package is required
# and the script will not run without it.  Give the the user the option to install
# the package.
cat("\f")  # clear the console
if (length(grep("dplyr", installed.packages()[, 1])) == 0) {
    message("The required package 'dplyr' is not installed in your system!")
    message("To install the package, please type 'y'")
    message("if you type 'n', the script will stop")
    response <- readline(prompt = "Install package 'dplyr' (y/n): ")
    if (identical(tolower(response), "y")) {
        install.packages("dplyr")
    } else {
        message("Exiting the script!")
        stop()
    }
}
require(dplyr)  # required for 'select' function
cat("\f")  # clear the console
check_file <- function(filename) {
    # The file is expected to be in the working directory directory.  If the file is
    # not found then ask the user to select the file.
    file <- filename
    if (!file.exists(filename)) {
        message(paste("Select the", filename, "file", sep = " "))
        file <- get_file(filename)
    }
    return(file)
}
cat("\f")  # clear the console
# Function allows the user to select a file interactively.  @param - fileName - the
# name of the file required @return - the file path if the user select the required
# file otherwise the script will stop with an error
get_file <- function(fileName) {

    file_path <- file.choose()
    # If the choosen file is not same as the required file, stop the script
    if (length(grep(fileName, file_path)) == 0) {
        message(paste(fileName, "not selected. The script will stop!!", sep = " "))
        stop()
    }
    return(file_path)
}
cat("\f")  # clear the console
# function to convert the variable names to more meaningful names
convert_names <- function (var) {
    var <- gsub("tBodyGyro", "time-body-gyroscope", var)
    var <- gsub("tBodyAcc", "time-body-accelerometer", var)
    var <- gsub("tGravityAcc", "time-gravity-acceleration", var)
    var <- gsub("fBodyAcc", "fourier-body-accelerometer", var)
    var <- gsub( "fBodyGyro", "fourier-body-gyroscope", var )
    var <- gsub("fBodyBodyAccJerkMag", "fourier-body-accelerometer-jerk-magnitude", var)
    var <- gsub("fBodyBodyGyroMag", "fourier-body-gyroscope-magnitude", var)
    var <- gsub("fBodyBodyGyroJerkMag", "fourier-body-gyroscope-jerk-magnitude", var)
    var <- gsub("JerkMag", "-jerk-magnitude", var)
    var <- gsub("Jerk", "-jerk", var)
    var <- gsub("Mag", "-magnitude", var)
    var <- gsub("\\(\\)", "", var)
}
cat("\f")  # clear the console
# Read all the required 'test' data files
file <- check_file("X_test.txt")  # check the file is in the working directory
message("Reading 'X_test.txt' file. Be patient....")
X_test <- read.table(file)
file <- check_file("subject_test.txt")
subject_test <- read.table(file)
file <- check_file("y_test.txt")
activity_test <- read.table(file)
# Combine the 'test' data into one data frame
test_data <- cbind(activity = activity_test$V1, subject = subject_test$V1, X_test)

# Read all the required 'train' data files
file <- check_file("X_train.txt")
message("Reading 'X_train.txt' file. Be patient....")
X_train <- read.table(file)
file <- check_file("subject_train.txt")
subject_train <- read.table(file)
file <- check_file("y_train.txt")
activity_train <- read.table(file)
# Combine the 'train' data into one data frame
train_data <- cbind(activity = activity_train$V1, subject = subject_train$V1, X_train)
# Combine both 'test' and 'train' data sets into one data set
all_data <- rbind(test_data, train_data)
# Read the 'features' file
file <- check_file("features.txt")
features <- read.table(file)
# Extract the variable names
var_names <- as.character(features[, 2])
# Get indices of the columns containg the text 'mean()' or 'std()'
required_column_indices <- grep("mean()|std()", var_names)
required_column_names <- grep("mean()|std()", var_names, value = TRUE)
# select columns 1 & 2 (activities and subject) plus required columns offset by 2
other_cols <- required_column_indices + 2
final_working_data <- select(all_data, 1:2, other_cols)
# Read the activity labels
file <- check_file("activity_labels.txt")
activity_labels <- read.table(file)
# Assign descriptive names to the activities
final_working_data$activity <- factor(final_working_data$activity, labels = activity_labels$V2)
## Appropriately labels the data set with descriptive variable names.  Name the
## other columns with meaningfull names. Use the names given in the 'features.txt'
## and expand the names to be more meaningful. 'covert_names' function does this.
colnames(final_working_data)[3:ncol(final_working_data)] <- convert_names(required_column_names)
## From the data set in step 4, creates a second, independent tidy data set with the
## average of each variable for each activity and each subject.  df - data to
## calculate the mean, the measurements for each activity and subject
df <- final_working_data[, 3:ncol(final_working_data)]
gby1 <- final_working_data$activity  # used for group by
gby2 <- final_working_data$subject  # used for group by
# calculate the mean for all measurements and group by Activities and Subject
tidy_data <- aggregate(x = df, by = list(activity = gby1, subject = gby2), FUN = "mean")
## Step 6 - Write the tidy_data to a text file
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)
message("Tidy data is written to file 'tidy_data.txt'")
