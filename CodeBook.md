
features= read.table("UCI HAR Dataset/features.txt",colClasses = c("numeric","character"))

require(dplyr)

# Used variables
features: vector with the feature names

valid_column_names: a vector with transformed names so that column names can be accessed easiliy

sub: subject

class: classification

test: test data

train: training data

data: combined test and training data

data_selected: data-frame with only subject, activity, and mean/std columns

