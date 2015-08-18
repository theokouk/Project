---
title: "Codebook"
output: html_document
---

Preliminaries

For a  description of the original data, various information etc. press the following link
[Original data information](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Processing the data

Once the file is downloaded and unzipped, a folder "UCI HAR Dataset" is created.
The folder "UCI HAR Dataset" contains the following 28 files

```
[1] "activity_labels.txt"                         
[2] "features.txt"                                
[3] "features_info.txt"                           
[4] "README.txt"                                  
[5] "test/Inertial Signals/body_acc_x_test.txt"   
[6] "test/Inertial Signals/body_acc_y_test.txt"   
[7] "test/Inertial Signals/body_acc_z_test.txt"   
[8] "test/Inertial Signals/body_gyro_x_test.txt"  
[9] "test/Inertial Signals/body_gyro_y_test.txt"  
[10] "test/Inertial Signals/body_gyro_z_test.txt"  
[11] "test/Inertial Signals/total_acc_x_test.txt"  
[12] "test/Inertial Signals/total_acc_y_test.txt"  
[13] "test/Inertial Signals/total_acc_z_test.txt"  
[14] "test/subject_test.txt"                       
[15] "test/X_test.txt"                             
[16] "test/y_test.txt"                             
[17] "train/Inertial Signals/body_acc_x_train.txt" 
[18] "train/Inertial Signals/body_acc_y_train.txt" 
[19] "train/Inertial Signals/body_acc_z_train.txt" 
[20] "train/Inertial Signals/body_gyro_x_train.txt"
[21] "train/Inertial Signals/body_gyro_y_train.txt"
[22] "train/Inertial Signals/body_gyro_z_train.txt"
[23] "train/Inertial Signals/total_acc_x_train.txt"
[24] "train/Inertial Signals/total_acc_y_train.txt"
[25] "train/Inertial Signals/total_acc_z_train.txt"
[26] "train/subject_train.txt"                     
[27] "train/X_train.txt"                           
[28] "train/y_train.txt"
```

Out of these 28 files the following were used for the project:

```
- "features.txt", the name of the measurements/features (561 in total).
- "activity_labels.txt", activities by name.
- "X_train.txt": the measurements of the training set.
- "X_test.txt",the measurements of the test set.
- "y_train.txt", activities by measurement for the training set (coded in numbers from 1 to 5).
- "y_test.txt", activities by measurement for the test set (coded in numbers from 1 to 5).
- "subject_train.txt", the number ID for each person in the training set.
- "subject_test.txt", the number ID for each person in the test set.
```

Merging of the data sets. The folowing merges took place:


- First, the features data sets by their respective names 
  (the "X_train.txt" with the "X_test.txt" data sets by the "features.txt" data set)
  A subset was created containing only the mean and standard deviation of each measurement
  (dimensions of the subset: 10299 rows by 66 columns)
  
- Second, the activities data sets ("y_train.txt", "y_test.txt")
  (dimensions of the merged set: 10299 rows by 1 column)

- Third, the subject data sets ("subject_train.txt","subject_test.txt")
  (dimensions of the merged set: 10299 rows by 1 column)
  
- Fourth, a  data set merging the above merged data sets was created
  (dimensions of the  set: 10299 rows by 68 columns)

Assigning names and labels.

- Replace the activities number with their corresponding names.

- Change the descriptive names of the features to  more appropriate names.

The column names after the transformations (transformed set)

```
[1] “subject”
[2] “timeBodyAccelerometer.mean…X”
[3] “timeBodyAccelerometer.mean…Y”
[4] “timeBodyAccelerometer.mean…Z”
[5] “timeBodyAccelerometer.std…X”
[6] “timeBodyAccelerometer.std…Y”
[7] “timeBodyAccelerometer.std…Z”
[8] “timeGravityAccelerometer.mean…X”
[9] “timeGravityAccelerometer.mean…Y”
[10] “timeGravityAccelerometer.mean…Z”
[11] “timeGravityAccelerometer.std…X”
[12] “timeGravityAccelerometer.std…Y”
[13] “timeGravityAccelerometer.std…Z”
[14] “timeBodyAccelerometerJerk.mean…X”
[15] “timeBodyAccelerometerJerk.mean…Y”
[16] “timeBodyAccelerometerJerk.mean…Z”
[17] “timeBodyAccelerometerJerk.std…X”
[18] “timeBodyAccelerometerJerk.std…Y”
[19] “timeBodyAccelerometerJerk.std…Z”
[20] “timeBodyGyroscope.mean…X”
[21] “timeBodyGyroscope.mean…Y”
[22] “timeBodyGyroscope.mean…Z”
[23] “timeBodyGyroscope.std…X”
[24] “timeBodyGyroscope.std…Y”
[25] “timeBodyGyroscope.std…Z”
[26] “timeBodyGyroscopeJerk.mean…X”
[27] “timeBodyGyroscopeJerk.mean…Y”
[28] “timeBodyGyroscopeJerk.mean…Z”
[29] “timeBodyGyroscopeJerk.std…X”
[30] “timeBodyGyroscopeJerk.std…Y”
[31] “timeBodyGyroscopeJerk.std…Z”
[32] “timeBodyAccelerometerMagnitude.mean..”
[33] “timeBodyAccelerometerMagnitude.std..”
[34] “timeGravityAccelerometerMagnitude.mean..”
[35] “timeGravityAccelerometerMagnitude.std..”
[36] “timeBodyAccelerometerJerkMagnitude.mean..”
[37] “timeBodyAccelerometerJerkMagnitude.std..”
[38] “timeBodyGyroscopeMagnitude.mean..”
[39] “timeBodyGyroscopeMagnitude.std..”
[40] “timeBodyGyroscopeJerkMagnitude.mean..”
[41] “timeBodyGyroscopeJerkMagnitude.std..”
[42] “frequencyBodyAccelerometer.mean…X”
[43] “frequencyBodyAccelerometer.mean…Y”
[44] “frequencyBodyAccelerometer.mean…Z”
[45] “frequencyBodyAccelerometer.std…X”
[46] “frequencyBodyAccelerometer.std…Y”
[47] “frequencyBodyAccelerometer.std…Z”
[48] “frequencyBodyAccelerometerJerk.mean…X”
[49] “frequencyBodyAccelerometerJerk.mean…Y”
[50] “frequencyBodyAccelerometerJerk.mean…Z”
[51] “frequencyBodyAccelerometerJerk.std…X”
[52] “frequencyBodyAccelerometerJerk.std…Y”
[53] “frequencyBodyAccelerometerJerk.std…Z”
[54] “frequencyBodyGyroscope.mean…X”
[55] “frequencyBodyGyroscope.mean…Y”
[56] “frequencyBodyGyroscope.mean…Z”
[57] “frequencyBodyGyroscope.std…X”
[58] “frequencyBodyGyroscope.std…Y”
[59] “frequencyBodyGyroscope.std…Z”
[60] “frequencyBodyAccelerometerMagnitude.mean..”
[61] “frequencyBodyAccelerometerMagnitude.std..”
[62] “frequencyBodyAccelerometerJerkMagnitude.mean..”
[63] “frequencyBodyAccelerometerJerkMagnitude.std..” 
[64] “frequencyBodyGyroscopeMagnitude.mean..”
[65] “frequencyBodyGyroscopeMagnitude.std..”
[66] “frequencyBodyGyroscopeJerkMagnitude.mean..”
[67] “frequencyBodyGyroscopeJerkMagnitude.std..”
[68] “activity”
```

Tidy data

Tidy data set contains the average of the mean and standard deviation 
of all of the features of the transformed dataset ordered by subject and activity.
(dimensions of the tidy data set: 180 rows by 68 columns)


And a sample of the data in table format.


```
| subject |      activity      | timeBodyAccelerometer.mean...X | timeBodyAccelerometer.mean...Y |
|:-------:|:------------------:|:------------------------------:|:------------------------------:|
|    1    |       LAYING       |           0.2215982            |           -0.0405140           |
|    1    |      SITTING       |           0.2612376            |           -0.0013083           |
|    1    |      STANDING      |           0.2789176            |           -0.0161376           |
|    1    |      WALKING       |           0.2773308            |           -0.0173838           |
|    1    | WALKING DOWNSTAIRS |           0.2891883            |           -0.0099185           |
```
