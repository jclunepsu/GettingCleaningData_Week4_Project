# GettingCleaningData_Week4_Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users for wearable computing. The analysis for this project uses data from accelerometers from the Samsung Galaxy S smartphone. The orginal data was obtained from the site below, that contains a full description and metadata:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data this project was obtained at the following url:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This script pulls, combines and names the data into dataset.csv.  A subset of the data is created that extracts only the measurements on the mean and standard deviation for each measurement into data_mean_sd.csv.  Lastly, the remaining activities and variable are provided proper names and final dataset is created the summarize the average of each activity for each subject called dataset_tidy.txt.

The steps of the R script called run_analysis.R are as follows.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
