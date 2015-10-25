#Tidy Data Project Code Book	

##Project Description
The purpose of this project is to demonstrate and apply data cleaning concepts and techniques covered in Getting and Cleaning Data course. The goal is to produce an output that meets all the requirements outlined in tidy data principles, since the observation units are stored in multiple files.

##Study Design - Creating tidy data
The raw dataset is downloaded via The University of California at Irvine Machine Learning Repository website. It contains human activity signals collected using smartphones equipped with inertial censors.  Data files are available to download here.

The data files relevant to this project are:
*	features_info.txt: information on variables selected for feature vector.
*	features.txt: list of all 561 features.
*	activity_labels.txt: descriptions of the 6 activities tracked.
*	x_train.txt: training dataset of 7,352 experiments.
*	y_train.txt: dataset of 7,352 instances of the 6 training activities.
*	subject_train.txt:  7,352 instances of the 30 subjects.
*	x_test.txt: test dataset of 2,947 experiments.
*	y_test.txt: dataset of 2,947 instances of the 6 test activities.
*	subject_test.txt:  2,947 instances of the 30 subjects.


The software utilized to transform the raw files into a tidy dataset is R, which is one of the tools covered in this course. The experiment data elements have been partitioned into two separate files: training and test set. The information on activities and subjects involved in this experiment are also stored in separate files. The R scripts perform the following steps. Details are described in Readme.txt.
1	Merges the training and the test sets into one data set.
2	Extracts mean and standard deviation variables for each measurement from the dataset.
3	Apply descriptive activity names to label the 6 activities in the data.
4	Appropriately labels the data set with descriptive variable names.
5	Transform into a tidy data set with the mean of each variable by activity and by subject.

##Code Book - Variables in tiny_data.txt file
The resulting tidy data includes the following variables:
*	An identifier of the subjects participated in the experiment.
*	Activity labels.
*	A 68-feature vector of mean() and std() of time and frequency domain variables. 

Dimensions:
```
> dim(tidy_ds)
[1] 180  68
```
Summary:
```
> summary(tidy_ds)
    subject                   activity  tBodyAccmeanX    tBodyAccmeanY       tBodyAccmeanZ     
 Min.   : 1.0   LAYING            :30   Min.   :0.2216   Min.   :-0.040514   Min.   :-0.15251  
 1st Qu.: 8.0   SITTING           :30   1st Qu.:0.2712   1st Qu.:-0.020022   1st Qu.:-0.11207  
 Median :15.5   STANDING          :30   Median :0.2770   Median :-0.017262   Median :-0.10819  
 Mean   :15.5   WALKING           :30   Mean   :0.2743   Mean   :-0.017876   Mean   :-0.10916  
 3rd Qu.:23.0   WALKING_DOWNSTAIRS:30   3rd Qu.:0.2800   3rd Qu.:-0.014936   3rd Qu.:-0.10443  
 Max.   :30.0   WALKING_UPSTAIRS  :30   Max.   :0.3015   Max.   :-0.001308   Max.   :-0.07538  
  tBodyAccstdX      tBodyAccstdY       tBodyAccstdZ     tGravityAccmeanX  tGravityAccmeanY  
 Min.   :-0.9961   Min.   :-0.99024   Min.   :-0.9877   Min.   :-0.6800   Min.   :-0.47989  
 1st Qu.:-0.9799   1st Qu.:-0.94205   1st Qu.:-0.9498   1st Qu.: 0.8376   1st Qu.:-0.23319  
 Median :-0.7526   Median :-0.50897   Median :-0.6518   Median : 0.9208   Median :-0.12782  
 Mean   :-0.5577   Mean   :-0.46046   Mean   :-0.5756   Mean   : 0.6975   Mean   :-0.01621  
 3rd Qu.:-0.1984   3rd Qu.:-0.03077   3rd Qu.:-0.2306   3rd Qu.: 0.9425   3rd Qu.: 0.08773  
 Max.   : 0.6269   Max.   : 0.61694   Max.   : 0.6090   Max.   : 0.9745   Max.   : 0.95659  
 tGravityAccmeanZ   tGravityAccstdX   tGravityAccstdY   tGravityAccstdZ   tBodyAccJerkmeanX
 Min.   :-0.49509   Min.   :-0.9968   Min.   :-0.9942   Min.   :-0.9910   Min.   :0.04269  
 1st Qu.:-0.11726   1st Qu.:-0.9825   1st Qu.:-0.9711   1st Qu.:-0.9605   1st Qu.:0.07396  
 Median : 0.02384   Median :-0.9695   Median :-0.9590   Median :-0.9450   Median :0.07640  
 Mean   : 0.07413   Mean   :-0.9638   Mean   :-0.9524   Mean   :-0.9364   Mean   :0.07947  
 3rd Qu.: 0.14946   3rd Qu.:-0.9509   3rd Qu.:-0.9370   3rd Qu.:-0.9180   3rd Qu.:0.08330  
 Max.   : 0.95787   Max.   :-0.8296   Max.   :-0.6436   Max.   :-0.6102   Max.   :0.13019  
 tBodyAccJerkmeanY    tBodyAccJerkmeanZ   tBodyAccJerkstdX  tBodyAccJerkstdY  tBodyAccJerkstdZ  
 Min.   :-0.0386872   Min.   :-0.067458   Min.   :-0.9946   Min.   :-0.9895   Min.   :-0.99329  
 1st Qu.: 0.0004664   1st Qu.:-0.010601   1st Qu.:-0.9832   1st Qu.:-0.9724   1st Qu.:-0.98266  
 Median : 0.0094698   Median :-0.003861   Median :-0.8104   Median :-0.7756   Median :-0.88366  
 Mean   : 0.0075652   Mean   :-0.004953   Mean   :-0.5949   Mean   :-0.5654   Mean   :-0.73596  
 3rd Qu.: 0.0134008   3rd Qu.: 0.001958   3rd Qu.:-0.2233   3rd Qu.:-0.1483   3rd Qu.:-0.51212  
 Max.   : 0.0568186   Max.   : 0.038053   Max.   : 0.5443   Max.   : 0.3553   Max.   : 0.03102  
 tBodyGyromeanX     tBodyGyromeanY     tBodyGyromeanZ     tBodyGyrostdX     tBodyGyrostdY    
 Min.   :-0.20578   Min.   :-0.20421   Min.   :-0.07245   Min.   :-0.9943   Min.   :-0.9942  
 1st Qu.:-0.04712   1st Qu.:-0.08955   1st Qu.: 0.07475   1st Qu.:-0.9735   1st Qu.:-0.9629  
 Median :-0.02871   Median :-0.07318   Median : 0.08512   Median :-0.7890   Median :-0.8017  
 Mean   :-0.03244   Mean   :-0.07426   Mean   : 0.08744   Mean   :-0.6916   Mean   :-0.6533  
 3rd Qu.:-0.01676   3rd Qu.:-0.06113   3rd Qu.: 0.10177   3rd Qu.:-0.4414   3rd Qu.:-0.4196  
 Max.   : 0.19270   Max.   : 0.02747   Max.   : 0.17910   Max.   : 0.2677   Max.   : 0.4765  
 tBodyGyrostdZ     tBodyGyroJerkmeanX tBodyGyroJerkmeanY tBodyGyroJerkmeanZ  tBodyGyroJerkstdX
 Min.   :-0.9855   Min.   :-0.15721   Min.   :-0.07681   Min.   :-0.092500   Min.   :-0.9965  
 1st Qu.:-0.9609   1st Qu.:-0.10322   1st Qu.:-0.04552   1st Qu.:-0.061725   1st Qu.:-0.9800  
 Median :-0.8010   Median :-0.09868   Median :-0.04112   Median :-0.053430   Median :-0.8396  
 Mean   :-0.6164   Mean   :-0.09606   Mean   :-0.04269   Mean   :-0.054802   Mean   :-0.7036  
 3rd Qu.:-0.3106   3rd Qu.:-0.09110   3rd Qu.:-0.03842   3rd Qu.:-0.048985   3rd Qu.:-0.4629  
 Max.   : 0.5649   Max.   :-0.02209   Max.   :-0.01320   Max.   :-0.006941   Max.   : 0.1791  
 tBodyGyroJerkstdY tBodyGyroJerkstdZ tBodyAccMagmean   tBodyAccMagstd    tGravityAccMagmean
 Min.   :-0.9971   Min.   :-0.9954   Min.   :-0.9865   Min.   :-0.9865   Min.   :-0.9865   
 1st Qu.:-0.9832   1st Qu.:-0.9848   1st Qu.:-0.9573   1st Qu.:-0.9430   1st Qu.:-0.9573   
 Median :-0.8942   Median :-0.8610   Median :-0.4829   Median :-0.6074   Median :-0.4829   
 Mean   :-0.7636   Mean   :-0.7096   Mean   :-0.4973   Mean   :-0.5439   Mean   :-0.4973   
 3rd Qu.:-0.5861   3rd Qu.:-0.4741   3rd Qu.:-0.0919   3rd Qu.:-0.2090   3rd Qu.:-0.0919   
 Max.   : 0.2959   Max.   : 0.1932   Max.   : 0.6446   Max.   : 0.4284   Max.   : 0.6446   
 tGravityAccMagstd tBodyAccJerkMagmean tBodyAccJerkMagstd tBodyGyroMagmean  tBodyGyroMagstd  
 Min.   :-0.9865   Min.   :-0.9928     Min.   :-0.9946    Min.   :-0.9807   Min.   :-0.9814  
 1st Qu.:-0.9430   1st Qu.:-0.9807     1st Qu.:-0.9765    1st Qu.:-0.9461   1st Qu.:-0.9476  
 Median :-0.6074   Median :-0.8168     Median :-0.8014    Median :-0.6551   Median :-0.7420  
 Mean   :-0.5439   Mean   :-0.6079     Mean   :-0.5842    Mean   :-0.5652   Mean   :-0.6304  
 3rd Qu.:-0.2090   3rd Qu.:-0.2456     3rd Qu.:-0.2173    3rd Qu.:-0.2159   3rd Qu.:-0.3602  
 Max.   : 0.4284   Max.   : 0.4345     Max.   : 0.4506    Max.   : 0.4180   Max.   : 0.3000  
 tBodyGyroJerkMagmean tBodyGyroJerkMagstd fBodyAccmeanX     fBodyAccmeanY      fBodyAccmeanZ    
 Min.   :-0.99732     Min.   :-0.9977     Min.   :-0.9952   Min.   :-0.98903   Min.   :-0.9895  
 1st Qu.:-0.98515     1st Qu.:-0.9805     1st Qu.:-0.9787   1st Qu.:-0.95361   1st Qu.:-0.9619  
 Median :-0.86479     Median :-0.8809     Median :-0.7691   Median :-0.59498   Median :-0.7236  
 Mean   :-0.73637     Mean   :-0.7550     Mean   :-0.5758   Mean   :-0.48873   Mean   :-0.6297  
 3rd Qu.:-0.51186     3rd Qu.:-0.5767     3rd Qu.:-0.2174   3rd Qu.:-0.06341   3rd Qu.:-0.3183  
 Max.   : 0.08758     Max.   : 0.2502     Max.   : 0.5370   Max.   : 0.52419   Max.   : 0.2807  
  fBodyAccstdX      fBodyAccstdY       fBodyAccstdZ     fBodyAccJerkmeanX fBodyAccJerkmeanY
 Min.   :-0.9966   Min.   :-0.99068   Min.   :-0.9872   Min.   :-0.9946   Min.   :-0.9894  
 1st Qu.:-0.9820   1st Qu.:-0.94042   1st Qu.:-0.9459   1st Qu.:-0.9828   1st Qu.:-0.9725  
 Median :-0.7470   Median :-0.51338   Median :-0.6441   Median :-0.8126   Median :-0.7817  
 Mean   :-0.5522   Mean   :-0.48148   Mean   :-0.5824   Mean   :-0.6139   Mean   :-0.5882  
 3rd Qu.:-0.1966   3rd Qu.:-0.07913   3rd Qu.:-0.2655   3rd Qu.:-0.2820   3rd Qu.:-0.1963  
 Max.   : 0.6585   Max.   : 0.56019   Max.   : 0.6871   Max.   : 0.4743   Max.   : 0.2767  
 fBodyAccJerkmeanZ fBodyAccJerkstdX  fBodyAccJerkstdY  fBodyAccJerkstdZ    fBodyGyromeanX   
 Min.   :-0.9920   Min.   :-0.9951   Min.   :-0.9905   Min.   :-0.993108   Min.   :-0.9931  
 1st Qu.:-0.9796   1st Qu.:-0.9847   1st Qu.:-0.9737   1st Qu.:-0.983747   1st Qu.:-0.9697  
 Median :-0.8707   Median :-0.8254   Median :-0.7852   Median :-0.895121   Median :-0.7300  
 Mean   :-0.7144   Mean   :-0.6121   Mean   :-0.5707   Mean   :-0.756489   Mean   :-0.6367  
 3rd Qu.:-0.4697   3rd Qu.:-0.2475   3rd Qu.:-0.1685   3rd Qu.:-0.543787   3rd Qu.:-0.3387  
 Max.   : 0.1578   Max.   : 0.4768   Max.   : 0.3498   Max.   :-0.006236   Max.   : 0.4750  
 fBodyGyromeanY    fBodyGyromeanZ    fBodyGyrostdX     fBodyGyrostdY     fBodyGyrostdZ    
 Min.   :-0.9940   Min.   :-0.9860   Min.   :-0.9947   Min.   :-0.9944   Min.   :-0.9867  
 1st Qu.:-0.9700   1st Qu.:-0.9624   1st Qu.:-0.9750   1st Qu.:-0.9602   1st Qu.:-0.9643  
 Median :-0.8141   Median :-0.7909   Median :-0.8086   Median :-0.7964   Median :-0.8224  
 Mean   :-0.6767   Mean   :-0.6044   Mean   :-0.7110   Mean   :-0.6454   Mean   :-0.6577  
 3rd Qu.:-0.4458   3rd Qu.:-0.2635   3rd Qu.:-0.4813   3rd Qu.:-0.4154   3rd Qu.:-0.3916  
 Max.   : 0.3288   Max.   : 0.4924   Max.   : 0.1966   Max.   : 0.6462   Max.   : 0.5225  
 fBodyAccMagmean   fBodyAccMagstd    fBodyBodyAccJerkMagmean fBodyBodyAccJerkMagstd fBodyBodyGyroMagmean
 Min.   :-0.9868   Min.   :-0.9876   Min.   :-0.9940         Min.   :-0.9944        Min.   :-0.9865     
 1st Qu.:-0.9560   1st Qu.:-0.9452   1st Qu.:-0.9770         1st Qu.:-0.9752        1st Qu.:-0.9616     
 Median :-0.6703   Median :-0.6513   Median :-0.7940         Median :-0.8126        Median :-0.7657     
 Mean   :-0.5365   Mean   :-0.6210   Mean   :-0.5756         Mean   :-0.5992        Mean   :-0.6671     
 3rd Qu.:-0.1622   3rd Qu.:-0.3654   3rd Qu.:-0.1872         3rd Qu.:-0.2668        3rd Qu.:-0.4087     
 Max.   : 0.5866   Max.   : 0.1787   Max.   : 0.5384         Max.   : 0.3163        Max.   : 0.2040     
 fBodyBodyGyroMagstd fBodyBodyGyroJerkMagmean fBodyBodyGyroJerkMagstd
 Min.   :-0.9815     Min.   :-0.9976          Min.   :-0.9976        
 1st Qu.:-0.9488     1st Qu.:-0.9813          1st Qu.:-0.9802        
 Median :-0.7727     Median :-0.8779          Median :-0.8941        
 Mean   :-0.6723     Mean   :-0.7564          Mean   :-0.7715        
 3rd Qu.:-0.4277     3rd Qu.:-0.5831          3rd Qu.:-0.6081        
 Max.   : 0.2367     Max.   : 0.1466          Max.   : 0.2878        
```

Observation Variables and Units:
```
> variable.names(tidy_ds)
 [1] "subject"                  "activity"                 "tBodyAccmeanX"           
 [4] "tBodyAccmeanY"            "tBodyAccmeanZ"            "tBodyAccstdX"            
 [7] "tBodyAccstdY"             "tBodyAccstdZ"             "tGravityAccmeanX"        
[10] "tGravityAccmeanY"         "tGravityAccmeanZ"         "tGravityAccstdX"         
[13] "tGravityAccstdY"          "tGravityAccstdZ"          "tBodyAccJerkmeanX"       
[16] "tBodyAccJerkmeanY"        "tBodyAccJerkmeanZ"        "tBodyAccJerkstdX"        
[19] "tBodyAccJerkstdY"         "tBodyAccJerkstdZ"         "tBodyGyromeanX"          
[22] "tBodyGyromeanY"           "tBodyGyromeanZ"           "tBodyGyrostdX"           
[25] "tBodyGyrostdY"            "tBodyGyrostdZ"            "tBodyGyroJerkmeanX"      
[28] "tBodyGyroJerkmeanY"       "tBodyGyroJerkmeanZ"       "tBodyGyroJerkstdX"       
[31] "tBodyGyroJerkstdY"        "tBodyGyroJerkstdZ"        "tBodyAccMagmean"         
[34] "tBodyAccMagstd"           "tGravityAccMagmean"       "tGravityAccMagstd"       
[37] "tBodyAccJerkMagmean"      "tBodyAccJerkMagstd"       "tBodyGyroMagmean"        
[40] "tBodyGyroMagstd"          "tBodyGyroJerkMagmean"     "tBodyGyroJerkMagstd"     
[43] "fBodyAccmeanX"            "fBodyAccmeanY"            "fBodyAccmeanZ"           
[46] "fBodyAccstdX"             "fBodyAccstdY"             "fBodyAccstdZ"            
[49] "fBodyAccJerkmeanX"        "fBodyAccJerkmeanY"        "fBodyAccJerkmeanZ"       
[52] "fBodyAccJerkstdX"         "fBodyAccJerkstdY"         "fBodyAccJerkstdZ"        
[55] "fBodyGyromeanX"           "fBodyGyromeanY"           "fBodyGyromeanZ"          
[58] "fBodyGyrostdX"            "fBodyGyrostdY"            "fBodyGyrostdZ"           
[61] "fBodyAccMagmean"          "fBodyAccMagstd"           "fBodyBodyAccJerkMagmean" 
[64] "fBodyBodyAccJerkMagstd"   "fBodyBodyGyroMagmean"     "fBodyBodyGyroMagstd"     
[67] "fBodyBodyGyroJerkMagmean" "fBodyBodyGyroJerkMagstd" 

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
