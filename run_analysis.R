
features= read.table("UCI HAR Dataset/features.txt",colClasses = c("numeric","character"))

require(dplyr)

# Workaround
valid_column_names <- make.names(names=features$V2, unique=TRUE, allow_ = TRUE)

#Read the data
sub<- read.table("UCI HAR Dataset/test/subject_test.txt")
class<- read.table("UCI HAR Dataset/test/y_test.txt")
test<- read.table("UCI HAR Dataset/test/X_test.txt")
test<- cbind(sub,class,test)

train<- read.table("UCI HAR Dataset/train/X_train.txt")
sub<- read.table("UCI HAR Dataset/train/subject_train.txt")
class<- read.table("UCI HAR Dataset/train/y_train.txt")
train<- cbind(sub,class,train)

#Combine the data
data<- rbind(test,train)
colnames(data)<- c("subject", "activity", valid_column_names)

#Select the data
data_selected<-select(data, matches("(subject|activity|\\.mean\\.|\\.std\\.)"))

result<- data_selected %>% group_by(subject,activity) %>% summarise_each(funs(mean))

write.table(result, file = "result.txt", row.names = FALSE)
