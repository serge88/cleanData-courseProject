## Part1: Merge the data sets

# subjects
subjTest = read.table("UCI HAR Dataset/test/subject_test.txt")
subjTrain = read.table("UCI HAR Dataset/train/subject_train.txt")
subjMerge = rbind(subjTest,subjTrain)

# X
XTest = read.table("UCI HAR Dataset/test/X_test.txt")
XTrain = read.table("UCI HAR Dataset/train/X_train.txt")
XMerge = rbind(XTest,XTrain)

# y
yTest = read.table("UCI HAR Dataset/test/y_test.txt")
yTrain = read.table("UCI HAR Dataset/train/y_train.txt")
yMerge = rbind(yTest,yTrain)


## Part2: Extracts only the measurements on the mean and standard deviation for each measurement. 

# get feature information
featureInfo = read.table("UCI HAR Dataset/features.txt")
meanSDIndeces = grep("mean\\(|std\\(",featureInfo[,2])

meanSDdata = XMerge[,meanSDIndeces]


## Part 3: Uses descriptive activity names to name the activities in the data set

activityLabels = read.table("UCI HAR Dataset/activity_labels.txt")

yLabels = factor(yMerge[,1],labels=activityLabels[,2])


## Part 4: Appropriately labels the data set with descriptive variable names. 

colnames(XMerge) = featureInfo[,2]


## Part 5: Creates a second, independent tidy data set with the average of each 
##    variable for each activity and each subject. 

tidyData = aggregate(XMerge,by=list("subject"=as.factor(subjMerge[,1]),"activity"=yLabels),mean)
write.table(tidyData,file="tidyData.txt",sep="\t",row.names=F,quote=F)


