# Coursera - Getting and Cleaning Data Course Project
This repo contains two further files associated with the course project.

* run_analysis.R  
* codebook.md

The '*run_analysis.R*' is the R script to analyse the data and output a tidy data. The script is tested on a **ubuntu 15.04 64 bit** system. The script requires the package '**dplyr**' to be instilled on your system. If the package is **not** installed the script will **exit** without completing the task.

You will be given the option to install the '**dplyr**' package if it is not found on your system.

The script expects the following files to be in your working directory:

* activity_labels.txt  
* features.txt  
* subject_test.txt  
* subject_train.txt  
* X_test.txt  
* X_train.txt  
* y_test.txt  
* y_train.txt  

If any of the above files are not found in the working directory, you will be given the opportunity to select the file via a file dialog box.

The 'run_analysis.R' script is extensively commented to explain the actions of the script.

On sucessful completion of the script '**tidydata.txt**' will be written to the working directory.

The data dictionary for the **tidy data** can be found in *codebook.md* file.

