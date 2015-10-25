library(dplyr)
library(tidyr)

## 1. Merges the training and the test sets to create one data set
# Training dataset
x_train_set <- read.csv("train/x_train.txt", header = FALSE, sep="")
y_train_label <- read.csv("train/y_train.txt", header = FALSE, sep="", col.names = c("activity"))
train_subject <- read.csv("train/subject_train.txt", header = FALSE, sep="", col.names =c("subject"))
train_set <- cbind(train_subject, y_train_label, x_train_set)

## Test dataset
x_test_set <- read.csv("test/x_test.txt", header = FALSE, sep="")
y_test_label <- read.csv("test/y_test.txt", header = FALSE, sep="", col.names = c("activity"))
test_subject <- read.csv("test/subject_test.txt", header = FALSE, sep="", col.names =c("subject"))
test_set <- cbind(test_subject, y_test_label, x_test_set)

## Best practice to track data source
train_set <- train_set %>% mutate(ds_source = c("train"))
test_set <- test_set %>% mutate(ds_source = c("test"))

## Combined Training and Test dataset
result_set <- rbind(train_set, test_set)

## 2. Extracts mean and standard deviation for each measurement
findString <- function(pattern,x) any(grepl(pattern, x, fixed = TRUE))

for (i in 1:nrow(feature)) {
  if(!findString("mean()",feature[i,2]) && !findString("std()",feature[i,2])){
    col_name <- paste("V",as.character(i), sep="")
    result_set <- result_set %>% select(-ends_with(col_name))
  }
}


## 3. Uses descriptive activity names to name the activities in the data set
result_set$activity[result_set$activity == "1"] <- "WALKING"
result_set$activity[result_set$activity == "2"] <- "WALKING_UPSTAIRS"
result_set$activity[result_set$activity == "3"] <- "WALKING_DOWNSTAIRS"
result_set$activity[result_set$activity == "4"] <- "SITTING"
result_set$activity[result_set$activity == "5"] <- "STANDING"
result_set$activity[result_set$activity == "6"] <- "LAYING"

##Alternative method  - credits to Joyce Robbins https://class.coursera.org/getdata-033/forum/thread?thread_id=183
##activity_labels <- read.csv("activity_labels.txt", header = FALSE, sep="")
##result_set$activity <- as.factor(activity_labels$V2[result_set$activity])


## 4. Appropriately labels the data set with descriptive variable names
feature <- read.csv("features.txt", header = FALSE, sep="")
feature_sub <- data.frame(feature$V2[grepl("-std()", feature$V2, fixed =TRUE)|grepl("-mean()", feature$V2, fixed =TRUE)])

for (i in 1:nrow(feature_sub)) {
  names(result_set)[i+2] = gsub("[[:punct:]]","", feature_sub[i,])
}

## 5. Creates an independent tidy data set with the average of each variable for each activity and each subject
tidy_ds <- result_set %>% 
  group_by(subject, activity)  %>%
  summarize_each(funs(mean), -subject, -activity, -ds_source) %>%
  arrange(subject, activity)


##Generate tidy_ds.txt to upload
##write.table(tidy_ds, file = "tidy_ds.txt", row.names = FALSE)
