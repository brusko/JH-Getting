##### activity.R #######
##### script to getting and cleaning samsung health data ####
## I assume unzipped data files are in the ~./data/ directory

##  Read in the data, assuming all data is in the ~/data/ directory


# set working directory:
setwd("C:/Users/bk6014/Documents/RWD/JH_DataScience/Getting")

# load packages

library(reshape2)
library(plyr)
library(dplyr)


## need to 'automate' this somewhat
widths2 <- c(17, 16, 16,16,  16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16)
widths <- c(17,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16,	16)


# read body acceleration data, test and train
baxtest <- read.fwf("./data/body_acc_x_test.txt", width=widths);   baxtest <- tbl_df(baxtest)     
baytest <- read.fwf("./data/body_acc_y_test.txt", width=widths);   baytest <- tbl_df(baytest)    
baztest <- read.fwf("./data/body_acc_z_test.txt", width=widths);   baztest <- tbl_df(baztest)    

baxtrain <- read.fwf("./data/body_acc_x_train.txt", width=widths);   baxtrain <- tbl_df(baxtrain)   
baytrain <- read.fwf("./data/body_acc_y_train.txt", width=widths);   baytrain <- tbl_df(baytrain)
baztrain <- read.fwf("./data/body_acc_z_train.txt", width=widths);   baztrain <- tbl_df(baztrain)



# read body gyroscope data, test and train

bgxtest <- read.fwf("./data/body_gyro_x_test.txt", width=widths);   bgxtest <- tbl_df(bgxtest)
bgytest <- read.fwf("./data/body_gyro_y_test.txt", width=widths);   bgytest <- tbl_df(bgytest)
bgztest <- read.fwf("./data/body_gyro_z_test.txt", width=widths);   bgztest <- tbl_df(bgztest)

bgxtrain <- read.fwf("./data/body_gyro_x_train.txt", width=widths);   bgxtrain <- tbl_df(bgxtrain)
bgytrain <- read.fwf("./data/body_gyro_y_train.txt", width=widths);   bgytrain <- tbl_df(bgytrain)
bgztrain <- read.fwf("./data/body_gyro_z_train.txt", width=widths);   bgztrain <- tbl_df(bgztrain)



#### combine test and train
bax <- rbind(baxtest,baxtrain)
bay <- rbind(baytest,baytrain)
baz <- rbind(baztest,baztrain)

bgx <- rbind(bgxtest,bgxtrain)
bgy <- rbind(bgytest,bgytrain)
bgz <- rbind(bgztest,bgztrain)


## combine subject test and train

subtrain <- read.table('./data/subject_train.txt')
subtest <- read.table('./data/subject_test.txt')
subject <- rbind(subtest, subtrain)
names(subject) <- 'subject'



## combine y, test and train
ytest <- read.table('./data/y_test.txt')
ytrain <- read.table('./data/y_train.txt')

activity <- rbind(ytest, ytrain)
names(activity) <- 'activity' 



## combine X data, test and train
Xtest <- read.table('./data/X_test.txt')
Xtrain <- read.table('./data/X_train.txt')

XX <- rbind(Xtest,Xtrain)

## dim(XX)
## [1] 10299   561

XX <- tbl_df(XX)

########

## So, we now have the following:

## body acceleration;   3 each (x,y,z) of 10299 x 128 :    bax, bay, baz
## body gyroscope;       3 each(x,y,z) of 10299 x 128  :   bgx, bgy, bgz
## subject vector:    subject:   10299 x 1 : no column name!!
## activities vector:  activity:  10299 x 1 : no column name!!


## Next thing to do is select the final columns:

X <- XX[,c(1,	2,	3,	4,	5,	6,	41,	42,	43,	44,	45,	46,	81,	82,	83,	84,	85,	86,	121,122,123,124,	125,	126,	161,	162,	163,	164,	165,	166,	201,	202,	214,	215,	227,	228,	240,	241,	253,	254,	266,	267,	268,	269,	270,	271,	294,	295,	296,	345,	346,	347,	348,	349,	350,	373,	374,	375,	424,	425,	426,	427,	428,	429,	452,	453,	454,	503,	504,	513,	516,	517,	526,	529,	530,	539,	542,	543,	552,	556,	557,	558,	559,	560,	561)]

X <- tbl_df(X)

## now? add headers to X
## need feature data

feat <- read.csv('./data/mean_features.csv',header=F) 

names(X) <- feat[1:85,]
# head(X)

### Now to colbind the three "data frames"

temp <- cbind(subject, activity)
temp <- cbind(temp, X)


print("Done reading creating tidy table - temp")
print(date())

######################################

# 0. First need to put char(activities) instead of numbers 1-6
# create a lookup table

activity_labels <- read.csv('./data/activity.csv', header=F, stringsAsFactors=F)
al <- activity_labels
names(al) <- c('activity','desc')

jo <- join(temp, al, by='activity')
jo$activity <- NULL
jo2 <- jo[,c(1,87, 2:86)]
## jo3 <- rename(jo2, activity = desc)

## modify names

j4 <- jo2
names(j4) <- gsub("-", ".",names(j4))
names(j4) <- sub("_","", names(j4))
names(j4) <- sub(",","", names(j4))
names(j4) <- gsub("\\(","", names(j4))
names(j4) <- gsub("\\)","", names(j4))
names(j4) <- sub("^f","freq.", names(j4))
names(j4) <- sub("^t","time.", names(j4))


# 1.  can look at subjects one at a time, and all 6 activities

by_sub_act <- group_by(j4, subject, desc)
table <- by_sub_act %>% summarise_each(funs(mean), matches('.'))

# this is ok, but I'd like a long tidy table

tlong <- melt(table, id=c(1,2))
names(tlong) <- c('Subject','Activity','ExperimentalVariable','MeanExperimentalValue')

print(head(tlong))

## writing the tidy table to a text file
write.table(tlong, "tidy_long.txt", row.name=FALSE)




