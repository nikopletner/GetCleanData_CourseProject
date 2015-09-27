####Code Book for tidy dataset
wich scritp "run_analysis.R" return

**Variables**

Subject  -  Personal ID of person within test group of volunteers. Values: 1..30
	
Activity  -  Name of activity. Values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Variables like \*-mean()\* and \*-mean()\* - average values of each corresponding measurements of original research for each couple Subject + Activity

**Transformations**

* step 1: merge datasets from X_test.txt and X_train.tst into dataset X (10299 rows by 561 columns)

* step 2: cut dataset X: extract only columns (variables) wich names contains "mean()" or "std()"2, as a result dataset X reduced (10299 rows by 66 columns)

* step 3: merge subjects and activity labels into dataset DS (10299 rows by 68 columns)

* step 4: name columns (variables) of DS 

* step 5: create new dataset RES wich contains average of each variable for each activity and each subject
