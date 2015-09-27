####Code Book for tidy dataset wich script "run_analysis.R" return

**Variables**

Subject  -  Personal ID of person within test group of volunteers. Values: 1..30
	
Activity  -  Name of activity. Values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

All another variables - average values of each corresponding measurements of original research for each original couple Subject + Activity (see "features_info.txt" in the original dataset "UCI HAR Dataset"). Values: within [-1, 1].

**Transformations**

* step 1: merging datasets from X_test.txt and X_train.txt into dataset X (10299 rows by 561 columns)

* step 2: cutting dataset X: extracting only columns (variables) wich names contains "mean()" or "std()", as a result dataset X reduced (10299 rows by 66 columns)

* step 3: merging subjects and activity labels into dataset DS (10299 rows by 68 columns)

* step 4: naming columns (variables) of DS

* step 5: creating new dataset RES wich aggregates variables for each activity and each subject to their average values (180 rows by 68 columns) 
