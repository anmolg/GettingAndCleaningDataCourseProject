---
title: "ReadMe"
author: "Anmol Gupta"
date: "Sunday, March 22, 2015"
output: html_document
---

The dataset includes the following files:
=========================================

- 'README.MD' : How all of the scripts work and how they are connected. Currently reading the document.

- 'codeBook.MD': Describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

- 'run_analysis.R' : The script that converts the original data to the transformed data. To be used with codeBook.MD

run_analysis.R:
=========================================
**Section 1:**
Reading all the important tables, combining the test and train data, and also renaming all the variables to better represent the values of each variable.

Finally I bind all the data together to create one single data set.

**Section 2:**

All the column names were extracted because we were only interested in getting data regarding the mean and standard devaiation of each column.

The names were all changed into True/False values, reflecting the columns that the dataset is interested in.

A new dataset, combinedData, was created with all the filtered out columns. 

**Section 3:**

ActivityID was changed to represent the real values rather than an identifier. Once the data was merged, we were able to remove the ActivityID, since we now had a column Activity that told us the activity of the subject during the recording of the data.

**Section 4:**

To take the average across all the means and standard deviation for each subject and activity, I created a new dataset that had all the data except for the activity and subjectID. This dataset represented the data we wanted to transform into averages.

All the data was aggregated from the new dataset by the subjectId and activity to extract the mean of each subject/activity so there would be a single record for each activity performed by a subject.

Lastly, this transformation led us to losing the name of some variables. I changed the variables to names that would be easily recognizable

** Section 5:**

The data was written to a table, with row-names removed.