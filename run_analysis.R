# set the working directory
setwd("C:/Users/teo/Documents/GitHub/Project")

# download and unzip the file in the directory
if(!file.exists("./data")){dir.create("./data")}
download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","./data/Dataset.zip", mode="wb")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# list all the .txt files  
# from this step will choose the data sets that are useful for the project
list.files("./data/UCI HAR Dataset",pattern = "\\.txt$",recursive=TRUE)


# 1. merge the train and test features test
# 1.1 import the features data set
features<- read.table("./data/UCI HAR Dataset/features.txt")
head(features, n=3)

# 1.1.2 merge the train and test fatures data sets to one data set 
# according to the corresponding name features
Test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names=features[,2])
Train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names=features[,2])
Train.And.Test<-rbind(Train,Test)
Train.And.Test[c(1:3) ,c(1:5)]
dim(Train.And.Test)

# 1.1.3 extract the mean and standard deviation for each measurment 
# (subsetting the data set)
mean.sd <- features[grep("(mean|std)\\(", features[,2]),]
subset.msd <- Train.And.Test[,mean.sd[,1]]
dim(subset.msd)

# 1.2 merge the activity sets
activity.test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
activity.train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
all.activity<-rbind(activity.train,activity.test)
names(all.activity)<- c("activity")
dim(all.activity)

# 1.3 merge the subject sets
subject.test<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
subject.train<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
all.subjects<-rbind(subject.train,subject.test)
names(all.subjects)<-c("subject")
dim(all.subjects)

# 1.4 create one data set merging all the above merged data sets
# name the "activity" and "subject" columns
Dataset<-cbind(all.subjects,subset.msd,all.activity)
Dataset[c(1:5) ,c(1:4,68)]
dim(Dataset)

# 2. give names to the activities of the data set
activity.names<- read.table("./data/UCI HAR Dataset/activity_labels.txt",header=FALSE,stringsAsFactors=FALSE)
activity.names[, 2] <- gsub("_", " ", activity.names[, 2],fixed=TRUE)
Dataset[, 68] = activity.names[Dataset[, 68], 2]
Dataset[c(1:5) ,c(1,65:68)]

# 3. label the data set with descriptive variable names
names(Dataset)<-gsub("^t", "time", names(Dataset))
names(Dataset)<-gsub("^f", "frequency", names(Dataset))
names(Dataset)<-gsub("Acc", "Accelerometer", names(Dataset))
names(Dataset)<-gsub("Gyro", "Gyroscope", names(Dataset))
names(Dataset)<-gsub("Mag", "Magnitude", names(Dataset))
names(Dataset)<-gsub("BodyBody", "Body", names(Dataset))
names(Dataset)

# 4. create a tidy data set
# 4.1 average each variable for each activity and each subject
tidy.data<-aggregate(.~subject+activity, data=Dataset, FUN="mean")
tidy.data<-tidy.data[order(tidy.data$subject,tidy.data$activity),]
dim(tidy.data)

### 4.2 export tidy data set as text file
write.table(tidy.data, file = "tidydata.txt",row.names=FALSE)
