# run_analysis.R - Getting and Cleaning Data Course Project

# 1. Merges the training and the test sets to create one data set.

# Merging training and test labels
y_train <- read.table("data/train/y_train.txt")
y_test <- read.table("data/test/y_test.txt")
labels <- rbind(y_train, y_test)

# Merging subjects from training and test sets
subject_train <- read.table("data/train/subject_train.txt")
subject_test <- read.table("data/test/subject_test.txt")
subjects <- rbind(subject_train, subject_test)

# Merging training and test sets
x_train <- read.table("data/train/X_train.txt")
x_test <- read.table("data/test/X_test.txt")
data_set <- rbind(x_train, x_test)
#-------------------------------------------------------

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("data/features.txt")
mean_and_std_indexes <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

# Subset the data set
data_set <- data_set[, mean_and_std_indexes]
#-------------------------------------------------------

# 3. Uses descriptive activity names to name the activities in the data set

activities <- read.table("data/activity_labels.txt")
activities[, 2] = tolower(activities[, 2])
labels[,1] = activities[labels[,1], 2]
#-------------------------------------------------------

# 4. Appropriately labels the data set with descriptive variable names. 

names(labels) <- "activity"
names(subjects) <- "subject"

#Clean feature names from "(" and ")" characters and have all letters lowercase
data_set_names <- gsub("\\(|\\)", "", features[mean_and_std_indexes, 2])
names(data_set) <- tolower(data_set_names)

merged_tidy_data_set <- cbind(labels, subjects, data_set)
write.table(merged_tidy_data_set, "merged_tidy_data_set.txt", row.name=FALSE)
#-------------------------------------------------------

# 5.  From the data set in step 4, creates a second, independent tidy data set
#     with the average of each variable for each activity and each subject.

unique_subjects = unique(subjects)[,1]
sub_count = length(unique(subjects)[,1])
act_count = length(activities[,1])
total_columns_count = dim(merged_tidy_data_set)[2]
average_data = merged_tidy_data_set[1:(sub_count*act_count), ]

row = 1
for (s in 1:sub_count) {
    for (a in 1:act_count) {
        average_data[row, 1] = activities[a, 2]
        average_data[row, 2] = unique_subjects[s]
        tmp <- merged_tidy_data_set[merged_tidy_data_set$subject==s & merged_tidy_data_set$activity==activities[a, 2], ]
        average_data[row, 3:total_columns_count] <- colMeans(tmp[, 3:total_columns_count])
        row = row+1
    }
}

write.table(average_data, "tidy_activity_subject_average_data.txt", row.name=FALSE)