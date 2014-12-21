CourseProject_GCD
=================

Course Project for Getting and Cleaning Data

Dependencies: 
The script run_analysis.R depends on the library reshape2. 


Running analysis: 

1. Create a directory for this project, set it as a working directory.
2. Download the script run_analysis.R to that working directory.
3. Download the raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, unzip it and copy the contents of the folder "UCI HAR Dataset" in the working directory.


Structure of the working directory now should look like:

working directory -->

1. test (folder)
2. train (folder)
3. run_analysis.R (file)
4. activity_labels.txt (file)
5. features.txt (file)
6. features_info.txt (file)
7. README.txt (file)

Final step in running analysis:

Source the script run_analysis.R using code: source("run_analysis.R")


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
