Getting & Cleaning Data Course Project
====================================

This repo contains files for the Course Project for the *Getting & Cleaning Data* course at Coursera.  This ReadMe file explains how all of the scripts work and how they are connected.  


----------


###Contents of this repo###

 - ReadMe.md
 - Run_analysis.R
 - CodeBook.md
 - A tidy data set (?name)

The tidy data set produced shows the averages of all mean and standard deviation variables for each activity and each subject.


*Run_analysis.R* is the R script that does the following:

 * Download and store the data
 * Merge the training and the test sets to create one data set
 * Extract only the measurements on the mean and standard deviation 
 * Uses descriptive activity names to name the activities in the data set
 * Labels the data set with syntactically-correct descriptive variable names
 * Create the tidy data set


*CodeBook.md* is the code book provided to describe the variables.  Specifically, it shows the variables names, the variable field width, variable definition, and range of values.


----------


Data used represent data collected in the realm of wearing computing, that is, data collected from human activities recorded from accelerometers in the Samsung Galaxy S smartphone.  