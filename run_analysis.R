fileData <- "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"

  ## Download and unzip data
  if (!file.exists ("~/Desktop/UCI HAR Dataset")){
    DownloadURL <- "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"
    download.file(fileData, filename, method="curl")
  }
  
  if (!file.exists("UCI HAR Dataset")) {
    unzip(zipfile="~/Desktop/UCI HAR Dataset",exdir="./data")
  }
  
  # Load Labels and Features
  ActivityLabels <- read.table("~/Desktop/UCI HAR Dataset/activity_labels.txt")
  ActivityLabels[2] <- as.character(ActivityLabels[2])
    features <- read.table("~/Desktop/UCI HAR Dataset/features.txt")
    features[2] <= as.character(features[2])
  
  # Load Data
  
    train <- read.table("~/Desktop/UCI HAR Dataset/train/X_train.txt") %>%
    trainActivities <- read.table("~/Desktop/UCI HAR Dataset/train/Y_train.txt") %>%
    trainSubjects <- read.table("~/Desktop/UCI HAR Dataset/train/subject_train.txt") %>%
    train2 <- cbind(trainSubjects, trainActivities, train)
  
    test <- read.table("~/Desktop/UCI HAR Dataset/test/X_test.txt")
    testActivities <- read.table("~/Desktop/UCI HAR Dataset/test/Y_test.txt")
    testSubjects <- read.table("~/Desktop/UCI HAR Dataset/test/subject_test.txt")
    test2 <- cbind(testSubjects, testActivities, test)
    
  # Merge Data
  CombineData <- rbind(train, test)
  colnames(CombineData) <- c("subject", "activity")
  
  # Change this info into factors
  CombineData$activity <- factor(CombineData$activity, levels = ActivityLabels[1], labels = ActivityLabels[2])
  CombineData$subject <- as.factor(CombineData$subject)
  
  MeltData <- melt(CombineData, id = c("subject", "activity")) %>%
  MeltDataMean <- data(subject + activity ~ variable, mean)
  
  TidyText <- write.table(MeltDataMean, row.names = FALSE, quote = FALSE)
