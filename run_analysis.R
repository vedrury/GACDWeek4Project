run_analysis<-function() {
###Set library, working dir, make directory
install.packages("dplyr")
library(dplyr)
if(!file.exists("~/data")) 
{dir.create("~/data")}
setwd("~/data")
        
###Save date, data
datedownloaded<-date
        
###Save data url
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
        
###Download files, unzip
download.file(url, destfile ="~/data/UCI_raw_data.zip",method="curl")
unzip("~/data/UCI_raw_data.zip")
        
##Set up features name vector to name variables
featurenames<-read.table("~/data/UCI Har Dataset/features.txt",header=F)
featnames<-as.character(featurenames$V2)
        
##Make tables of test/train sub, x, y data
trainsub<-read.table("~/data/UCI Har Dataset/train/subject_train.txt", col.names="Subject")
trainx<-read.table("~/data/UCI Har Dataset/train/X_train.txt", col.names=featnames)
trainy<-read.table("~/data/UCI Har Dataset/train/y_train.txt", col.names="Activity")
        
testsub<-read.table("~/data/UCI Har Dataset/test/subject_test.txt", col.names="Subject")
testx<-read.table("~/data/UCI Har Dataset/test/X_test.txt", col.names=featnames)
testy<-read.table("~/data/UCI Har Dataset/test/y_test.txt", col.names="Activity")
        
###Merge datasets (objective #1)
train<-cbind(trainsub,trainy,trainx)
test<-cbind(testsub,testy,testx)
merged<-rbind(train,test)
        
##Make activity labels
actlabels<-read.table("~/data/UCI Har Dataset/activity_labels.txt",col.names=c("Activity","Activityname"),header=F)
        
###Subset just mean and std measures from merged dataset (objective 2)
mytidy<-select(merged,Subject,Activity,contains("mean"),contains("std"))
        
###Add descriptive activity names (objective 3)
mytidy$Activity<-tolower(actlabels[mytidy$Activity,2])
        
###Clean up variable names (objective 4)
names(mytidy)<-gsub("^t","Time",names(mytidy))
names(mytidy)<-gsub("^f","Frequency",names(mytidy))
names(mytidy)<-gsub("Gyro","Gyroscope",names(mytidy))
names(mytidy)<-gsub("Acc","Accelerometer",names(mytidy))
names(mytidy)<-gsub("gravity","Gravity",names(mytidy))
names(mytidy)<-gsub("Mag","Magnitude",names(mytidy))
names(mytidy)<-gsub("BodyBody","Body",names(mytidy))
names(mytidy)<-gsub("std","STD",names(mytidy))
names(mytidy)<-gsub("mean","Mean",names(mytidy))
names(mytidy)<-gsub("angle","Angle",names(mytidy))
names(mytidy)<-gsub("tBody","TimeBody",names(mytidy))
        
###Group data by subject, activity, and take mean of columns (objective 5)
finaltidy <- mytidy %>%
group_by(Subject, Activity) %>%
summarize_all((mean)) 

###Print final dataset
write.table(finaltidy,"finaltidy.txt", row.names=FALSE)
}
