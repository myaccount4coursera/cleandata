# cleandata
Repository for my course project for Coursera's "Getting and Cleaning Data".

## DESCRIPTION
When run_analysis.R is executed, it loads the information for the UCI HAR dataset and generates a dataset according to the specifications. All the steps in the procedure are commented in the code.

Basically, the steps are the following:
1. Load the datasets.
2. Set appropriate names to columns.
3. Add information on subject and activity to the corresponding datasets.
4. Put together the train and test datasets.
5. Put appropriate names to the activities.
6. Select only the columns corresponding to mean and std.
7. Do the required transformation to summarize the data.

## CODE BOOK of the resulting Dataset
* First column corresponds to the subject
* Second column is the activity
* The rest of the columsn correspond to the the average values (for that subject and activity) for the given indicator. Information on the indicators can be found in the UCI HAR documentation. Names have been preserved.
