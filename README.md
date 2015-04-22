# getting-and-cleaning-data-coruse-project
The analysis has performed to get a tidy data set with the means of variables that has reference to mean and to std, ordereds by user and activity.

TRANSFORMATIONS

1. charge library dplyr
2. load data in RStudio Version 0.98.1091
3. change labels (names of variables) to data from X_test.txt and X_train.txt
4. with a for command, examine all the columns and create 1 data frame for test file and 1 data frame for train file
with the variables that have reference to mean or to std functions
5. assign to data frames that comes frome files y_test.txt and y_train.txt the strings of activitys from activity_labels.txt
6. add 2 columns to the left of the data frames of test an train that represents activities and users
7. bind the two frames (test and train) in one (it could be done before)
8. split the data frane by activity and by user
9. calculate colmeans with lapply and data.frame to store the results
10. transpose data frame to accomplish with tidy data set principles every row 1 observation, every column 1 variable
11. save the result tidy data set to a file called: resultat.txt

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
