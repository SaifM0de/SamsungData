#CodeBook

The **run_analysis.R** script extracts the mean and standard deviation variables out of the **total 561 features** available and outputs 2 data frames as follows:
1) **data_set**
2) **grouped_mean**

The **data_set** data frame is the cleaned, merged, and ordered data using the Samsung dataset. It contains the following variables with each variable having its own column:
1) **subject**: The 30 individuals whose daily activities were monitored for data collection. Numbered from 1-30 in ascending order.
2) **activity**: The daily activities performed by the subject. This includes 6 activities; **STANDING**, **WALKING**, **WALKING_UPSTAIRS**, **WALKING_DOWNSTAIRS**, **SITTING**, and **LAYING**.
3) **66 features** of the **mean** and **standard deviation** for each subject according to their daily activities, which was collected by the accelerometer and gyroscope. t prefix denotes times series signals (seconds) and f prefix denotes frequency domain signals (Hz). These variables are described in detail in the features_info.txt file.

The **grouped_mean** data frame is the grouped data using the data_set data frame. It is essentially a summary of the means of the 68 variables for each subject according to their daily activities. It contains the following variables with each variable having its own column:
1) **subject**: The 30 individuals whose daily activities were monitored for data collection. Numbered from 1-30 in ascending order.
2) **activity**: The daily activities performed by the subject. This includes 6 activities; **STANDING**, **WALKING**, **WALKING_UPSTAIRS**, **WALKING_DOWNSTAIRS**, **SITTING**, and **LAYING**.
3) **66 features** representing the **grouped average of the means and standard deviations** evaluated for each subject according to their activity. t prefix denotes times series signals (seconds) and f prefix denotes frequency domain signals (Hz)

The data frames were generated using data from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The following text files were used specifically:
1) **subject_train.txt**: The numbered subjects used to create the training data.
2) **X_train.txt**: The training dataset consisting of 7352 observations.
3) **y_train.txt**: The numbered activity labels for the training data.
4) **subject_test.txt**: The numbered subjects used to create the test data.
5) **X_test.txt**: The test dataset consisting of 2947 observations.
6) **y_test.txt**: The numbered activity labels for the test dataset
7) **activity_labels**: The descriptive labels corresponding to each numbered activity; **1 = WALKING, 2 = WALKING_UPSTAIRS, 3 = WALKING_DOWNSTAIRS, 4 = SITTING, 5 = STANDING, 6 = LAYING**. These were used to appropriately label the activities.
8) **features.txt**: List of the 561 features collected by the accelerometer and gyroscope. These were used to label the columns of the data frames. 


There were **84 duplicated columns** in the dataset which were not required and thus removed to allow use of the **dplyr** package
