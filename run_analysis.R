# Coursera - Data Science
# Exploratory Data Analysis - Week 4 Project
# John Clune

## 1. Merges the training and the test sets to create one data set.

# Pulls, combines and names data

train <- read.table("C:/Users/juc71/datasciencecoursera/GettingCleaningData/UCI_HAR_Dataset/train/subject_train.txt", header = FALSE)
test <- read.table("C:/Users/juc71/datasciencecoursera/GettingCleaningData/UCI_HAR_Dataset/test/subject_test.txt", header = FALSE)
subjects <- rbind(train, test)
names(subjects)<-c("subjects")

train_y <- read.table("C:/Users/juc71/datasciencecoursera/GettingCleaningData/UCI_HAR_Dataset/train/y_train.txt", header = FALSE)
test_y <- read.table("C:/Users/juc71/datasciencecoursera/GettingCleaningData/UCI_HAR_Dataset/test/y_test.txt", header = FALSE)
labels <- rbind(train_y, test_y)
names(labels)<-c("labels")

subjects_labels <- cbind(subjects, labels)

features <- read.table("C:/Users/juc71/datasciencecoursera/GettingCleaningData/UCI_HAR_Dataset/features.txt", header = FALSE)
train_x <- read.table("C:/Users/juc71/datasciencecoursera/GettingCleaningData/UCI_HAR_Dataset/train/X_train.txt", header = FALSE)
test_x <- read.table("C:/Users/juc71/datasciencecoursera/GettingCleaningData/UCI_HAR_Dataset/test/X_test.txt", header = FALSE)
results <- rbind(train_x, test_x)
names(results)<-features$V2

dataset <- cbind(results, subjects_labels)
str(dataset)

write.csv(dataset, file="C:/Users/juc71/datasciencecoursera/GettingCleaningData/UCI_HAR_Dataset/dataset.csv")

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
dataset_mean_sd <-features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
names <- c(as.character(dataset_mean_sd), "subjects", "labels" )
dataset_mean_sd <- subset(dataset, select=names)
write.csv(dataset_mean_sd, file="C:/Users/juc71/datasciencecoursera/GettingCleaningData/UCI_HAR_Dataset/dataset_mean_sd.csv")

## 3. Uses descriptive activity names to name the activities in the data set
labels_names <- read.table("C:/Users/juc71/datasciencecoursera/GettingCleaningData/UCI_HAR_Dataset/activity_labels.txt", header = FALSE)
labels_names <- as.character(labels_names[,2])
dataset_mean_sd$labels <- labels_names[dataset_mean_sd$labels]
head(dataset_mean_sd)

## 4. Appropriately labels the data set with descriptive variable names.
name.new <- names(dataset_mean_sd)
name.new <- gsub("[(][)]", "", name.new)
name.new <- gsub("^t", "Time_", name.new)
name.new <- gsub("^f", "Freq_", name.new)
name.new <- gsub("Acc", "Accelerometer", name.new)
name.new <- gsub("Gyro", "Gyroscope", name.new)
name.new <- gsub("Mag", "Magnitude", name.new)
name.new <- gsub("-mean-", "_Mean_", name.new)
name.new <- gsub("-std-", "_StanDev_", name.new)
name.new <- gsub("-", "_", name.new)
names(dataset_mean_sd) <- name.new

write.csv(dataset_mean_sd, file="C:/Users/juc71/datasciencecoursera/GettingCleaningData/UCI_HAR_Dataset/dataset_mean_sd.csv")

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
dataset_tidy <- aggregate(dataset_mean_sd[,2:67], by = list(labels = dataset_mean_sd$labels, subjects = dataset_mean_sd$subjects),FUN = mean)
write.csv(dataset_tidy, file="C:/Users/juc71/datasciencecoursera/GettingCleaningData/UCI_HAR_Dataset/dataset_tidy.csv")
write.table(dataset_tidy, file="C:/Users/juc71/datasciencecoursera/GettingCleaningData/UCI_HAR_Dataset/dataset_tidy.txt")





