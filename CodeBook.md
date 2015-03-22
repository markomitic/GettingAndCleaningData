Course Project Code Book
========================

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


<b>run_analysis.R</b> generates two files:


### merged\_tidy\_data\_set.txt

Represents merged the training and the test sets with only the measurements on the mean and standard deviation for each measurement extracted.

### tidy\_activity\_subject\_average\_data.txt

Independent tidy data set with the average of each variable for each activity and each subject.

## Columns

* Activity column has values that represent person activity wearing a smartphone 

        walking
        walking_upstairs
        walking_downstairs
        sitting
        standing
        laying

* Subject column - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

* All the rest columns (feature names) are measurements on the mean and standard deviation for each measurement 
