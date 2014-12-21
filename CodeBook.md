Data sets used:

subject_test.txt, subject_train.txt, X_test, X_train, y_test, y_train, features.txt, activity_labels.txt


The script run_analysis.R performs the 5 steps described in the course project's problem statement.

First, all the similar data is merged using the rbind() function. By similar, we address those files having the same number of columns and referring to the same entities.
Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.
As activity data is addressed with values 1:6, we take the activity names and IDs and they are substituted in the dataset.
Finally, we generate a new dataset with all the average measures for each subject and activity type. The output file is called tidy.txt, and uploaded to this repository.


Variables

1. X_train, y_train, X_test, y_test, subject_train and subject_test contain the data from the downloaded files.
2. X_TT, y_TT and subject_TT merge the previous datasets to further analysis.
3. syX_TT is the resul of merging X_TT,y_TT,subject_TT.
4. featureNames contains the contents of features.txt, whose V2 is used for name the X_train and X_test datasets.
5. A similar approach is taken with activity names through the activities variable.
6. cols_meanstd is obtained from syX_TT with columns subject, activity and means and std related fields. All the rows for the mentioned columns is taken from syX_TT to cols_meanstd.
7. tidydata is an intermediate between syX_TT and final table tidydata_final. It is created by applying melt() function on syX_TT.
8. tidydata_final contains the relevant averages which will be later stored in a .txt file. dcast() functions from reshape2 package is used to create this final dataset from tidydata.
