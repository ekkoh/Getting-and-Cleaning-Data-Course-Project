#Getting and Cleaning Data
<h3>Codebook</h3>

The objective of this project is to clean and prepare for analysis a dataset released by the University of Calfornia, Irvine, Center for Machine Learning and Intelligent Systems. The dataset includes the sensor data measured on a mobile phone of 30 subjects in the course of doing six activities. Each observation consists of 561 variables in the time and frequency domain. The data is randomly partitioned into a training and test set. The entire dataset is in three parts, the raw data, the subject data and the activity data.

As the data was arbitrarily separated into two subsets, the first step was to combine the raw training and test data into one large dataset by row binding. The corresponding subject and activity data are likewise combined. 

Next, those variables that are mean or standard deviation of measurements are extracted. The feature list gives some hints on the nature of each variable. By 'grepping' for "mean" and "std", the number of columns (variables) is reduced to 86. However, this list includes some angle measurements and mean frequency measurements. By further excluding these, the number of columns was reduced to 66.

Following that, the activity observations are transformed to text to make them readable. Readable and syntactically valid names are created from the feature list and assigned them to the data variables selected. Finally, the data are grouped by the subject and activity performed and the mean value of each activity for every subject are calculated. The resultant dataset has 180 rows and 68 columns, is clean and ready for further analysis.

Here is the key to reading the column names:
<table>
<thead><tr><td>Column name</td><td>Explanation</td></tr></thead>
<tbody>
<tr><td>subjectid</td><td>An ID identifying one of the 30 volunteers performing the activites</td></tr>
<tr><td>activity</td><td>One of six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying)</td></tr>
<tr><td>Column names starting with time or freq</td><td>Time or frequency domain measurements</td></tr>
<tr><td>Column names ending with (x, y, z)</td><td>Corresponding measurements in the x, y or z direction</td></tr>
<tr><td>Column names with "mean" or "std"</td><td>Mean or standard deviation measurements</td></tr>
</tbody>
</table>

Further information of the original dataset can be found in this paper

<cite>[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012</cite>

