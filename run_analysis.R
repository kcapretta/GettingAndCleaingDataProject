fileData <- "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"

  ## Download and unzip data
  if (!file.exists (filename = function)){
    DownloadURL <- "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"
    download.file(fileData, filename, method="curl")
  }
  
  if (!file.exists("UCI HAR Dataset")) {
    unzip(filename)
  }
  
  # Load Labels and Features
  ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
  ActivityLavels[2] <- as.character(acitivityLabels[2])
    features <- read.table("UCI HAR Dataset/features.txt")
    features[2] <= as.character(features[2])
  
  # Load Data
  
    train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresWanted]
    trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
    trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
    train <- cbind(trainSubjects, trainActivities, train)
  
    test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresWanted]
    testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
    testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
    test <- cbind(testSubjects, testActivities, test)
    
  # Merge Data
  CombineData <- rbind(train, test)
  colnames(CombineData) <- c("subject", "activity", featuresWanted.names)
  
  # Change this info into factors
  CombineData$activity <- factor(CombineData$activity, levels = activityLabels[1], labels = activityLabels[2])
  CombineData$subject <- as.factor(CombineData$subject)
  
  MeltData <- melt(CombineData, id = c("subject", activity"))
  MeltDataMean <- dcast(MeltData, subject + activity ~ variable, mean)
  
  write.table(MeltDataMean, "tidy.txt", row.names = FALSE, quote = FALSE)
