The data for the analysis can be downloaded from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The downloaded data is located under the "UCI HAR Dataset" directory.

The run_analysis.R script processes the data in the following way to generate a tidy dataset, tidyData.txt:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
