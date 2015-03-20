# Getting and Cleaning Data
<h3>Course Project</h3>

This repository contains the results of the course project to clean up a public domain dataset to create a clean dataset for analysis. More details of the raw dataset and the operations performed to clean the data can be found in the codebook.

The steps to clean the dataset are detailed in the file run_analysis.R. This file alone performs all the cleaning steps. The programming language is R and the runtime environment is RStudio. The file run_analysis.R should be placed the directory together with the files activity_labels.txt, features.txt and features_info.txt. These text files are part of the public domain dataset and are used in the cleaning process. The raw data files are kept in two sub-directories test and train.

The cleaning process requires two R packages dplyr and reshape2. These can be installed in RStudio using the commands 
<ul>
  <li><em>install.packages(dplyr)</em></li>
  <li><em>install.packages(reshape2)</em></li>
</ul> 

Five steps were performed to clean the data
<ol>
  <li>Merge the training and test sets to create one data set</li>
  <li>Extract the measurements on the mean and standard deviation for each measurement</li>
  <li>Assign descriptive activity names to name the activities in the data set</li>
  <li>Label the data set with descriptive variable names</li>
  <li>Create an independent tidy data set with the average of each variable for each activity and each subject</li>
</ol>

For completeness, the cleaned dataset file is included in the repository.
