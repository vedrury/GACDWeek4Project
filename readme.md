Getting and Cleaning Data Week 4 Project
========================================

submission by Vanessa Drury

Files
-----

-   **codebook.md**: describes the variables, data, and any
    transformations or work performed to clean up the data
-   **`run_analysis.R`**: script that performs the following, as
    established by the project rubric:
    1.  Merges the training and the test sets to create one data set.
    2.  Extracts only the measurements on the mean and standard
        deviation for each measurement.
    3.  Uses descriptive activity names to name the activities in the
        data set
    4.  Appropriately labels the data set with descriptive variable
        names.
    5.  From the data set in step 4, creates a second, independent tidy
        data set with the average of each variable for each activity and
        each subject.
-   **finaltidy.txt**: the final tidy dataset resultant from
    objective 5.

Dataset
-------

Here are the raw data for the project: [UCI Human Activity Recognition
Using
Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
Note: the Inertial Signals folders are not used for this analysis

From the original dataset README:
---------------------------------

Human Activity Recognition Using Smartphones Dataset Version 1.0 Jorge
L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab -
Non Linear Complex Systems Laboratory DITEN - Universit‡ degli Studi di
Genova. Via Opera Pia 11A, I-16145, Genoa, Italy.
<a href="mailto:activityrecognition@smartlab.ws" class="email">activityrecognition@smartlab.ws</a>
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain. See
‘features\_info.txt’ for more details.

For each record it is provided: + Triaxial acceleration from the
accelerometer (total acceleration) and the estimated body acceleration.
+ Triaxial Angular velocity from the gyroscope. + A 561-feature vector
with time and frequency domain variables. + Its activity label. + An
identifier of the subject who carried out the experiment.

The dataset includes the following files:

-   ‘README.txt’

-   ‘features\_info.txt’: Shows information about the variables used on
    the feature vector.

-   ‘features.txt’: List of all features.

-   ‘activity\_labels.txt’: Links the class labels with their activity
    name.

-   ‘train/X\_train.txt’: Training set.

-   ‘train/y\_train.txt’: Training labels.

-   ‘test/X\_test.txt’: Test set.

-   ‘test/y\_test.txt’: Test labels.

The following files are available for the train and test data. Their
descriptions are equivalent.

-   ‘train/subject\_train.txt’: Each row identifies the subject who
    performed the activity for each window sample. Its range is from 1
    to 30.

-   ‘train/Inertial Signals/total\_acc\_x\_train.txt’: The acceleration
    signal from the smartphone accelerometer X axis in standard gravity
    units ‘g’. Every row shows a 128 element vector. The same
    description applies for the ‘total\_acc\_x\_train.txt’ and
    ‘total\_acc\_z\_train.txt’ files for the Y and Z axis.

-   ‘train/Inertial Signals/body\_acc\_x\_train.txt’: The body
    acceleration signal obtained by subtracting the gravity from the
    total acceleration.

-   ‘train/Inertial Signals/body\_gyro\_x\_train.txt’: The angular
    velocity vector measured by the gyroscope for each window sample.
    The units are radians/second.

Notes: + Features are normalized and bounded within \[-1,1\]. + Each
feature vector is a row on the text file.

For more information about this dataset contact:
<a href="mailto:activityrecognition@smartlab.ws" class="email">activityrecognition@smartlab.ws</a>

License: Use of this dataset in publications must be acknowledged by
referencing the following publication \[1\]

\[1\] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and
Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
Multiclass Hardware-Friendly Support Vector Machine. International
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz,
Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or
explicit can be addressed to the authors or their institutions for its
use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita.
November 2012.
