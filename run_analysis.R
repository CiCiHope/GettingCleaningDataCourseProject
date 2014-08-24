# This is a set of code used to collect and clean a dataset.  The data used
# represent data collected from wearing computing's the accerlerometers on 
# the Samsung Galaxy S smartphones.  

# Download dataset from specified path to temp directory & record downloaded date

tmpdir <- tempdir() 
url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
file <- basename(url)
download.file(url,file,method="curl")
datedownloaded <- date()

# Unzip dataset to specified path & record time

untar(file, compressed = 'gzip', exdir = tmpdir)
list.files(tmpdir)

# Import required data tables

train <- read.table(paste(tmpdir,"UCI HAR Dataset", "train","X_train.txt",sep="/"))
test <- read.table(paste(tmpdir,"UCI HAR Dataset", "test","X_test.txt",sep="/"))
train.y <- read.table(paste(tmpdir,"UCI HAR Dataset", "train","y_train.txt",sep="/"))
test.y <- read.table(paste(tmpdir,"UCI HAR Dataset", "test","y_test.txt",sep="/"))
train.sub <- read.table(paste(tmpdir,"UCI HAR Dataset", "train","subject_train.txt",sep="/"))
test.sub <- read.table(paste(tmpdir,"UCI HAR Dataset", "test","subject_test.txt",sep="/"))
act <- read.table(paste(tmpdir,"UCI HAR Dataset", "activity_labels.txt",sep="/"))
fea <- read.table(paste(tmpdir,"UCI HAR Dataset", "features.txt",sep="/"))

# Merge train & test data

dat1 <- rbind(train, test)

# Make syntactically valid variables names & apply descriptive variables names to 
# train & test data sets

fea$V3 <- make.names(fea$V2)
colnames(dat1) <- fea[,3]

# Extract only the measures on mean and standard deviation for each measurement on
# merged train & test data

datmean <- dat1[,grep("mean..",colnames(dat1))]
datstd <- dat1[,grep("std..",colnames(dat1))]
dat2 <- cbind(datmean,datstd)

# Merge train & test subject data and label its column

dat.sub <- rbind(train.sub, test.sub)
colnames(dat.sub) <- "subject"

# Merge train & test activity data & label its column

dat.act <- rbind(train.y, test.y)
colnames(dat.act) <- "V1"

# Merge train & test obs with subject and activity data sets to form final data set

dat3 <- cbind(dat.sub,dat.act,dat2)

# Use descriptive activity names to name the activities in the data set

library(plyr)
dat4 <- join (act, dat3)

# Produce tidy data set

names(dat4)[names(dat4)=="V2"] <- "activity"
tidydat.1 <- dat4[,-1]

# Create the average of each variable for each activity and each subject

agg <- suppressWarnings (aggregate(tidydat.1, by=list(subject = tidydat.1$subject, act =tidydat.1$activity), FUN=mean, na.rm=T))

# Produce second, independent tidy data set with the average of each variable for each 
# activity and each subject

tidydat.2 <- agg[,-c(3:4)]

write.table(tidydat.2, file="./Coursera/03 Getting and Cleaning Data/Course Project/GettingCleaningDataCourseProject/tidy.txt",sep="\t",row.name=FALSE)