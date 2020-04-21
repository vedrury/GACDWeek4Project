Getting and Cleaning Data Week 4 Project Codebook
=================================================

Feature Selection
-----------------

The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain
signals (prefix ‘t’ to denote time) were captured at a constant rate of
50 Hz. Then they were filtered using a median filter and a 3rd order low
pass Butterworth filter with a corner frequency of 20 Hz to remove
noise. Similarly, the acceleration signal was then separated into body
and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
using another low pass Butterworth filter with a corner frequency of 0.3
Hz.

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional
signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the ‘f’ to
indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for
each pattern:  
‘-XYZ’ is used to denote 3-axial signals in the X, Y and Z directions.

-   tBodyAcc-XYZ
-   tGravityAcc-XYZ
-   tBodyAccJerk-XYZ
-   tBodyGyro-XYZ
-   tBodyGyroJerk-XYZ
-   tBodyAccMag
-   tGravityAccMag
-   tBodyAccJerkMag
-   tBodyGyroMag
-   tBodyGyroJerkMag
-   fBodyAcc-XYZ
-   fBodyAccJerk-XYZ
-   fBodyGyro-XYZ
-   fBodyAccMag
-   fBodyAccJerkMag
-   fBodyGyroMag
-   fBodyGyroJerkMag

The set of variables that were estimated from these signals are: +
mean(): Mean value + std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window
sample. These are used on the angle() variable:

-   gravityMean
-   tBodyAccMean
-   tBodyAccJerkMean
-   tBodyGyroMean
-   tBodyGyroJerkMean

The complete list of variables of each feature vector is available in
‘features.txt’

run\_analysis.R
---------------

### **1. Prepare workspace**

-   Install and add dplyr library
-   Make and set working directory to folder named “data”

### **2. Download data**

-   Save download date `datedownloaded<-date`
-   Save data url
    `url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"`
-   Download files to data folder and unzip
    -   folder is called “UCI HAR Dataset”
-   Create and name tables from unzipped folder
    -   `featurenames<-features.txt`: measurements of the data set aka
        variable names

    -   `trainsub<-train/subject_train.txt`: subjects of training set
    -   `trainx<-train/X_train.txt`: recorded training measurements
    -   `trainy<-train/y_train.txt`: corresponding activities (coded;
        refer to `actlabels`)

    -   `testsub<-test/subject_test.txt`: subjects of testing set
    -   `testx<-test/X_test.txt`: recorded testing measurements
    -   `testy<-test/y_test.txt`: corresponding activities (coded; refer
        to `actlabels`)

### **3. Merge datasets**

-   Merge 3 train datasets to `train` using **cbind()**
-   Merge 3 test datasets to `test` using **cbind()**
-   Merge `train` and `test` to `merged` using **rbind()**
-   Make descriptive activity labels
    -   `actlabels<-activity_labels.txt`

### **4. Subset mean and std measures from merged dataset**

-   Create `mytidy` from subsetting only `merged` columns
    `Subject`,`Activity`, and those containing `mean` or `std`
-   Transform `actlabels` to lowercase and use to replace values of
    `Activity`

### **5. Clean up column names**

-   Replace `^t` with `Time`
-   Replace `^f` with `Frequency`
-   Replace `Gyro` with `Gyroscope`
-   Replace `Acc` with `Accelerometer`
-   Replace `gravity` with `Gravity`
-   Replace `Mag` with `Magnitude`
-   Replace `BodyBody` with `Body`
-   Replace `std` with `STD`
-   Replace `mean` with `Mean`
-   Replace `angle` with `Angle`
-   Replace `tBody` with `TimeBody`

### **6. Write final tidy dataset, grouped by Subject, Activity, with mean of all mean and std variables**

-   Create `finaltidy` using dplyr’s `group_by` and `summarize_all`
    functions
