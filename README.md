# Getting and Cleaning Data

Project 1 of the Getting and Cleaning Data Coursera course by Johns Hopkins University.

## Course Project

All data needed for this project can be found here

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

* In order to run run_analysis.R, have "data" directory in the same directory as run_analysis.R and have structure like this

<pre>
YOUR_DIRECTORY
|
├── data
│   ├── activity_labels.txt
│   ├── features.txt
│   ├── test
│   │   ├── X_test.txt
│   │   ├── subject_test.txt
│   │   └── y_test.txt
│   └── train
│       ├── X_train.txt
│       ├── subject_train.txt
│       └── y_train.txt
└── run_analysis.R
</pre>

* After running run_analysis.R you should get two new files

merged_tidy_data_set.txt
tidy_activity_subject_average_data.txt

* And now your file structure should be:

<pre>
YOUR_DIRECTORY
|
├── data
│   ├── activity_labels.txt
│   ├── features.txt
│   ├── test
│   │   ├── X_test.txt
│   │   ├── subject_test.txt
│   │   └── y_test.txt
│   └── train
│       ├── X_train.txt
│       ├── subject_train.txt
│       └── y_train.txt
├── merged_tidy_data_set.txt
├── run_analysis.R
└── tidy_activity_subject_average_data.txt
</pre>