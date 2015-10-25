# Gettign and Cleaning Data Course Project


library(dplyr)
library(data.table)

#if (!file.exists("./data")) dir.create("./data")
# Downlaod zip file
#harDataUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(harDataUrl, destfile = "./data/HARDataSet.zip", method="curl")
#unzip("./data/HARDataSet.zip",  exdir = "./data")

#harDSDir <- file.path("./data", "UCI HAR Dataset")
harDSDir <- "."

###############################
##  Shared Working datasets  ##
##  (test and train)         ##  
###############################

#load features
features = fread(file.path(harDSDir, "features.txt"), sep=" ", header = FALSE, col.names = c("index","feature"))
#index.feature = features[grep("mean\\(\\)|std\\(\\)", feature),]$index

# List of columns from X-test and X-train to keep
keep.index = features[grep("[mM]ean|std", feature),]$index
keep.feature = features[grep("[mM]ean|std", feature),]$feature
keep.col = data.table(keep.index, keep.feature)
colnames(keep.col) = c("index","feature")

#load activity labels
activity.label = fread(file.path(harDSDir, "activity_labels.txt"), sep=" ", header = FALSE, 
                 col.names = c("activity_id","activity"))

#####################
##  TESTING Data   ##
#####################

#load x-test
x.test = fread(file.path(harDSDir, "X_test.txt"), sep=" ", header = FALSE, 
               col.names = keep.col[,feature],
               select = keep.col[, index])

#load y-test activity
y.test.activity_id = fread(file.path(harDSDir, "y_test.txt"), sep=" ", header = FALSE, 
               col.names = c("activity_id"))

# load subject_test.txt
test.subject_id = fread(file.path(harDSDir, "subject_test.txt"), sep=" ", header = FALSE, 
                          col.names = c("subject_id"))

# Add the y-test activity id to  test
x.test[,activity_id:=y.test.activity_id[,activity_id]]

# Add the subject id to  test
x.test[,subject_id:=test.subject_id[,subject_id]]

# Merge with acitvity to get friendly names
x.test.activity = merge(activity.label, x.test, by="activity_id")

# Add column to indicate observations came from test data
x.test.activity[,set:="TEST"]


#####################
##  TRAINING Data  ##
#####################

#load x-train
x.train = fread(file.path(harDSDir, "X_train.txt"), sep=" ", header = FALSE, 
               col.names = keep.col[,feature],
               select = keep.col[, index])

#load y-train activity
y.train.activity_id = fread(file.path(harDSDir, "y_train.txt"), sep=" ", header = FALSE, 
                           col.names = c("activity_id"))

# load subject_test.txt
train.subject_id = fread(file.path(harDSDir, "subject_train.txt"), sep=" ", header = FALSE, 
                        col.names = c("subject_id"))

# Add the y-train activity id to  test
x.train[,activity_id:=y.train.activity_id[,activity_id]]

# Add the subject id to  test
x.train[,subject_id:=train.subject_id[,subject_id]]

# Merge with acitvity to get friendly names
x.train.activity = merge(activity.label, x.train, by="activity_id")

# Add column to indicate observations came from test data
x.train.activity[,set:="TRAIN"]


#####################
##  MERGE    Data  ##
#####################

# Merge testing and training data sets
test.train = rbind(x.test.activity, x.train.activity)

# Calculate mean for all features and arrange by activity and subject.
test.train.avg.summary = test.train %>% group_by(activity, subject_id) %>% summarise_each(funs(mean), one_of(keep.feature))

# Update summary column names to indicate they are averages by activity and subject
colnames(test.train.avg.summary) = c("activity","subject_id", paste( keep.feature, "-avg-by-act-subj" , sep=""))


#####################
##  EXPORT  Data  ##
#####################

# Sort by Activity and Subject Id
test.train.avg.summary = arrange(test.train.avg.summary, activity, subject_id)

#if (!file.exists("./out")) dir.create("./out")

write.table(test.train.avg.summary, file = "./test-train-avg-summary.csv.txt", sep=",", col.names = TRUE, row.names = FALSE) 

