CourseProject_GCD
=================

Course Project for Getting and Cleaning Data


Installation Instructions: 

1. Create a directory for this project, name it samsung.
2. Download the script run_analysis.R to samsung.
3. Download the raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to samsung and unzip it.


Dependencies: 
The script run_analysis.R depends on the library reshape2. 


Running the analysis

1. Change the working directory in R to the installation directory "samsung".
2. Source the script run_analysis.R using code: source("run_analysis.R")

How script works:

1. Reads the data ( test and train ) from the working directory
2. Checks the dimensions of all the tables to make sure when we rbind or cbind, if makes sense
3. Adds label names to the fields
4. rbinds the train adn test data for subject, activity and data
5. cbinds the three data to have the complete dataset to start analysis called as syX_TT
6. Extracts the columns for mean and std
7. Keeps the mean and std related columns and subject and activity column.
8. uses reshape2 package to utilize melt and dcast functions to change the activity from numbers to actual descriptions.
9. Groups data by subject and activity to create tidydata_final
10. tidaydata_final is written in working directory as text file (tidy.txt)
