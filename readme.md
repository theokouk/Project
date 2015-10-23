---
title: "readme"
output:
  html_document: default
---

###Notice: This project was submitted two sessions ago but I was not able to finish the course. The work is original and it is mine :)


## Overview

The current project is an implementation of processing and tidying up various related data sets. The final goal is to create a tidy data set which can be used later for exploratory purposes. The core of the project is a script named "run_analysis.R".


## What the script does

The script executes the following tasks:

1. Download and unzip the data 
(for this step each user must choose the directory path of his/her preference, e.g. C:/Users/xxxx/Documents/xxxx).
2. Import the "features" data set (which contains the name of the features).
2. Import and merge the "train" and "test" features data sets. 
3. Extract the mean and standard deviation for each measurement/feature.
4. Import and merge the "activity","train" and "test", data sets.
5. Import and merge the "subject","train" and "test", data sets.
6. Create one data set merging all the above merged data sets.
7. Give names to the activities of the data set.
8. Label the data set with descriptive variable names.
9. Average each variable for each activity and each subject (the tidy data set).
10. Export the tidy data set as text file (the "tidydata.txt" file in the repo).

## Notes
1. The working directory must contain a folder named "UCI HAR Dataset" otherwise the script will not run.
2. No extra packages are needed to run the script.
3. For more, in depth, analysis check the Codebook.md





