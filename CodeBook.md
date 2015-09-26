#Code Book for tidy dataset
wich scritp "run_analysis.R" return

##Variables

Subject
	Sequence number of volunteer in the group within an age bracket of 19-48 years
	
Activity
	

##Transformations

*merge datasets from X_test.txt and X_train.tst into dataset X_all (10299 rows by 561 columns)
*cut dataset X_all to 2 columns wich contains mean and standard deviation for each row of X_all, put new table into dataset X (10299 rows by 2 columns)
*add subject numbers and activity names to X (10299 rows by 4 columns)
*agregate rows of X by pairs {subject, activity} into result dataset  RX (180 rows by 4 columns), put the mean values into RX
