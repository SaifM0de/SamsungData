library('dplyr')
##set working directory to path containing 'UCI HAR Dataset' folder before running script##

training_set <- read.table(file = 'train/X_train.txt')
training_labels <- read.table(file = 'y_train.txt')
subject_train <- read.table(file = 'train/subject_train.txt')
test_set <- read.table(file = 'test/X_test.txt')
test_labels <- read.table(file = 'test/y_test.txt')
subject_test <- read.table(file = 'test/subject_test.txt')
features <- read.table(file = 'features.txt')
#renames column names of the training set and the test set
columnNames <- as.character(as.vector(features[,2]))
colnames(training_set) <- columnNames
colnames(test_set) <- columnNames
#replaces activity numbers of training set with descriptive names
training_labels <- as.data.frame(gsub("1", "WALKING", training_labels[, 1]))
training_labels <- as.data.frame(gsub("2", "WALKING_UPSTAIRS", training_labels[, 1]))
training_labels <- as.data.frame(gsub("3", "WALKING_DOWNSTAIRS", training_labels[, 1]))
training_labels <- as.data.frame(gsub("4", "SITTING", training_labels[, 1]))
training_labels <- as.data.frame(gsub("5", "STANDING", training_labels[, 1]))
training_labels <- as.data.frame(gsub("6", "LAYING", training_labels[, 1]))
colnames(training_labels) <- "activity"
training_set <- cbind(training_labels, training_set)
training_set <- cbind(subject_train, training_set)
colnames(training_set)[1] <- "subject"
#replaces activity numbers of test set with descriptive names
test_labels <- as.data.frame(gsub("1", "WALKING", test_labels[, 1]))
test_labels <- as.data.frame(gsub("2", "WALKING_UPSTAIRS", test_labels[, 1]))
test_labels <- as.data.frame(gsub("3", "WALKING_DOWNSTAIRS", test_labels[, 1]))
test_labels <- as.data.frame(gsub("4", "SITTING", test_labels[, 1]))
test_labels <- as.data.frame(gsub("5", "STANDING", test_labels[, 1]))
test_labels <- as.data.frame(gsub("6", "LAYING", test_labels[, 1]))
colnames(test_labels) <- "activity"
test_set <- cbind(test_labels, test_set)
test_set <- cbind(subject_test, test_set)
colnames(test_set)[1] <- "subject"
#merges the training set and the test set
data_set <- rbind(test_set, training_set)
#removes duplicate columns
data_set <- as_tibble(data_set[, !duplicated(colnames(data_set))])
#selects mean and standard deviation columns
meancols <- grep("mean()", colnames(data_set), fixed = TRUE)
stdcols <- grep("std()", colnames(data_set), fixed = TRUE)
data_set <- data_set[, c(1, 2, meancols, stdcols)]
data_set <- arrange(data_set, subject)
#creates data frame with average of each variable for each activity and each subject
grouped_mean <- group_by(data_set, subject, activity) %>%
    summarise_all(mean)
write.table(grouped_mean, file = 'Week4.txt', row.name = FALSE)
