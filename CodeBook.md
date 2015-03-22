

##Coursera: Getting and Cleaning Data Project


## 1. Variables


The variables included in the tyde dataset are:

record_id: unique identifier for each record

subject_id: identofier for each subject

activity_id: activity identifier

activity_name: activity name


### Mean and Standard deviation values for body acceleration time domain signals.
Units: standard gravity units 'g', normalized and bounded within [-1,1].

tBodyAcc.mean...X

tBodyAcc.mean...Y

tBodyAcc.mean...Z

tBodyAcc.std...X

tBodyAcc.std...Y

tBodyAcc.std...Z


### Mean and Standard deviation values for gravity acceleration time domain signals.
Units: standard gravity units 'g', normalized and bounded within [-1,1].

tGravityAcc.mean...X

tGravityAcc.mean...Y

tGravityAcc.mean...Z

tGravityAcc.std...X

tGravityAcc.std...Y

tGravityAcc.std...Z


### Mean and Standard deviation values for acceleration jerk time domain signals.
Units: standard gravity units 'g', normalized and bounded within [-1,1].

tBodyAccJerk.mean...X

tBodyAccJerk.mean...Y

tBodyAccJerk.mean...Z

tBodyAccJerk.std...X

tBodyAccJerk.std...Y

tBodyAccJerk.std...Z


### Mean and Standard deviation values for angular velocity time domain signals.
Units: radians/second, normalized and bounded within [-1,1].

tBodyGyro.mean...X

tBodyGyro.mean...Y

tBodyGyro.mean...Z

tBodyGyro.std...X

tBodyGyro.std...Y

tBodyGyro.std...Z


### Mean and Standard deviation values for angular velocity Jerk time domain signals.
Units: radians/second, normalized and bounded within [-1,1].

tBodyGyroJerk.mean...X

tBodyGyroJerk.mean...Y

tBodyGyroJerk.mean...Z

tBodyGyroJerk.std...X

tBodyGyroJerk.std...Y

tBodyGyroJerk.std...Z


### Other signal variables follow.
Acceleration ('Acc') units are in standard gravity units 'g', normalized and bounded within [-1,1].

Angular velocity ('Gyro') are in radians/second, normalized and bounded within [-1,1].



tBodyAccMag.mean..

tBodyAccMag.std..

tGravityAccMag.mean..

tGravityAccMag.std..

tBodyAccJerkMag.mean..

tBodyAccJerkMag.std..

tBodyGyroMag.mean..

tBodyGyroMag.std..

tBodyGyroJerkMag.mean..

tBodyGyroJerkMag.std..

### Variables indicating frequency domain signals:

fBodyAcc.mean...X

fBodyAcc.mean...Y

fBodyAcc.mean...Z

fBodyAcc.std...X

fBodyAcc.std...Y

fBodyAcc.std...Z

fBodyAcc.meanFreq...X

fBodyAcc.meanFreq...Y

fBodyAcc.meanFreq...Z

fBodyAccJerk.mean...X

fBodyAccJerk.mean...Y

fBodyAccJerk.mean...Z

fBodyAccJerk.std...X

fBodyAccJerk.std...Y

fBodyAccJerk.std...Z

fBodyAccJerk.meanFreq...X

fBodyAccJerk.meanFreq...Y

fBodyAccJerk.meanFreq...Z

fBodyGyro.mean...X

fBodyGyro.mean...Y

fBodyGyro.mean...Z

fBodyGyro.std...X

fBodyGyro.std...Y

fBodyGyro.std...Z

fBodyGyro.meanFreq...X

fBodyGyro.meanFreq...Y

fBodyGyro.meanFreq...Z

fBodyAccMag.mean..

fBodyAccMag.std..

fBodyAccMag.meanFreq..

fBodyBodyAccJerkMag.mean..

fBodyBodyAccJerkMag.std..

fBodyBodyAccJerkMag.meanFreq..

fBodyBodyGyroMag.mean..

fBodyBodyGyroMag.std..

fBodyBodyGyroMag.meanFreq..

fBodyBodyGyroJerkMag.mean..

fBodyBodyGyroJerkMag.std..

fBodyBodyGyroJerkMag.meanFreq..


### Variable added to indicate if reading was either for testing or training purposes.

partition: "test" or "train"




## 2. Data
-----------------------------

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag


The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation 

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values. 

iqr(): Interquartile range 

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal 

kurtosis(): kurtosis of the frequency domain signal 

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

angle(): Angle between to vectors.


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean



## 3. Data transformations
-----------------------------------

To obtain the tidy dataset the following transformations were made for both test and training data:

3.0. Column names were created at the time of loading all datasets.

3.1. Added a record_id to loaded data from the subject_test.txt file.

3.2. Created an inner join with data loaded from files y_test.txt and activity_labels.txt. This inner join was created by joining with column activity_id.  

3.3. Added a record_id to loaded data from the y_test.txt file.

3.4. Only variables containing the characters "mean" and "avg" were extracted from file X_test.txt.

3.5. Added a record_id to loaded data from the X_test.txt file.

3.6. Joined the 3 datasets by variable record_id.

3.7. Added column to each dataset (test and train) called partition to indicate the partition ("train" or "test") where subject was place.

3.8. Joined the train and test datasets.

3.9. To obtain the second tidy dataset, used function aggregate to summarize by groups formed by subject id and activity id. The value reported was the mean.






