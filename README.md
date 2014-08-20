Getting & Cleaning Data Course Project
====================================

This repo contains files for the Course Project for the *Getting & Cleaning Data* course at Coursera.  This ReadMe file explains how all of the scripts work and how they are connected.  


----------


###Contents###

 - ReadMe.md
 - Run_analysis.R
 - CodeBook.md
 - A tidy data set (?name)


The *ReadMe.Md* file describes the contents, the data, the data cleaning process and how they are all connected.  


*Run_analysis.R* is the R script that:

* Download and store the data
* Merge the training and the test sets to create one data set
* Extract only the measurements on the mean and standard deviation 
* Uses descriptive activity names to name the activities in the data set
* Labels the data set with syntactically-correct descriptive variable names
* Create the tidy data set


*CodeBook.md* is the code book provided to describe the variables.  Specifically, it shows the variables names, the variable field width, variable definition, and range of values.


The tidy data set produced shows the averages of all mean and standard deviation variables for each activity and each subject.

----------

### Data set information###

Data used in this analysis comes from the realm of wearing computing.  Experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the 3-axial linear acceleration and the 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Features collected have been normalized and bounded within [-1,1]


----------
### Data Cleaning Process ###

 1. The data was downloaded from [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones][1]  as a zip file.  The file was subsequently unzipped to reveal that data located in a folder called *UCI HAR Dataset*.  

 2. The 70% train & the 30% test data sets were merged together to form one combined dataset. 
 3. Variable name were conformed to syntactically-correct names for ease of reading.  Capital letters were left as it because it helps with readability.  An example for conforming a variable name is "tBodyAcc-mean()-x" was changed to "tBodyAcc.mean...X".  In specific, the naming convention applied were:
       * "-" was changed to "."
       * "(" was changed to "."
       * ")" was changed to "."
       * "," was changed to "."

 4. Variable selection process: Only variable of mean or standard deviation were kept in the in the tidy data set
 5. The output tidy file is exported as a comma separate file 


  [1]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 