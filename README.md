## README

The dataset are the results of experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 

The sensor acceleration signal, which has gravitational (Noise) and body motion (Signal) components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 

From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


Our job was to:  
	1. Merge the training and the test sets to create one data set.  
	2. Extract only the measurements on the mean and standard deviation for each measurement.  
	3. Use descriptive activity names to name the activities in the data set.    
	4. Appropriately label the data set with descriptive variable names.  
	5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.  


The tidy data table was created two ways, table_wide is the wide-tidy table and table_long is the long tidy-data table.