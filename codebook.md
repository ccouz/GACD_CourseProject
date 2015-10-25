---
title: "Getting and Cleaning Data Course Project Code Book"
output: html_document
---

# Overview
Code book for the 'Getting and Cleaning Data' course project.  

# Source Files
All the files are in a zip file that were downloaded from:
[link ZIP of data files](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

## Additional information from the source
The following text is from the readme.txt in the source files:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).


# Files used for processing
File                       | Description
---------------------------|----------------------------------------------------
 features_info.txt         | Shows information about the variables used on the feature vector.
 features.txt              | List of all features.
 activity_labels.txt       | Links the class labels with their activity name.
 train/X_train.txt         | Training set.
 train/y_train.txt         | Training labels.
 train/subject_train.txt   | Training subject Ids
 test/X_test.txt           | Test set.
 test/y_test.txt           | Test labels.
 test/subject_test.txt     | Test subjects

# Variables and Files

## Variables in x_train.txt and y_test.txt
The following variables are used in in the x_train.txt and x_test.txt files.

### 3 Cordinate variables
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

### Feature Variables            
 - tBodyAcc-XYZ         
 - tGravityAcc-XYZ      
 - tBodyAccJerk-XYZ   
 - tBodyGyro-XYZ      
 - tBodyGyroJerk-XYZ  
 - tBodyAccMag        
 - tGravityAccMag     
 - tBodyAccJerkMag    
 - tBodyGyroMag       
 - tBodyGyroJerkMag   
 - fBodyAcc-XYZ       
 - fBodyAccJerk-XYZ   
 - fBodyGyro-XYZ      
 - fBodyAccMag        
 - fBodyAccJerkMag    
 - fBodyGyroMag       
 - fBodyGyroJerkMag   
   

### The set of variables that were estimated from the above values: 

Variables                             | Description
--------------------------------------|----------------------------------------
mean                                  | Mean value
std                                   | Standard deviation
mad()                                 | Median absolute deviation 
max()                                 | Largest value in array
min()                                 | Smallest value in array
sma()                                 | Signal magnitude area
energy()                              | Energy measure. Sum of the squares divided by the number of values. 
iqr()                                 | Interquartile range 
entropy()                             | Signal entropy
arCoeff()                             | Autorregresion coefficients with Burg order equal to 4
correlation()                         | correlation coefficient between two signals
maxInds()                             | index of the frequency component with largest magnitude
meanFreq()                            | Weighted average of the frequency components to obtain a mean frequency
skewness()                            | skewness of the frequency domain signal 
kurtosis()                            | kurtosis of the frequency domain signal 
angle(tBodyAccMean,gravity)           | NA
angle(tBodyAccJerkMean),gravityMean)  | NA
angle(tBodyGyroMean,gravityMean)      | NA
angle(tBodyGyroJerkMean,gravityMean)  | NA
angle(X,gravityMean)                  | NA
angle(Y,gravityMean)                  | NA
angle(Z,gravityMean)                  | NA


## Values from activity_lables.txt

Activity ID    | Activity
---------------|-----------------------------------------
1              | WALKING
2              | WALKING_UPSTAIRS
3              | WALKING_DOWNSTAIRS
4              | SITTING
5              | STANDING
6              | LAYING

## Variables from y_test.txt and y_train.txt

Variable     | Description
-------------|-----------------------------------------
activity id  | Id for testing or training activity


## Variables from subject_test.txt and subject_train.txt

Variable     | Description
-------------|-----------------------------------------
subject id   | Id for testing or training subject


# Transformations

The following steps were take to process and format the data

 * General reference data
  1. Loaded the list of features collected into a vector from features.txt.
  2. Created a dataset (keep.col) that contains and index and only the std and mean features columns to process.
* Testing files
  1. Only read the features from X_test.txt that were indicated by keep.col 
  2. Joined x_test.txt and y_test.txt to combine the feature and estimated observations with the activity ids
  3. The joined the result with subject_test.txt to combine with the test subject id.
* Training files
  1. Only read the features from X_train.txt that were indicated by keep.col 
  2. Joined x_train.txt and y_train.txt to combine the feature and estimated observations with the activity ids
  3. The joined the result with subject_train.txt to combine with the test subject id.
* Merge Testing and Training Observations
* Created a tidy summary dataset  of the merged data that calculated the mean of all features and grouped by activity and test subject
* Saved the newly created tidy dataset


# Output Tidy Dataset
The output file 'test-train-avg-summary.csv' will be written into the out directory. Following is the structure of the file.

Column | Variable
-------|--------|-----------------------------------------
1      | activity
2      | subject_id
3      | tBodyAcc-mean()-X-avg-by-act-subj
4      | tBodyAcc-mean()-Y-avg-by-act-subj
5      | tBodyAcc-mean()-Z-avg-by-act-subj
6      | tBodyAcc-std()-X-avg-by-act-subj
7      | tBodyAcc-std()-Y-avg-by-act-subj
8      | tBodyAcc-std()-Z-avg-by-act-subj
9      | tGravityAcc-mean()-X-avg-by-act-subj
10     | tGravityAcc-mean()-Y-avg-by-act-subj
11     | tGravityAcc-mean()-Z-avg-by-act-subj
12     | tGravityAcc-std()-X-avg-by-act-subj
13     | tGravityAcc-std()-Y-avg-by-act-subj
14     | tGravityAcc-std()-Z-avg-by-act-subj
15     | tBodyAccJerk-mean()-X-avg-by-act-subj
16     | tBodyAccJerk-mean()-Y-avg-by-act-subj
17     | tBodyAccJerk-mean()-Z-avg-by-act-subj
18     | tBodyAccJerk-std()-X-avg-by-act-subj
19     | tBodyAccJerk-std()-Y-avg-by-act-subj
20     | tBodyAccJerk-std()-Z-avg-by-act-subj
21     | tBodyGyro-mean()-X-avg-by-act-subj
22     | tBodyGyro-mean()-Y-avg-by-act-subj
23     | tBodyGyro-mean()-Z-avg-by-act-subj
24     | tBodyGyro-std()-X-avg-by-act-subj
25     | tBodyGyro-std()-Y-avg-by-act-subj
26     | tBodyGyro-std()-Z-avg-by-act-subj
27     | tBodyGyroJerk-mean()-X-avg-by-act-subj
28     | tBodyGyroJerk-mean()-Y-avg-by-act-subj
29     | tBodyGyroJerk-mean()-Z-avg-by-act-subj
30     | tBodyGyroJerk-std()-X-avg-by-act-subj
31     | tBodyGyroJerk-std()-Y-avg-by-act-subj
32     | tBodyGyroJerk-std()-Z-avg-by-act-subj
33     | tBodyAccMag-mean()-avg-by-act-subj
34     | tBodyAccMag-std()-avg-by-act-subj
35     | tGravityAccMag-mean()-avg-by-act-subj
36     | tGravityAccMag-std()-avg-by-act-subj
37     | tBodyAccJerkMag-mean()-avg-by-act-subj
38     | tBodyAccJerkMag-std()-avg-by-act-subj
39     | tBodyGyroMag-mean()-avg-by-act-subj
40     | tBodyGyroMag-std()-avg-by-act-subj
41     | tBodyGyroJerkMag-mean()-avg-by-act-subj
42     | tBodyGyroJerkMag-std()-avg-by-act-subj
43     | fBodyAcc-mean()-X-avg-by-act-subj
44     | fBodyAcc-mean()-Y-avg-by-act-subj
45     | fBodyAcc-mean()-Z-avg-by-act-subj
46     | fBodyAcc-std()-X-avg-by-act-subj
47     | fBodyAcc-std()-Y-avg-by-act-subj
48     | fBodyAcc-std()-Z-avg-by-act-subj
49     | fBodyAcc-meanFreq()-X-avg-by-act-subj
50     | fBodyAcc-meanFreq()-Y-avg-by-act-subj
51     | fBodyAcc-meanFreq()-Z-avg-by-act-subj
52     | fBodyAccJerk-mean()-X-avg-by-act-subj
53     | fBodyAccJerk-mean()-Y-avg-by-act-subj
54     | fBodyAccJerk-mean()-Z-avg-by-act-subj
55     | fBodyAccJerk-std()-X-avg-by-act-subj
56     | fBodyAccJerk-std()-Y-avg-by-act-subj
57     | fBodyAccJerk-std()-Z-avg-by-act-subj
58     | fBodyAccJerk-meanFreq()-X-avg-by-act-subj
59     | fBodyAccJerk-meanFreq()-Y-avg-by-act-subj
60     | fBodyAccJerk-meanFreq()-Z-avg-by-act-subj
61     | fBodyGyro-mean()-X-avg-by-act-subj
62     | fBodyGyro-mean()-Y-avg-by-act-subj
63     | fBodyGyro-mean()-Z-avg-by-act-subj
64     | fBodyGyro-std()-X-avg-by-act-subj
65     | fBodyGyro-std()-Y-avg-by-act-subj
66     | fBodyGyro-std()-Z-avg-by-act-subj
67     | fBodyGyro-meanFreq()-X-avg-by-act-subj
68     | fBodyGyro-meanFreq()-Y-avg-by-act-subj
69     | fBodyGyro-meanFreq()-Z-avg-by-act-subj
70     | fBodyAccMag-mean()-avg-by-act-subj
71     | fBodyAccMag-std()-avg-by-act-subj
72     | fBodyAccMag-meanFreq()-avg-by-act-subj
73     | fBodyBodyAccJerkMag-mean()-avg-by-act-subj
74     | fBodyBodyAccJerkMag-std()-avg-by-act-subj
75     | fBodyBodyAccJerkMag-meanFreq()-avg-by-act-subj
76     | fBodyBodyGyroMag-mean()-avg-by-act-subj
77     | fBodyBodyGyroMag-std()-avg-by-act-subj
78     | fBodyBodyGyroMag-meanFreq()-avg-by-act-subj
79     | fBodyBodyGyroJerkMag-mean()-avg-by-act-subj
80     | fBodyBodyGyroJerkMag-std()-avg-by-act-subj
81     | fBodyBodyGyroJerkMag-meanFreq()-avg-by-act-subj
82     | angle(tBodyAccMean,gravity)-avg-by-act-subj
83     | angle(tBodyAccJerkMean),gravityMean)-avg-by-act-subj
84     | angle(tBodyGyroMean,gravityMean)-avg-by-act-subj
85     | angle(tBodyGyroJerkMean,gravityMean)-avg-by-act-subj
86     | angle(X,gravityMean)-avg-by-act-subj
87     | angle(Y,gravityMean)-avg-by-act-subj
88     | angle(Z,gravityMean)-avg-by-act-subj



