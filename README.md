# GettingAndCleaningData
##Input
The raw zip file is downloaded and extracted to [getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset] sub-directory.
```
> list.files(recursive = TRUE, include.dirs = TRUE)
 [1] "activity_labels.txt"                          "features.txt"                                
 [3] "features_info.txt"                            "README.txt"                                  
 [5] "test"                                         "test/Inertial Signals"                       
 [7] "test/Inertial Signals/body_acc_x_test.txt"    "test/Inertial Signals/body_acc_y_test.txt"   
 [9] "test/Inertial Signals/body_acc_z_test.txt"    "test/Inertial Signals/body_gyro_x_test.txt"  
[11] "test/Inertial Signals/body_gyro_y_test.txt"   "test/Inertial Signals/body_gyro_z_test.txt"  
[13] "test/Inertial Signals/total_acc_x_test.txt"   "test/Inertial Signals/total_acc_y_test.txt"  
[15] "test/Inertial Signals/total_acc_z_test.txt"   "test/subject_test.txt"                       
[17] "test/X_test.txt"                              "test/y_test.txt"                             
[19] "tidy_ds.txt"                                  "train"                                       
[21] "train/Inertial Signals"                       "train/Inertial Signals/body_acc_x_train.txt" 
[23] "train/Inertial Signals/body_acc_y_train.txt"  "train/Inertial Signals/body_acc_z_train.txt" 
[25] "train/Inertial Signals/body_gyro_x_train.txt" "train/Inertial Signals/body_gyro_y_train.txt"
[27] "train/Inertial Signals/body_gyro_z_train.txt" "train/Inertial Signals/total_acc_x_train.txt"
[29] "train/Inertial Signals/total_acc_y_train.txt" "train/Inertial Signals/total_acc_z_train.txt"
[31] "train/subject_train.txt"                      "train/X_train.txt"                           
[33] "train/y_train.txt"  
```

##Process
Step 1: Set working directory to where the files were extracted, which in this case is [UCI HAR Dataset]. The scripts were written with the assumption that all the files and sub-directory structures and names remain the same.
```
> getwd()
[1] "C:/Coursera/GettingAndCleaningData/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset"
```
Step 2 : Load dplyr library. Most of the transformation processes are performed using functions available in this library.

Step 3 : Load train related data files using read.csv function. Set column name in train_label and train_subject to [activity] and [subject] respectively before cbinding subject, activity and observation data into a dataframe. The result is a dataframe with 7,352 rows and 564 columns with the first two columns being the subject and activity code. The column names for x_train.txt variables default to V1, V2, V3, etc. Repeat the same load for test data files.
```
# Training dataset
x_train_set <- read.csv("train/x_train.txt", header = FALSE, sep="")
y_train_label <- read.csv("train/y_train.txt", header = FALSE, sep="", col.names = c("activity"))
train_subject <- read.csv("train/subject_train.txt", header = FALSE, sep="", col.names =c("subject"))
train_set <- cbind(train_subject, y_train_label, x_train_set)

> dim(train_set)
[1] 7352  564
```
Step 4 : Using mutate() function of dplyr, create [ds_source] column and set to either 'train' or 'test'. This is not required but a good practice when merging different data files into a dataset/database. Rbind train and test dataframes into result_set dataframe. Dimensions of this dataframe are 10,299 and 564.

Step 5 : Load features.txt to get the list of feature descriptions. For this project, we are only interested in summarizing mean and standard dev values from the initial raw observation data. Since the number of rows in feature matches the number of columns in x_train/x_test.txt, iterate the feature using grepl function for matching 'mean()' or 'std(). If the description in the feature dataframe row does not match either string, remove the column from result_set using its position index. There are 69 remaining columns in result_set dataframe, including [subject] and [activity].

```
feature <- read.csv("features.txt", header = FALSE, sep="")

findString <- function(pattern,x) any(grepl(pattern, x, fixed = TRUE))

for (i in 1:nrow(feature)) {
  if(!findString("mean()",feature[i,2]) && !findString("std()",feature[i,2])){
    col_name <- paste("V",as.character(i), sep="")
    result_set <- result_set %>% select(-ends_with(col_name))
  }
}
```
Step 6 : Set activity codes in the second column of result_set to their corresponding descriptions as listed in activity_labels.txt
```
result_set$activity[result_set$activity == "1"] <- "WALKING"
```
Step 7 : Rename the observation variables in result_set dataframe with descriptive names as provided in feature.txt. Utilize grepl for pattern matching to filter out any descriptions that do not contain -mean() or -std() to subset feature dataframe into feature_sub. The resulting number of descriptions should match the number of V[x] variables in result_set. The following script sets the name accordingly. 
```
feature_sub <- data.frame(feature$V2[grepl("-std()", feature$V2, fixed =TRUE)|grepl("-mean()", feature$V2, fixed =TRUE)])

for (i in 1:nrow(feature_sub)) {
  names(result_set)[i+2] = gsub("[[:punct:]]","", feature_sub[i,])
}
```
Step 8 : Last step is to create a tidy dataset of average summary of the 67 variables by subject by activity. This is accomplished by piping group_by and summarize_each functions of dplyr. Sorting the result set by subject and activity using arrange function, which is optional, makes it more organized.

```
tidy_ds <- result_set %>% 
  group_by(subject, activity)  %>%
  summarize_each(funs(mean), -subject, -activity, -ds_source) %>%
  arrange(subject, activity)
```
  
##Output
The result is a dataset saved as tidy_ds.txt. This dataset adheres to the tidy data principles outlined in http://vita.had.co.nz/papers/tidy-data.pdf:

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.

```
> tbl_df(tidy_ds)
Source: local data frame [180 x 68]

   subject           activity tBodyAccmeanX tBodyAccmeanY tBodyAccmeanZ tBodyAccstdX tBodyAccstdY
     (int)              (chr)         (dbl)         (dbl)         (dbl)        (dbl)        (dbl)
1        1             LAYING     0.2215982  -0.040513953    -0.1132036  -0.92805647 -0.836827406
2        1            SITTING     0.2612376  -0.001308288    -0.1045442  -0.97722901 -0.922618642
3        1           STANDING     0.2789176  -0.016137590    -0.1106018  -0.99575990 -0.973190056
4        1            WALKING     0.2773308  -0.017383819    -0.1111481  -0.28374026  0.114461337
5        1 WALKING_DOWNSTAIRS     0.2891883  -0.009918505    -0.1075662   0.03003534 -0.031935943
6        1   WALKING_UPSTAIRS     0.2554617  -0.023953149    -0.0973020  -0.35470803 -0.002320265
7        2             LAYING     0.2813734  -0.018158740    -0.1072456  -0.97405946 -0.980277399
8        2            SITTING     0.2770874  -0.015687994    -0.1092183  -0.98682228 -0.950704499
9        2           STANDING     0.2779115  -0.018420827    -0.1059085  -0.98727189 -0.957304989
10       2            WALKING     0.2764266  -0.018594920    -0.1055004  -0.42364284 -0.078091253
..     ...                ...           ...           ...           ...          ...          ...
Variables not shown: tBodyAccstdZ (dbl), tGravityAccmeanX (dbl), tGravityAccmeanY (dbl),
  tGravityAccmeanZ (dbl), tGravityAccstdX (dbl), tGravityAccstdY (dbl), tGravityAccstdZ (dbl),
  tBodyAccJerkmeanX (dbl), tBodyAccJerkmeanY (dbl), tBodyAccJerkmeanZ (dbl), tBodyAccJerkstdX (dbl),
  tBodyAccJerkstdY (dbl), tBodyAccJerkstdZ (dbl), tBodyGyromeanX (dbl), tBodyGyromeanY (dbl),
  tBodyGyromeanZ (dbl), tBodyGyrostdX (dbl), tBodyGyrostdY (dbl), tBodyGyrostdZ (dbl),
  tBodyGyroJerkmeanX (dbl), tBodyGyroJerkmeanY (dbl), tBodyGyroJerkmeanZ (dbl), tBodyGyroJerkstdX (dbl),
  tBodyGyroJerkstdY (dbl), tBodyGyroJerkstdZ (dbl), tBodyAccMagmean (dbl), tBodyAccMagstd (dbl),
  tGravityAccMagmean (dbl), tGravityAccMagstd (dbl), tBodyAccJerkMagmean (dbl), tBodyAccJerkMagstd
  (dbl), tBodyGyroMagmean (dbl), tBodyGyroMagstd (dbl), tBodyGyroJerkMagmean (dbl), tBodyGyroJerkMagstd
  (dbl), fBodyAccmeanX (dbl), fBodyAccmeanY (dbl), fBodyAccmeanZ (dbl), fBodyAccstdX (dbl), fBodyAccstdY
  (dbl), fBodyAccstdZ (dbl), fBodyAccJerkmeanX (dbl), fBodyAccJerkmeanY (dbl), fBodyAccJerkmeanZ (dbl),
  fBodyAccJerkstdX (dbl), fBodyAccJerkstdY (dbl), fBodyAccJerkstdZ (dbl), fBodyGyromeanX (dbl),
  fBodyGyromeanY (dbl), fBodyGyromeanZ (dbl), fBodyGyrostdX (dbl), fBodyGyrostdY (dbl), fBodyGyrostdZ
  (dbl), fBodyAccMagmean (dbl), fBodyAccMagstd (dbl), fBodyBodyAccJerkMagmean (dbl),
  fBodyBodyAccJerkMagstd (dbl), fBodyBodyGyroMagmean (dbl), fBodyBodyGyroMagstd (dbl),
  fBodyBodyGyroJerkMagmean (dbl), fBodyBodyGyroJerkMagstd (dbl)
  ```
