#Kaggle Kobe Bryant shot record
setwd ("/Users/laurabishop/Documents/SMU/MSDS 6372 Applied Stats II /Projects/Project 3")
rawData <- read.csv ("dataKOBEoriginal.csv", header=TRUE, sep = ',', nrows = 30698)

df1 <- data.frame(rawData)
summary (df1)

#Separate out clean cases into own dataframe and then into own .csv
CompleteData <-  df1[complete.cases(df1), ] 
summary(CompleteData)

#Create Test File for those rows with missing shot_made_flag
TestData <- df1[!complete.cases(df1),]
summary (TestData)
#Change NA to 0 before import to SAS for shot_made_flag variable, which is known to be only NAs
TestData$shot_made_flag <-0
summary(TestData)
#write output
write.csv (x=TestData, file="KobeTest.csv", row.names=FALSE)
write.csv (x=CompleteData, file="KobeComplete.csv", row.names=FALSE)


hist(TestData$type)
logtype <- log (TestData$type)
hist(logtype)
qqnorm(TestData$type)

hist(TestData$lat)
loglat <-log(TestData$lat)
sqlat <- TestData$lat*TestData$lat
hist(sqlat)

hist(TestData$loc_x)
hist(TestData$loc_y)
hist(TestData$lon)
hist(TestData$minutes_remaining)
hist(TestData$seconds_remaining)
hist(TestData$shot_distance)
hist(TestData$shot_made_flag)
hist(TestData$period)

qqnorm(TestData)
qqline(TestData)
