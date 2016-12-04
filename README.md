# GettingCleaningData_Week4_Project
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users for wearable computing. The analysis for this project uses data from accelerometers from the Samsung Galaxy S smartphone. A full description and datasets for this analysis can be obtained from the site below:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This script pulls, combines and names the data into dataset.csv.  A subset of the data is created that extracts only the measurements on the mean and standard deviation for each measurement into data_mean_sd.csv.  Lastly, the remaining activities and variable are provided proper names and a final dataset is created that summarize the average of each activity for each subject called dataset_tidy.txt.

The steps of the R script (run_analysis.R) are as follows.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
