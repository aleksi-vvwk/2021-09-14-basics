worms <- read.table("./worms.txt",header=T)
View(worms)
# to access variables by name:
attach(worms)
# to see variable names:
names(worms)
getwd()
## subscripts and indices, p. 111
# fetches value of Soil.pH (column 5) in row 3:
worms[3,5]
# use colon to generate a series of subscripts:
worms[14:19,7]
# to fetch Area and Slope from rows from rows 1 to 5:
worms[1:5,2:3]
# to select all entries in row 3:
worms[3,]
# to select all entries in column 3:
worms[,3]
# note these two similar commands return objects of different classes:
class(worms[3,])
class(worms[,3])
# can create sets of rows and columns
# extract all rows for Field Name and Soil pH (columns 1 and 5)
# use concatenate function, c, to make a vector
# of the required column numbers c(1,5):
worms[,c(1,5)]

## selecting rows from the dataframe at random, p. 113
# use sample() to select unique 8 or 20 rows at random without replacement
worms[sample(1:20,8),]

## sorting dataframes, p. 113
# sort dataframe on basis of values in Slope column
worms[order(Slope),]
# to sort in ascending order use rev() function
worms[rev(order(Slope)),]
# to sort by more than one variable:
worms[order(Vegetation,Worm.density),]
# to sort by three variables:
worms[order(Vegetation,Worm.density,Soil.pH),]
# to sort with select columns:
worms[order(Vegetation,Worm.density),c(4,7,5,3)]

## use logical conditions to select rows from the dataframe, p. 116
# select rows on basis of variable (column) values:
worms[Damp==T,]
# want rows where Worm.density is higher than the median
# and Soil.pH is less than 5.2:
worms[Worm.density>median(Worm.density)&Soil.pH< 5.2,]
# only want columns that contain numbers:
worms[,sapply(worms,is.numeric)]
# or perhaps want to extract columns that contain factors:
worms[,sapply(worms,is.factor)]
# worms is a dataframe so all characters are coerced to factors:
worms[,sapply(worms,is.character)]
# to drop rows 6 to 15 inclusive, use negative subscripts
worms[-(6:15),]
# to select all rows that are not grasslands (! means NOT):
worms[!(Vegetation=="Grassland"),]
# can couple '-' sign with which to drop rows:
worms[-which(Damp==F),]
# which achieves the same as
worms[!Damp==F,]
# or the even simpler:
worms[Damp==T,]

## omitting rows containing missing values, NA
# read in dataframe with missing data:
data <- read.table("./worms.missing.txt",header=T)
View(data)
data
# omit rows with missing data:
na.omit(data)
# alternatively can use na.exclude():
na.exclude(data)
# function to test for presence of missing values
# across a dataframe is complete.cases():
complete.cases(data)
# the following command is equivalent to na.omit(data)
data[complete.cases(data),]
# use apply() with is.na() to sum up missing values in each variable:
apply(apply(data,2,is.na),2,sum)
# make sure worms is active
# make sure worms is attached
# want one unique vegetation record per
# which has the greatest worm density

## using order and !duplicated() to eliminate psuedoreplication, p. 121
new <- worms[rev(order(Worm.density)),]
new[!duplicated(new$Vegetation),]

## complex ordering with mixed directions, p. 121
# want vegetation alphabetical (default) but
# worm density high to low (not default) within vegetation
worms[order(Vegetation,-Worm.density),]
# want vegetation z to a (not default) and
# worm density high to low within vegetation (not default)
worms[order(-rank(Vegetation),-Worm.density),]
worms[order(Vegetation,-Worm.density),]
# want columns (not rows) that contain character 'S' (upper case):
names(worms)
# or columns 3 and 5:
grep("S",names(worms))
# then we use these numbers as 
# subscripts to select columns 3 and 5
worms[,grep("S",names(worms))]

## a dataframe with row names instead of row numbers, p. 123
# want first column names of fields (p. 123)
# to be row names and not a variable
detach(worms)
worms <- read.table("./worms.txt",header=T,row.names=1)
View(worms)

## eliminating duplicate rows from a dataframe, p. 125
# use unique() function to strip duplicate rows (p. 125)
dups <- read.table("./dups.txt",header=T)
View(dups)
unique(dups)

## using the match function in dataframes, p. 127
unique(worms$Vegetation)
# what are appropriate herbicides to use in each of 20 fields
herbicides <- read.table("./herbicides.txt",header=T)
View(herbicides)
# vector of subscripts to extract relevant herbicides:
herbicides$Herbicide[match(worms$Vegetation,herbicides$Type)]
# could add this matched information as new column in worms:
worms$hb <- herbicides$Herbicide[match(worms$Vegetation,herbicides$Type)]
worms
# or simply create a new dataframe with everything:
recs <- data.frame(worms,hb=herbicides$Herbicide[match(worms$Vegetation,herbicides$Type)])
recs

## Merging Two Dataframes, p. 129

## We have two dataframes sharing variables Genus and species:
(lifeforms <- read.table("./lifeforms.txt",header=T))
(flowering <- read.table("./fltimes.txt",header=T))
View(lifeforms)
View(flowering)
## Creates one for rows that match on Genus and species:
## Is simplest merge function:
merge(flowering,lifeforms)

## If you want all with NA's inserted 
## for missing data, use all=T
(both <- merge(flowering,lifeforms,all=T))

## If same variable has different names:
(seeds <- read.table("./seedwts.txt",header=T))
View(seeds)
## The simple merge fails:
merge(both,seeds)
merge(seeds,both)

## Have to tell merge() that Genus and name1 are synonyms,
## (both describe same thing) as are species and name2
merge(both,seeds,by.x=c("Genus","species"),by.y=c("name1","name2"))

## Adding Margins to a Dataframe, p 130
## Dataframe showing sales by season and by person:
frame <- read.table("./sales.txt",header=T); frame
View(frame)

## Want margins showing departures of seasonal means
## From overall means (as extra row on bottom):
## and departures of peoples' means as extra column
## also want sales represented as departures from mean
people <- rowMeans(frame[,2:5]); people
people <- people-mean(people); people

## Add new column using cbind():
(new.frame <- cbind(frame,people))

## Calculate column means same way:
seasons <- colMeans(frame[,2:5]); seasons
seasons <- seasons-mean(seasons); seasons

## Can't use rbind so we make a copy
## of one of the rows of the new dataframe:
new.row <- new.frame[1,]; new.row

## and then edit it to include values we want:
new.row[1] <- "seasonal effects"; new.row # edit Jane.Smith
new.row[2:5] <- seasons; new.row # edit row to show mean diffs
new.row[6] <- 0; new.row # initialize gm to be 0

## Now we can use rbind() to add row to bottom:
(new.frame <- rbind(new.frame,new.row))

## Replace counts of sales from departures from overall mean
## sale per person per season (the grand mean):
gm <- mean(unlist(new.frame[1:5,2:5])); gm
gm <- rep(gm,4); gm
new.frame[1:5,2:5] <- sweep(new.frame[1:5,2:5],2,gm); new.frame

## Summarizing the Contents of Dataframes, p. 132
## Three Useful Functions:
## summary(): summarizes the contents of all variables
## aggregate(): creates a table in the fashion of tapply
## by(): performs some function for each level of specified factors

## Back to worms
worms <- read.table("./worms.txt", header=T); worms
## Attach frame so can reference variables by name
attach(worms)

## Provides info on continuous and categorical variables:
summary(worms)

## By and Aggregate summarize on basis of factor levels
by(worms,Vegetation,mean)

## Aggregate is similar to tapply; Applies a function
## to levels of a categorical variable for specified
## range of variables
aggregate(worms[,c(2,3,5,7)],by=list(veg=Vegetation),mean)
aggregate(worms[,c(2,3,5,7)],by=list(veg=Vegetation,d=Damp),mean)

## detach worms when finished with it

#####################################################################
dateNow <- gsub(" ", "_", date())
dateNowFile <- paste("day-3-4-df", dateNow, "RData", sep = ".")
save.image(file = dateNowFile)
