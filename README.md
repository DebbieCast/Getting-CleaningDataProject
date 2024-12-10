# Getting-CleaningDataProject

The present project is divided in 5 main parts:

1) Reading the different data sets of text data into R
2) Finding common variables to merge all the data sets into a single dataset
3) Subsetting only the required columns from the dataset
4) Using metacharacters to write the right variable names
5) Re writting the data frame into a now tidy dataset in .txt format


## Part 1: Reading all datasets into R

This was an easy task because the function read.table() allows us to read
.txt formats very easily into R

With the use of the "read me" file, I detected what files had the variable names


## Part 2: finding common variables and merging

This part was easier once the variable names were put into place in step1

You could also see that the nrows() was the same for several datasets, so
this would imply that merging them would be easy


## Part 3: Subsetting mean and desvest

To subset the mean and std deviation, we could use the text subsetting 
strategies learned on this course.

The grepl() function was the easiest way to do this, by looking for all the
column names that had a "mean" or "std" on them


## Part 4: Changing variable names

One of the conditions to obtain a tidy dataset is to have explicit variable 
names.

To do this, I selected the characters with the gsub() function to replace
the names as requested


## Part 5: Re writting a tidy dataset

After all this work, we now have a tidy dataset. In order to be able to 
push it to my git repo, I used the function write.table() to create
a .txt file with the finished dataset


