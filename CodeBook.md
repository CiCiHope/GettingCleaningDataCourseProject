Code Book
=========

###Introduction###

This code book describes the variables, the data, and transformations applied to the raw data if order to arrive to the tidy file -  tidy.txt.

###Data Descriptions###

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The more a detailed description of how the data was obtained, how the data was cleaned and filtered can be found at the original description of the data set (see link in ReadMe.md).  

###Variables####

The variables in the tidy.txt is a subset of the variables in the original data set.  The variables that made it into the tidy.txt file are the those relating to the mean and standard deviation of the estimated variable signals.  This is assumed to be any variable name containing the words "mean()" or "std()".  The following signals were used to estimate variables of the feature vector for each pattern.  '-XYZ' suffix is used to denote 3-axial signals in the X, Y and Z directions. 

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

In tidy.txt, there are two additional variables:

* subject: an ID field indicating the person whom the observation was collected on
* act: indicating the physical activity the subject was performing

### Data Transformations ###


 1. The script creates a temporary folder and downloads the zipped raw data file into the temporary folder.   

 2. The file is unzipped and the relevant files are imported into R.  

 3. The 70% train data and 30% test data are merged to form one combined  table called dat1.

 4. Variable name were conformed to syntactically-correct names for ease of reading: capital letters were left in the variable names to help with readability since variable names can be long; any special characters were replaced with periods.  An example for conforming logic applied to a variable name is "tBodyAcc-mean()-x" was changed to "tBodyAcc.mean...X".  Even though the new column names contain consecutive periods, the consecutive periods are left in as it to indicate to that substitution has occurred from the original column names.  
    
 5. Variable selection:  Only variables of mean or standard deviation were kept in the in the tidy data set.  This is assumed to be any variable name containing the words "mean()" or "std()".  Any angle() variable was excluded from the tidy data set because they measure the angle between two designated values rather than spatial movements.  

 6. Subject id's were added.
 
 7. The activity id's are compared against a reference mapping table in order translate the id values into meaningful activity labels.  For example, any record with activity ID 1 was mapped to the activity label of walking.

 8. The data was then summarized to an activity a subject level (i.e. the data table was reshaped).  Specifically, each column still represents a mean or standard deviation measure, each observation now represents the mean of a particular subject & activity combination.

 9. The output tidy file is exported as tidy.txt