# Codebook for Course Project
Pat  
19th May 2015  

## Project Description
#### Human Activity Recognition Using Smartphones Dataset

###Collection of the raw data

####Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

##Description of the variables in the tiny_data.txt file
The tidy data set is a data frame of size 180 x 81. The file has a header which is the variable names for the data set. There are 81 variables in the data set.

'data.frame':    180 obs. of  81 variables:

 Variable name: activity - activity performed by the subject
 Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 1 2 3 4 5 6 1 2 3 4 ...
 
 Variable name: subject - the study of interest
 int  [1, 30]
 
 Variable name: time-body-accelerometer-mean-X
 num  [-1, 1]
 
 Variable name: time-body-accelerometer-mean-Y 
 num  [-1, 1]
 
 Variable name: time-body-accelerometer-mean-Z 
 num  [-1, 1]
 
 Variable name: time-body-accelerometer-std-X
 num  [-1, 1]
 
 Variable name: time-body-accelerometer-std-Y 
 num  [-1, 1]
 
 Variable name: time-body-accelerometer-std-Z
 num  [-1, 1]
 
 Variable name: time-gravity-acceleration-mean-X 
 num  [-1, 1]
 
 Variable name: time-gravity-acceleration-mean-Y 
 num  [-1, 1]
 
 Variable name: time-gravity-acceleration-mean-Z  
 num  [-1, 1]
 
 Variable name: time-gravity-acceleration-std-X
 num  [-1, 1]
 
 Variable name: time-gravity-acceleration-std-Y 
 num  [-1, 1]
 
 Variable name: time-gravity-acceleration-std-Z
 num  [-1, 1]
 
 Variable name: time-body-accelerometer-jerk-mean-X
 num  [-1, 1]
 
 Variable name: time-body-accelerometer-jerk-mean-Y
 num  [-1, 1]
 
 Variable name: time-body-accelerometer-jerk-mean-Z
 num  [-1, 1]
 
 Variable name: time-body-accelerometer-jerk-std-X 
 num  [-1, 1]
 
 Variable name: time-body-accelerometer-jerk-std-Y 
 num  [-1, 1]
 
 Variable name: time-body-accelerometer-jerk-std-Z                
 num  [-1, 1]
 
 Variable name: time-body-gyroscope-mean-X 
 num  [-1, 1]
 
 Variable name: time-body-gyroscope-mean-Y 
 num  [-1, 1]
 
 Variable name: time-body-gyroscope-mean-Z
 num  [-1, 1]
 
 Variable name: time-body-gyroscope-std-X 
 num  [-1, 1]
 
 Variable name: time-body-gyroscope-std-Y 
 num  [-1, 1]
 
 Variable name: time-body-gyroscope-std-Z
 num  [-1, 1]
 
 Variable name: time-body-gyroscope-jerk-mean-X
 num  [-1, 1]
 
 Variable name: time-body-gyroscope-jerk-mean-Y
 num  [-1, 1]
 
 Variable name: time-body-gyroscope-jerk-mean-Z
 num  [-1, 1]
 
 Variable name: time-body-gyroscope-jerk-std-X
 num  [-1, 1]
 
 Variable name: time-body-gyroscope-jerk-std-Y
 num  [-1, 1]
 
 Variable name: time-body-gyroscope-jerk-std-Z 
 num  [-1, 1]
 
 Variable name: time-body-accelerometer-magnitude-mean
 num  [-1, 1]
 
 Variable name: time-body-accelerometer-magnitude-std
 num  [-1, 1]
 
 Variable name: time-gravity-acceleration-magnitude-mean
 num  [-1, 1]
 
 Variable name: time-gravity-acceleration-magnitude-std
 num  [-1, 1]
 
 Variable name: time-body-accelerometer-jerk-magnitude-mean 
 num  [-1, 1]
 
 Variable name: time-body-accelerometer-jerk-magnitude-std
 num  [-1, 1]
 
 Variable name: time-body-gyroscope-magnitude-mean
 num  [-1, 1]
 
 Variable name: time-body-gyroscope-magnitude-std
 num  [-1, 1]
 
 Variable name: time-body-gyroscope-jerk-magnitude-mean
 num  [-1, 1]
 
 Variable name: time-body-gyroscope-jerk-magnitude-std
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-mean-X
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-mean-Y
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-mean-Z
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-std-X
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-std-Y
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-std-Z
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-meanFreq-X
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-meanFreq-Y
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-meanFreq-Z 
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-jerk-mean-X
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-jerk-mean-Y
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-jerk-mean-Z
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-jerk-std-X
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-jerk-std-Y
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-jerk-std-Z 
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-jerk-meanFreq-X
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-jerk-meanFreq-Y
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-jerk-meanFreq-Z
 num  [-1, 1]
 
 Variable name: fourier-body-gyroscope-mean-X
 num  [-1, 1]
 
 Variable name: fourier-body-gyroscope-mean-Y
 num  [-1, 1]
 
 Variable name: fourier-body-gyroscope-mean-Z
 num  [-1, 1]
 
 Variable name: fourier-body-gyroscope-std-X
 num  [-1, 1]
 
 Variable name: fourier-body-gyroscope-std-Y 
 num  [-1, 1]
 
 Variable name: fourier-body-gyroscope-std-Z
 num  [-1, 1]
 
 Variable name: fourier-body-gyroscope-meanFreq-X
 num  [-1, 1]
 
 Variable name: fourier-body-gyroscope-meanFreq-Y
 num  [-1, 1]
 
 Variable name: fourier-body-gyroscope-meanFreq-Z
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-magnitude-mean
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-magnitude-std
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-magnitude-meanFreq
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-jerk-magnitude-mean
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-jerk-magnitude-std
 num  [-1, 1]
 
 Variable name: fourier-body-accelerometer-jerk-magnitude-meanFreq
 num  [-1, 1]
 
 Variable name: fourier-body-gyroscope-magnitude-mean
 num  [-1, 1]
 
 Variable name: fourier-body-gyroscope-magnitude-std
 num  [-1, 1]
 
 Variable name: fourier-body-gyroscope-magnitude-meanFreq
 num  [-1, 1]
 
 Variable name: fourier-body-gyroscope-jerk-magnitude-mean
 num  [-1, 1]
 
 Variable name: fourier-body-gyroscope-jerk-magnitude-std
 num  [-1, 1]
 
 Variable name: fourier-body-gyroscope-jerk-magnitude-meanFreq
 num  [-1, 1]
 

