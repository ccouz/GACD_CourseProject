---
title: "README"
author: "Clinton Courier"
date: "October 24, 2015"
output: html_document
---

The data processing script run_analysis.R performs the following at high level.

- Load the list of features observed (feature.txt)
- Load the activity ids and meaning (activity_labels.txt).
- Extracts only feature column names for mean and standard deviation to create a new dataset the is used to specify which columns will be read later.
- Load testing observations (X_test.txt).  Only the feature columns determined above will be included. 
- Load the testing activity ids (y_test.txt) associated with the testing observations.
- Load the testing subject ids (subject_test.txt) associated with the testing observations.
- Join the testing observations, activity ids, and subject ids into a testing dataset.
- Load training observations (X_train.txt).  Only the feature columns determined above will be included. 
- Load the training activity ids (y_train.txt) associated with the training observations.
- Load the training subject ids (subject_train.txt) associated with the training observations.
- Join the training observations, activity ids, and subject ids into a training dataset.
- Merge the testing and training sets to create one tidy data set. 
- Calculate mean for all features and arrange by activity and subject and create a new dataset. Save the resulting tidy dataset to a text file.



Files for the course project for the 'Getting and Cleaning Data' source in the Coursera Data Scientist Specialization.

File                               | Description
-----------------------------------|-------------------------------
run_analysis.R                     | R Script to create tidy data set
codebook.md                        | Codebook for for the creation of the data set
README.md                          | This file
HARDataSet.zip                     | ZIP file containing files to be processed
test-train-avg-summary.csv.txt     | CSV of the tidy dataset