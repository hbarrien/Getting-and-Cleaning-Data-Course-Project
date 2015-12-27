# Getting-and-Cleaning-Data-Course-Project

## Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. 

You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

## Requirements
You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Solution
R script name: run_analysis.R  
R script location: https://github.com/hbarrien/Getting-and-Cleaning-Data-Course-Project/blob/master/run_analysis.R  
Code book location:  

## Results - tidy data examples

### a) STR of the merged train and test data sets
> str(extractedDT)  
'data.frame':	10299 obs. of  88 variables:  
 $ Subject                                        : int  1 1 1 1 1 1 1 1 1 1 ...  
 $ Activity                                       : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 5 5 5 5 5 5 5 5 5 5 ...  
 $ timeBodyAccelerator-Mean-X                     : num  0.289 0.278 0.28 0.279 0.277 ...  
 $ timeBodyAccelerator-Mean-Y                     : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...  
 $ timeBodyAccelerator-Mean-Z                     : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...  
 $ timeBodyAccelerator-StdDev-X                   : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...  
 $ timeBodyAccelerator-StdDev-Y                   : num  -0.983 -0.975 -0.967 -0.983 -0.981 ...  
 $ timeBodyAccelerator-StdDev-Z                   : num  -0.914 -0.96 -0.979 -0.991 -0.99 ...  
 $ timeGravityAccelerator-Mean-X                  : num  0.963 0.967 0.967 0.968 0.968 ...  
 $ timeGravityAccelerator-Mean-Y                  : num  -0.141 -0.142 -0.142 -0.144 -0.149 ...  
 $ timeGravityAccelerator-Mean-Z                  : num  0.1154 0.1094 0.1019 0.0999 0.0945 ...  
 $ timeGravityAccelerator-StdDev-X                : num  -0.985 -0.997 -1 -0.997 -0.998 ...  
 $ timeGravityAccelerator-StdDev-Y                : num  -0.982 -0.989 -0.993 -0.981 -0.988 ...  
 $ timeGravityAccelerator-StdDev-Z                : num  -0.878 -0.932 -0.993 -0.978 -0.979 ...  
 $ timeBodyAcceleratorJerk-Mean-X                 : num  0.078 0.074 0.0736 0.0773 0.0734 ...  
 $ timeBodyAcceleratorJerk-Mean-Y                 : num  0.005 0.00577 0.0031 0.02006 0.01912 ...  
 $ timeBodyAcceleratorJerk-Mean-Z                 : num  -0.06783 0.02938 -0.00905 -0.00986 0.01678 ...  
 $ timeBodyAcceleratorJerk-StdDev-X               : num  -0.994 -0.996 -0.991 -0.993 -0.996 ...  
 $ timeBodyAcceleratorJerk-StdDev-Y               : num  -0.988 -0.981 -0.981 -0.988 -0.988 ...  
 $ timeBodyAcceleratorJerk-StdDev-Z               : num  -0.994 -0.992 -0.99 -0.993 -0.992 ...  
 $ timeBodyGyroscope-Mean-X                       : num  -0.0061 -0.0161 -0.0317 -0.0434 -0.034 ...  
 $ timeBodyGyroscope-Mean-Y                       : num  -0.0314 -0.0839 -0.1023 -0.0914 -0.0747 ...  
 $ timeBodyGyroscope-Mean-Z                       : num  0.1077 0.1006 0.0961 0.0855 0.0774 ...  
 $ timeBodyGyroscope-StdDev-X                     : num  -0.985 -0.983 -0.976 -0.991 -0.985 ...  
 $ timeBodyGyroscope-StdDev-Y                     : num  -0.977 -0.989 -0.994 -0.992 -0.992 ...  
 $ timeBodyGyroscope-StdDev-Z                     : num  -0.992 -0.989 -0.986 -0.988 -0.987 ...  
 $ timeBodyGyroscopeJerk-Mean-X                   : num  -0.0992 -0.1105 -0.1085 -0.0912 -0.0908 ...  
 $ timeBodyGyroscopeJerk-Mean-Y                   : num  -0.0555 -0.0448 -0.0424 -0.0363 -0.0376 ...  
 $ timeBodyGyroscopeJerk-Mean-Z                   : num  -0.062 -0.0592 -0.0558 -0.0605 -0.0583 ...  
 $ timeBodyGyroscopeJerk-StdDev-X                 : num  -0.992 -0.99 -0.988 -0.991 -0.991 ...  
 $ timeBodyGyroscopeJerk-StdDev-Y                 : num  -0.993 -0.997 -0.996 -0.997 -0.996 ...  
 $ timeBodyGyroscopeJerk-StdDev-Z                 : num  -0.992 -0.994 -0.992 -0.993 -0.995 ...  
 $ timeBodyAcceleratorMagnitude-Mean              : num  -0.959 -0.979 -0.984 -0.987 -0.993 ...  
 $ timeBodyAcceleratorMagnitude-StdDev            : num  -0.951 -0.976 -0.988 -0.986 -0.991 ...  
 $ timeGravityAcceleratorMagnitude-Mean           : num  -0.959 -0.979 -0.984 -0.987 -0.993 ...  
 $ timeGravityAcceleratorMagnitude-StdDev         : num  -0.951 -0.976 -0.988 -0.986 -0.991 ...  
 $ timeBodyAcceleratorJerkMagnitude-Mean          : num  -0.993 -0.991 -0.989 -0.993 -0.993 ...  
 $ timeBodyAcceleratorJerkMagnitude-StdDev        : num  -0.994 -0.992 -0.99 -0.993 -0.996 ...  
 $ timeBodyGyroscopeMagnitude-Mean                : num  -0.969 -0.981 -0.976 -0.982 -0.985 ...  
 $ timeBodyGyroscopeMagnitude-StdDev              : num  -0.964 -0.984 -0.986 -0.987 -0.989 ...  
 $ timeBodyGyroscopeJerkMagnitude-Mean            : num  -0.994 -0.995 -0.993 -0.996 -0.996 ...  
 $ timeBodyGyroscopeJerkMagnitude-StdDev          : num  -0.991 -0.996 -0.995 -0.995 -0.995 ...  
 $ frequencyBodyAccelerator-Mean-X                : num  -0.995 -0.997 -0.994 -0.995 -0.997 ...  
 $ frequencyBodyAccelerator-Mean-Y                : num  -0.983 -0.977 -0.973 -0.984 -0.982 ...  
 $ frequencyBodyAccelerator-Mean-Z                : num  -0.939 -0.974 -0.983 -0.991 -0.988 ...  
 $ frequencyBodyAccelerator-StdDev-X              : num  -0.995 -0.999 -0.996 -0.996 -0.999 ...  
 $ frequencyBodyAccelerator-StdDev-Y              : num  -0.983 -0.975 -0.966 -0.983 -0.98 ...  
 $ frequencyBodyAccelerator-StdDev-Z              : num  -0.906 -0.955 -0.977 -0.99 -0.992 ...  
 $ frequencyBodyAccelerator-MeanFreq-X            : num  0.252 0.271 0.125 0.029 0.181 ...  
 $ frequencyBodyAccelerator-MeanFreq-Y            : num  0.1318 0.0429 -0.0646 0.0803 0.058 ...  
 $ frequencyBodyAccelerator-MeanFreq-Z            : num  -0.0521 -0.0143 0.0827 0.1857 0.5598 ...  
 $ frequencyBodyAcceleratorJerk-Mean-X            : num  -0.992 -0.995 -0.991 -0.994 -0.996 ...  
 $ frequencyBodyAcceleratorJerk-Mean-Y            : num  -0.987 -0.981 -0.982 -0.989 -0.989 ...  
 $ frequencyBodyAcceleratorJerk-Mean-Z            : num  -0.99 -0.99 -0.988 -0.991 -0.991 ...  
 $ frequencyBodyAcceleratorJerk-StdDev-X          : num  -0.996 -0.997 -0.991 -0.991 -0.997 ...  
 $ frequencyBodyAcceleratorJerk-StdDev-Y          : num  -0.991 -0.982 -0.981 -0.987 -0.989 ...  
 $ frequencyBodyAcceleratorJerk-StdDev-Z          : num  -0.997 -0.993 -0.99 -0.994 -0.993 ...  
 $ frequencyBodyAcceleratorJerk-MeanFreq-X        : num  0.8704 0.6085 0.1154 0.0358 0.2734 ...  
 $ frequencyBodyAcceleratorJerk-MeanFreq-Y        : num  0.2107 -0.0537 -0.1934 -0.093 0.0791 ...  
 $ frequencyBodyAcceleratorJerk-MeanFreq-Z        : num  0.2637 0.0631 0.0383 0.1681 0.2924 ...  
 $ frequencyBodyGyroscope-Mean-X                  : num  -0.987 -0.977 -0.975 -0.987 -0.982 ...  
 $ frequencyBodyGyroscope-Mean-Y                  : num  -0.982 -0.993 -0.994 -0.994 -0.993 ...  
 $ frequencyBodyGyroscope-Mean-Z                  : num  -0.99 -0.99 -0.987 -0.987 -0.989 ...  
 $ frequencyBodyGyroscope-StdDev-X                : num  -0.985 -0.985 -0.977 -0.993 -0.986 ...  
 $ frequencyBodyGyroscope-StdDev-Y                : num  -0.974 -0.987 -0.993 -0.992 -0.992 ...  
 $ frequencyBodyGyroscope-StdDev-Z                : num  -0.994 -0.99 -0.987 -0.989 -0.988 ...  
 $ frequencyBodyGyroscope-MeanFreq-X              : num  -0.2575 -0.0482 -0.2167 0.2169 -0.1533 ...  
 $ frequencyBodyGyroscope-MeanFreq-Y              : num  0.0979 -0.4016 -0.0173 -0.1352 -0.0884 ...  
 $ frequencyBodyGyroscope-MeanFreq-Z              : num  0.5472 -0.0682 -0.1107 -0.0497 -0.1622 ...  
 $ frequencyBodyAcceleratorMagnitude-Mean         : num  -0.952 -0.981 -0.988 -0.988 -0.994 ...  
 $ frequencyBodyAcceleratorMagnitude-StdDev       : num  -0.956 -0.976 -0.989 -0.987 -0.99 ...  
 $ frequencyBodyAcceleratorMagnitude-MeanFreq     : num  -0.0884 -0.0441 0.2579 0.0736 0.3943 ...  
 $ frequencyBodyAcceleratorJerkMagnitude-Mean     : num  -0.994 -0.99 -0.989 -0.993 -0.996 ...  
 $ frequencyBodyAcceleratorJerkMagnitude-StdDev   : num  -0.994 -0.992 -0.991 -0.992 -0.994 ...  
 $ frequencyBodyAcceleratorJerkMagnitude-MeanFreq : num  0.347 0.532 0.661 0.679 0.559 ...  
 $ frequencyBodyGyroscopeMagnitude-Mean           : num  -0.98 -0.988 -0.989 -0.989 -0.991 ...  
 $ frequencyBodyGyroscopeMagnitude-StdDev         : num  -0.961 -0.983 -0.986 -0.988 -0.989 ...  
 $ frequencyBodyGyroscopeMagnitude-MeanFreq       : num  -0.129 -0.272 -0.2127 -0.0357 -0.2736 ...  
 $ frequencyBodyGyroscopeJerkMagnitude-Mean       : num  -0.992 -0.996 -0.995 -0.995 -0.995 ...  
 $ frequencyBodyGyroscopeJerkMagnitude-StdDev     : num  -0.991 -0.996 -0.995 -0.995 -0.995 ...  
 $ frequencyBodyGyroscopeJerkMagnitude-MeanFreq   : num  -0.0743 0.1581 0.4145 0.4046 0.0878 ...  
 $ angle(timeBodyAcceleratorMean,gravity)         : num  -0.1128 0.0535 -0.1186 -0.0368 0.1233 ...  
 $ angle(timeBodyAcceleratorJerkMean),gravityMean): num  0.0304 -0.00743 0.1779 -0.01289 0.12254 ...  
 $ angle(timeBodyGyroscopeMean,gravityMean)       : num  -0.465 -0.733 0.101 0.64 0.694 ...  
 $ angle(timeBodyGyroscopeJerkMean,gravityMean)   : num  -0.0184 0.7035 0.8085 -0.4854 -0.616 ...  
 $ angle(X,gravityMean)                           : num  -0.841 -0.845 -0.849 -0.849 -0.848 ...  
 $ angle(Y,gravityMean)                           : num  0.18 0.18 0.181 0.182 0.185 ...  
 $ angle(Z,gravityMean)                           : num  -0.0586 -0.0543 -0.0491 -0.0477 -0.0439 ...  
  
### b) HEAD of the merged train and test data sets (showing the first 5 columns)
> head(extractedDT[,1:5], 50)  
   Subject Activity timeBodyAccelerator-Mean-X timeBodyAccelerator-Mean-Y timeBodyAccelerator-Mean-Z  
1        1 STANDING	0.28858451	-0.020294171	 -0.13290514  
2        1 STANDING	0.27841883	-0.016410568	 -0.12352019  
3        1 STANDING	0.27965306	-0.019467156	 -0.11346169  
4        1 STANDING	0.27917394	-0.026200646	 -0.12328257  
5        1 STANDING	0.27662877	-0.016569655	 -0.11536185  
6        1 STANDING	0.27719877	-0.010097850	 -0.10513725  
7        1 STANDING	0.27945388	-0.019640776	 -0.11002215  
8        1 STANDING	0.27743247	-0.030488303	 -0.12536043  
9        1 STANDING	0.27729342	-0.021750698	 -0.12075082  
10       1 STANDING	0.28058569	-0.009960298	 -0.10606516  
11       1 STANDING	0.27688027	-0.012721805	 -0.10343832  
12       1 STANDING	0.27622817	-0.021441302	 -0.10820234  
13       1 STANDING	0.27845700	-0.020414761	 -0.11273172  
14       1 STANDING	0.27717497	-0.014712802	 -0.10675647  
15       1 STANDING	0.29794572	 0.027093908	 -0.06166812  
16       1 STANDING	0.27920345	-0.023020143	 -0.12208028  
17       1 STANDING	0.27903836	-0.014800378	 -0.11684896  
18       1 STANDING	0.28013490	-0.013916951	 -0.10637048  
19       1 STANDING	0.27773106	-0.018210718	 -0.10918803  
20       1 STANDING	0.27556818	-0.016979698	 -0.11142918  
21       1 STANDING	0.27756171	-0.014318487	 -0.10787724  
22       1 STANDING	0.27715238	-0.017983328	 -0.10660117  
23       1 STANDING	0.27567630	-0.021264234	 -0.11080122  
24       1 STANDING	0.27920020	-0.017714427	 -0.10916135  
25       1 STANDING	0.28171549	-0.011910678	 -0.10287513  
26       1 STANDING	0.27899267	-0.014531029	 -0.10659617  
27       1 STANDING	0.27573444	-0.018018840	 -0.10677578  
28       1  SITTING	0.14450396	 0.189263260	0.06276932  
29       1  SITTING	0.28725164	-0.037455064	 -0.14597431  
30       1  SITTING	0.27999760	-0.019484036	 -0.10572355  
31       1  SITTING	0.22184689	 0.034107675	 -0.12361242  
32       1  SITTING	 -0.04170131	 0.175102480	0.02555178  
33       1  SITTING	0.01390367	 0.153296080	0.01624295  
34       1  SITTING	0.30368927	-0.004242805	 -0.15085028  
35       1  SITTING	0.29075969	-0.024034760	 -0.11673889  
36       1  SITTING	0.27090823	-0.014412968	 -0.10652245  
37       1  SITTING	0.27955340	-0.017001147	 -0.11051668  
38       1  SITTING	0.27635864	-0.016138088	 -0.10803259  
39       1  SITTING	0.23715407	 0.007825122	 -0.12283791  
40       1  SITTING	0.27310840	 0.006518112	 -0.10947182  
41       1  SITTING	0.28150539	-0.018434859	 -0.11139287  
42       1  SITTING	0.27843225	-0.019654302	 -0.10797029  
43       1  SITTING	0.27337960	-0.009940106	 -0.10839283  
44       1  SITTING	0.27905615	-0.016260970	 -0.11281565  
45       1  SITTING	0.27859910	-0.019910142	 -0.11118060  
46       1  SITTING	0.27328142	-0.011127209	 -0.10634926  
47       1  SITTING	0.27853812	-0.016173432	 -0.10970656  
48       1  SITTING	0.27746121	-0.017491016	 -0.10635945  
49       1  SITTING	0.27394057	-0.013147584	 -0.10543517  
50       1  SITTING	0.27930326	-0.020521383	 -0.11323643  


### c) STR of the export tidy data file
> str(tidyData)  
'data.frame':	180 obs. of  88 variables:  
 $ Subject                                        : int  1 1 1 1 1 1 2 2 2 2 ...  
 $ Activity                                       : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 1 2 3 4 5 6 1 2 3 4 ...  
 $ timeBodyAccelerator-Mean-X                     : num  0.277 0.255 0.289 0.261 0.279 ...  
 $ timeBodyAccelerator-Mean-Y                     : num  -0.01738 -0.02395 -0.00992 -0.00131 -0.01614 ...  
 $ timeBodyAccelerator-Mean-Z                     : num  -0.1111 -0.0973 -0.1076 -0.1045 -0.1106 ...  
 $ timeBodyAccelerator-StdDev-X                   : num  -0.284 -0.355 0.03 -0.977 -0.996 ...  
 $ timeBodyAccelerator-StdDev-Y                   : num  0.11446 -0.00232 -0.03194 -0.92262 -0.97319 ...  
 $ timeBodyAccelerator-StdDev-Z                   : num  -0.26 -0.0195 -0.2304 -0.9396 -0.9798 ...  
 $ timeGravityAccelerator-Mean-X                  : num  0.935 0.893 0.932 0.832 0.943 ...  
 $ timeGravityAccelerator-Mean-Y                  : num  -0.282 -0.362 -0.267 0.204 -0.273 ...  
 $ timeGravityAccelerator-Mean-Z                  : num  -0.0681 -0.0754 -0.0621 0.332 0.0135 ...  
 $ timeGravityAccelerator-StdDev-X                : num  -0.977 -0.956 -0.951 -0.968 -0.994 ...  
 $ timeGravityAccelerator-StdDev-Y                : num  -0.971 -0.953 -0.937 -0.936 -0.981 ...  
 $ timeGravityAccelerator-StdDev-Z                : num  -0.948 -0.912 -0.896 -0.949 -0.976 ...  
 $ timeBodyAcceleratorJerk-Mean-X                 : num  0.074 0.1014 0.0542 0.0775 0.0754 ...  
 $ timeBodyAcceleratorJerk-Mean-Y                 : num  0.028272 0.019486 0.02965 -0.000619 0.007976 ...  
 $ timeBodyAcceleratorJerk-Mean-Z                 : num  -0.00417 -0.04556 -0.01097 -0.00337 -0.00369 ...  
 $ timeBodyAcceleratorJerk-StdDev-X               : num  -0.1136 -0.4468 -0.0123 -0.9864 -0.9946 ...  
 $ timeBodyAcceleratorJerk-StdDev-Y               : num  0.067 -0.378 -0.102 -0.981 -0.986 ...  
 $ timeBodyAcceleratorJerk-StdDev-Z               : num  -0.503 -0.707 -0.346 -0.988 -0.992 ...  
 $ timeBodyGyroscope-Mean-X                       : num  -0.0418 0.0505 -0.0351 -0.0454 -0.024 ...  
 $ timeBodyGyroscope-Mean-Y                       : num  -0.0695 -0.1662 -0.0909 -0.0919 -0.0594 ...  
 $ timeBodyGyroscope-Mean-Z                       : num  0.0849 0.0584 0.0901 0.0629 0.0748 ...  
 $ timeBodyGyroscope-StdDev-X                     : num  -0.474 -0.545 -0.458 -0.977 -0.987 ...  
 $ timeBodyGyroscope-StdDev-Y                     : num  -0.05461 0.00411 -0.12635 -0.96647 -0.98773 ...  
 $ timeBodyGyroscope-StdDev-Z                     : num  -0.344 -0.507 -0.125 -0.941 -0.981 ...  
 $ timeBodyGyroscopeJerk-Mean-X                   : num  -0.09 -0.1222 -0.074 -0.0937 -0.0996 ...  
 $ timeBodyGyroscopeJerk-Mean-Y                   : num  -0.0398 -0.0421 -0.044 -0.0402 -0.0441 ...  
 $ timeBodyGyroscopeJerk-Mean-Z                   : num  -0.0461 -0.0407 -0.027 -0.0467 -0.049 ...  
 $ timeBodyGyroscopeJerk-StdDev-X                 : num  -0.207 -0.615 -0.487 -0.992 -0.993 ...  
 $ timeBodyGyroscopeJerk-StdDev-Y                 : num  -0.304 -0.602 -0.239 -0.99 -0.995 ...  
 $ timeBodyGyroscopeJerk-StdDev-Z                 : num  -0.404 -0.606 -0.269 -0.988 -0.992 ...  
 $ timeBodyAcceleratorMagnitude-Mean              : num  -0.137 -0.1299 0.0272 -0.9485 -0.9843 ...  
 $ timeBodyAcceleratorMagnitude-StdDev            : num  -0.2197 -0.325 0.0199 -0.9271 -0.9819 ...  
 $ timeGravityAcceleratorMagnitude-Mean           : num  -0.137 -0.1299 0.0272 -0.9485 -0.9843 ...  
 $ timeGravityAcceleratorMagnitude-StdDev         : num  -0.2197 -0.325 0.0199 -0.9271 -0.9819 ...  
 $ timeBodyAcceleratorJerkMagnitude-Mean          : num  -0.1414 -0.4665 -0.0894 -0.9874 -0.9924 ...  
 $ timeBodyAcceleratorJerkMagnitude-StdDev        : num  -0.0745 -0.479 -0.0258 -0.9841 -0.9931 ...  
 $ timeBodyGyroscopeMagnitude-Mean                : num  -0.161 -0.1267 -0.0757 -0.9309 -0.9765 ...  
 $ timeBodyGyroscopeMagnitude-StdDev              : num  -0.187 -0.149 -0.226 -0.935 -0.979 ...  
 $ timeBodyGyroscopeJerkMagnitude-Mean            : num  -0.299 -0.595 -0.295 -0.992 -0.995 ...  
 $ timeBodyGyroscopeJerkMagnitude-StdDev          : num  -0.325 -0.649 -0.307 -0.988 -0.995 ...  
 $ frequencyBodyAccelerator-Mean-X                : num  -0.2028 -0.4043 0.0382 -0.9796 -0.9952 ...  
 $ frequencyBodyAccelerator-Mean-Y                : num  0.08971 -0.19098 0.00155 -0.94408 -0.97707 ...  
 $ frequencyBodyAccelerator-Mean-Z                : num  -0.332 -0.433 -0.226 -0.959 -0.985 ...  
 $ frequencyBodyAccelerator-StdDev-X              : num  -0.3191 -0.3374 0.0243 -0.9764 -0.996 ...  
 $ frequencyBodyAccelerator-StdDev-Y              : num  0.056 0.0218 -0.113 -0.9173 -0.9723 ...  
 $ frequencyBodyAccelerator-StdDev-Z              : num  -0.28 0.086 -0.298 -0.934 -0.978 ...  
 $ frequencyBodyAccelerator-MeanFreq-X            : num  -0.2075 -0.4187 -0.3074 -0.0495 0.0865 ...  
 $ frequencyBodyAccelerator-MeanFreq-Y            : num  0.1131 -0.1607 0.0632 0.0759 0.1175 ...  
 $ frequencyBodyAccelerator-MeanFreq-Z            : num  0.0497 -0.5201 0.2943 0.2388 0.2449 ...  
 $ frequencyBodyAcceleratorJerk-Mean-X            : num  -0.1705 -0.4799 -0.0277 -0.9866 -0.9946 ...  
 $ frequencyBodyAcceleratorJerk-Mean-Y            : num  -0.0352 -0.4134 -0.1287 -0.9816 -0.9854 ...  
 $ frequencyBodyAcceleratorJerk-Mean-Z            : num  -0.469 -0.685 -0.288 -0.986 -0.991 ...  
 $ frequencyBodyAcceleratorJerk-StdDev-X          : num  -0.1336 -0.4619 -0.0863 -0.9875 -0.9951 ...  
 $ frequencyBodyAcceleratorJerk-StdDev-Y          : num  0.107 -0.382 -0.135 -0.983 -0.987 ...  
 $ frequencyBodyAcceleratorJerk-StdDev-Z          : num  -0.535 -0.726 -0.402 -0.988 -0.992 ...  
 $ frequencyBodyAcceleratorJerk-MeanFreq-X        : num  -0.209 -0.377 -0.253 0.257 0.314 ...  
 $ frequencyBodyAcceleratorJerk-MeanFreq-Y        : num  -0.3862 -0.5095 -0.3376 0.0475 0.0392 ...  
 $ frequencyBodyAcceleratorJerk-MeanFreq-Z        : num  -0.18553 -0.5511 0.00937 0.09239 0.13858 ...  
 $ frequencyBodyGyroscope-Mean-X                  : num  -0.339 -0.493 -0.352 -0.976 -0.986 ...  
 $ frequencyBodyGyroscope-Mean-Y                  : num  -0.1031 -0.3195 -0.0557 -0.9758 -0.989 ...  
 $ frequencyBodyGyroscope-Mean-Z                  : num  -0.2559 -0.4536 -0.0319 -0.9513 -0.9808 ...  
 $ frequencyBodyGyroscope-StdDev-X                : num  -0.517 -0.566 -0.495 -0.978 -0.987 ...  
 $ frequencyBodyGyroscope-StdDev-Y                : num  -0.0335 0.1515 -0.1814 -0.9623 -0.9871 ...  
 $ frequencyBodyGyroscope-StdDev-Z                : num  -0.437 -0.572 -0.238 -0.944 -0.982 ...  
 $ frequencyBodyGyroscope-MeanFreq-X              : num  0.0148 -0.1875 -0.1005 0.1892 -0.1203 ...  
 $ frequencyBodyGyroscope-MeanFreq-Y              : num  -0.0658 -0.4736 0.0826 0.0631 -0.0447 ...  
 $ frequencyBodyGyroscope-MeanFreq-Z              : num  0.000773 -0.133374 -0.075676 -0.029784 0.100608 ...  
 $ frequencyBodyAcceleratorMagnitude-Mean         : num  -0.1286 -0.3524 0.0966 -0.9478 -0.9854 ...  
 $ frequencyBodyAcceleratorMagnitude-StdDev       : num  -0.398 -0.416 -0.187 -0.928 -0.982 ...  
 $ frequencyBodyAcceleratorMagnitude-MeanFreq     : num  0.1906 -0.0977 0.1192 0.2367 0.2846 ...  
 $ frequencyBodyAcceleratorJerkMagnitude-Mean     : num  -0.0571 -0.4427 0.0262 -0.9853 -0.9925 ...  
 $ frequencyBodyAcceleratorJerkMagnitude-StdDev   : num  -0.103 -0.533 -0.104 -0.982 -0.993 ...  
 $ frequencyBodyAcceleratorJerkMagnitude-MeanFreq : num  0.0938 0.0854 0.0765 0.3519 0.4222 ...  
 $ frequencyBodyGyroscopeMagnitude-Mean           : num  -0.199 -0.326 -0.186 -0.958 -0.985 ...  
 $ frequencyBodyGyroscopeMagnitude-StdDev         : num  -0.321 -0.183 -0.398 -0.932 -0.978 ...  
 $ frequencyBodyGyroscopeMagnitude-MeanFreq       : num  0.268844 -0.219303 0.349614 -0.000262 -0.028606 ...  
 $ frequencyBodyGyroscopeJerkMagnitude-Mean       : num  -0.319 -0.635 -0.282 -0.99 -0.995 ...  
 $ frequencyBodyGyroscopeJerkMagnitude-StdDev     : num  -0.382 -0.694 -0.392 -0.987 -0.995 ...  
 $ frequencyBodyGyroscopeJerkMagnitude-MeanFreq   : num  0.191 0.114 0.19 0.185 0.334 ...  
 $ angle(timeBodyAcceleratorMean,gravity)         : num  0.060454 0.096086 -0.002695 0.027442 -0.000222 ...  
 $ angle(timeBodyAcceleratorJerkMean),gravityMean): num  -0.00793 -0.06108 0.08993 0.02971 0.02196 ...  
 $ angle(timeBodyGyroscopeMean,gravityMean)       : num  0.0131 -0.1947 0.0633 0.0677 -0.0338 ...  
 $ angle(timeBodyGyroscopeJerkMean,gravityMean)   : num  -0.0187 0.0657 -0.04 -0.0649 -0.0279 ...  
 $ angle(X,gravityMean)                           : num  -0.729 -0.647 -0.744 -0.591 -0.743 ...  
 $ angle(Y,gravityMean)                           : num  0.277 0.3348 0.2672 -0.0605 0.2702 ...  
 $ angle(Z,gravityMean)                           : num  0.0689 0.0742 0.065 -0.218 0.0123 ...  

### d) HEAD of the export tidy data file (showing the first 5 columns)
> head(tidyData[,1:5], 20)  
    Subject           Activity timeBodyAccelerator-Mean-X timeBodyAccelerator-Mean-Y timeBodyAccelerator-Mean-Z  
1         1            WALKING                  0.2773308               -0.017383819                -0.11114810  
31        1   WALKING_UPSTAIRS                  0.2554617               -0.023953149                -0.09730200  
61        1 WALKING_DOWNSTAIRS                  0.2891883               -0.009918505                -0.10756619  
91        1            SITTING                  0.2612376               -0.001308288                -0.10454418  
121       1           STANDING                  0.2789176               -0.016137590                -0.11060182  
151       1             LAYING                  0.2215982               -0.040513953                -0.11320355  
2         2            WALKING                  0.2764266               -0.018594920                -0.10550036  
32        2   WALKING_UPSTAIRS                  0.2471648               -0.021412113                -0.15251390  
62        2 WALKING_DOWNSTAIRS                  0.2776153               -0.022661416                -0.11681294  
92        2            SITTING                  0.2770874               -0.015687994                -0.10921827  
122       2           STANDING                  0.2779115               -0.018420827                -0.10590854  
152       2             LAYING                  0.2813734               -0.018158740                -0.10724561  
3         3            WALKING                  0.2755675               -0.017176784                -0.11267486  
33        3   WALKING_UPSTAIRS                  0.2608199               -0.032410941                -0.11006486  
63        3 WALKING_DOWNSTAIRS                  0.2924235               -0.019355408                -0.11613984  
93        3            SITTING                  0.2571976               -0.003502998                -0.09835792  
123       3           STANDING                  0.2800465               -0.014337656                -0.10162172  
153       3             LAYING                  0.2755169               -0.018955679                -0.10130048  
4         4            WALKING                  0.2785820               -0.014839948                -0.11140306  
34        4   WALKING_UPSTAIRS                  0.2708767               -0.031980430                -0.11421946  

