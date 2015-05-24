# Getting and Cleaning Data May 2015 - Course Project

This repository hosts my Course Project for the Coursera's Getting and Cleaning Data course. The analysis is performed by using the [Human Activity Recognition Using Smartphones Data Set ](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

* Before running the script, download the actual data set from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) in the **UCI HAR Dataset** folder.
* **run_analysis.R** is the script that performs the analysis by putting together and cleaning the data set.
* **Codebook.md** describes which procedure has been carried out to clean up the data.
* **avg_data.txt** is the tidy data set with the average of each variable for each activity and each subject. The file is output obtained from the fifth step of the analysis.
* In order to reproduce the analysis, please make sure that the current **working directory** includes both the folder **UCI HAR Dataset** and **run_analysis.R**.
