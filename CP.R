setwd("~/CDS/PML/PML_CP")
library(caret)
data <- read.csv("pml-training.csv", na.strings = c("NA", "#DIV/0!"))
library(plyr)
library(dplyr)
data <- data[, -grep("^avg|^var|^stddev|^amplitude|^min|^max|^skewness|^kurtosis", attr(data, "names"))]
data <- data[, -c(1:7)]

inTrain <- createDataPartition(y = data$classe, p = 0.7, list=FALSE)
training <- data[inTrain,]
testing <- data[-inTrain,]
# Only uncorrelated features
training <- training[,-findCorrelation(cor(training[,-53]))]
