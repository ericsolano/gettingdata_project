
## Coursera: Getting and Cleaning Data Project

The purpose of this project was to demonstrate my ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis.

This repository has two main files, in addition to this README file:

## 1. Script file 'run_analysis.R.

The R script reads a dataset with sources in multiple text files.
The source files are organized in a directory tree as follows:

+-- test

|   +-- Inertial Signals

    |   +-- body_acc_x_test.txt

    |   +-- body_acc_y_test.txt

    |   +-- body_acc_z_test.txt

    |   +-- body_gyro_x_test.txt

    |   +-- body_gyro_y_test.txt

    |   +-- body_gyro_z_test.txt

    |   +-- total_acc_x_test.txt

    |   +-- total_acc_x_test.txt

    |   +-- total_acc_x_test.txt

|   +-- subject_test.txt

|   +-- X_test.txt

|   +-- y_test.txt

+-- train

|   +-- Inertial Signals

    |   +-- body_acc_x_test.txt

    |   +-- body_acc_y_test.txt

    |   +-- body_acc_z_test.txt

    |   +-- body_gyro_x_test.txt

    |   +-- body_gyro_y_test.txt

    |   +-- body_gyro_z_test.txt

    |   +-- total_acc_x_test.txt

    |   +-- total_acc_x_test.txt

    |   +-- total_acc_x_test.txt

|   +-- subject_test.txt

|   +-- X_test.txt

|   +-- y_test.txt

+-- activity_labels.txt

+-- features.txt

+-- features_info.txt

+-- README.txt

	           	
Data from all files were extracted except for files in the 'Inertial Signals' directories.

The script has the following steps:

	1. Data were extracted from the activity_labels.txt and features.txt files. Column names were added at extraction time.

	2. Data from the test files were extracted.

		2.1. Data from file subject_test.txt was extracted. A record_id was added to data frame.

		2.2. Data from file y_test.txt was extracted. A record_id was added to data frame.

		2.3. Data from file X_test.txt was extracted. A logical vector was used to extract only data with the characters
			'mean' and 'avg'. A record_id was added to data frame.

		2.4. The three datasets were merged in a test data frame using 'join_all' and the record_id common field.

		2.5. A new variable 'partition' with value 'test' was added to the dataset.

	 3. Data from the train files were extracted.

		 3.1. Data from file subject_train.txt was extracted. A record_id was added to data frame.

		 3. 3. Data from file y_train.txt was extracted. A record_id was added to data frame.

		 3.3. Data from file X_train.txt was extracted. A logical vector was used to extract only data with the characters
			'mean' and 'avg'. A record_id was added to data frame.

		 3.4. The three datasets were merged in a train data frame using 'join_all' and the record_id common field.

		 3.5. A new variable 'partition' with value 'train' was added to the dataset.

	4. The test and train data frames were merged.



## 2. Code book file 'CodeBook.md'  

The code book for the final tidy dataset. 

The code book includes three sections:

	- Variables: brief description of variables

	- Data: purpose of data

	- Data transformations: changes to obtain the tidy dataset



