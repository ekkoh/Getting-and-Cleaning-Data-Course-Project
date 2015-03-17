#Getting and Cleaning Data
<h3>Project Codebook</h3>

The objective of this project is to clean and prepare a dataset released by the University of Calfornia, Irvine, Center for Machine Learning and Intelligent Systems. The dataset includes the raw data measured on a mobile phone on 30 subjects in the course of doing six activities. Each observation consists of 561 variables in the time and frequency domain. The data is further segregated into a subsets for training and tests. The entire dataset is in three parts, the raw data, the subject data and the activity data.

As the data was arbitrarily separated into two subsets, the first step was to combine the raw training and test data into one large dataset by row binding. The corresponding subject and activity data are likewised combined. 

Next, we want to extract those variables that are mean or standard deviation of measurements. The feature list gives some hints on the nature of each variable. By 'grepping' for "mean" and "std", the number of columns (variables) is reduced to 86. However, this list includes some angle measurements and mean frequency measurements. By further excluding these, the number of columns was reduced to 66.

Following that, we transform the activity observations to text to make them readable. We also created readable and syntactically valid names from the feature list and assigning them to the data variables selected. Finally we group the data by the subject and activity performed and calculated the mean value of each activity for every subject. The resultant dataset has 180 rows and 68 columns, is clean and ready for further analysis.
