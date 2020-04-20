Getting and Cleaning Data Week 4 Project Codebook
=================================================

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
