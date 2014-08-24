Getting & Cleaning Data: Course Project
====================================

###Introduction###

This repo contains data & files for the Course Project for the *Getting & Cleaning Data* course at Coursera.  This ReadMe file explains how all of the data, files and scripts fit together.  

----------


###Contents of this repo###

 - ReadMe.md
 - Run_analysis.R
 - CodeBook.md
 - Tidy.txt
 - UCI HAR Dataset

The *ReadMe.Md* file describes the contents, the data, the data cleaning process and how they are all connected.  


*Run_analysis.R* is the R script that is used on the raw data to produce the tidy data or tidy.txt.  A detail description of run_analysis.R is below.


*CodeBook.md* is the code book provided to describe the variables.  Specifically, it shows the variables names, the variable field width, variable definition, and range of values.


*Tidy.txt* is the tidy data set produced shows the averages of all mean and standard deviation variables for each activity and each subject.

*UCI HAR Dataset* folder contains the raw data set used as well as detailed descriptions of the raw data.

----------

### Raw data set information###

Data used in this analysis comes from the realm of wearing computing.  A more detailed description of the data can be found [here][1].

The raw data contains 561 unlabeled variables for 7352 train observations and 2947 test observations.  All features/values have been normalized and bounded within [-1,1].  The variables labels is in the *features.txt* file.  The activities are in the train.y and test.y files.  The activity mapping table is the activity_label file.


----------
### Run_analysis.R script information###

The script runs the following steps:

 1. The script creates a temporary folder and downloads the zipped raw data file into the temporary folder.   

 2. The file is unzipped and the relevant files are imported into R.  

 3. The 70% train data and 30% test data are merged to form one combined table called dat1.

 4. Variable name were conformed to syntactically-correct names for ease of reading: capital letters were left in the variable names to help with readability since variable names can be long; special characters are replaced with periods.  An example for conforming logic applied to a variable name is "tBodyAcc-mean()-x" was changed to "tBodyAcc.mean...X".
    
 5. Variable selection:  Only variables of mean or standard deviation were kept in the in the tidy data set.  Any angle() variable was excluded from the tidy data set because they measure the angle between two designated values rather than spatial movements.  

 6. Subject id's were added.
 
 7. The activity id's are compared against a reference mapping table in order translate the id values into meaningful activity labels.  For example, any record with activity ID 1 was mapped to the activity label of walking.

 8. The data was then summarized to an activity a subject level (i.e. the data table was reshaped).  Specifically, each column still represents a mean or standard deviation measure, each observation now represents the mean of a particular subject & activity combination.


 9. The output tidy file is exported as tidy.txt


----------
###Assumptions###

 * All columns representing means contain ...mean() in them.
 * All columns representing standard deviations contain ...std() in them.
 * The run_analysis.R file requires the plyr package to be installed on the user's machine.

  [1]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones