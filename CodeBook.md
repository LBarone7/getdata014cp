# CodeBook
This file describes describes which procedure has been carried out to clean up the data.

### Data set
The analysis is performed by using the [Human Activity Recognition Using Smartphones Data Set ](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). You can download the data set from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

The experiments have been carried out with a group of **30 volunteers** within an age bracket of 19-48 years. Each person performed **six activities** (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured **3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz**. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the **training data** and 30% the **test data**. 

- *X_train.txt* and *X_test.txt* contain the data for the experiment.
- *y_train.txt* and *y_test.txt* let us associate the data with the specific activity which has been carried out. 
- *subject_train.txt* and *subject_test.txt* let us associate the measurements with the specific volunteer.
- *features.txt* lists the 561 measurements which have been carried out for each volunteer.
- *activity_labels.txt* lists the 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) which have been carried out by each volunteer.

### How the script works
The R script, *run_analysis.R*, works as follows:
1. All the similar data are merged. Therefore, we obtain 3 files: the first includes the subjects, the second contains the list of activities, whereas in the third we collect the measurements. This represents the **Step 1** of the exercise, at the end of which I have three objects (*subjects*, *activities* and *rawdata*).
2. After that, the script extracts only the measurements on the mean and standard deviation for each measurement by subsetting the *features.txt* file and the *rawdata* object with the *grep* command (**Step 2**). Then, we adjust the name of each measurement with the *gsub*, which finds a string and edits it. 
3. As far as concerns the **third step**, we load *activity_labels.txt* and then we use it to associate the activity code (from 1 to 6) to the activity name in the object *activities*. To do this, I resort to a factor object and then "play" with its levels.
4. In **the fourth step**, we merge the three different objects (*subjects*, *activities* and *rawdata*)  and then get **one cleaned data** (**mydata**) set that considers only the measurements on the mean and standard deviation for each measurement.
5. Finally, as requested by the exercise, we create a second, independent tidy data set with the average of each variable for each activity and each subject. To do this, we first check whether the package **dplyr** is installed or not and then use it to achieve our objective. Our final data frame is called **mytidy_data** and it is stored in a txt file, whose name is *avg_data.txt*.

