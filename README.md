## Steps to obtain the output - Final Project
### Course Name: Getting and Cleaning Data
### Student: Victor de la Cueva
### Date: January 20th, 2015

The output only was obtained for those variables with both: mean and standard deviation.
Variables with only mean were excluded.

Following procedure was used to obtain the output file:

1. Load the dplyr library

2. Load the feature name file "y_test.txt"

3. Create legal names for columns. Delete "-", "(" and ")"

4. Load the activity name file "activity_labels.txt"

5. Load test data
	5.1 Load the subject id file "subject_test.txt"
	5.2 Load the activities id file "y_test.txt"
	5.3 Load test data file "X_test.txt"

6. Appropriately label the test data set with descriptive variable names.
	6.1 Change the name of columns using features in "features.txt" file

7. Add the subject column to test data

8. Add the activity column to test data

9. Load training data
	9.1 Load the subject id file "subject_train.txt"
	9.2 Load the activities id file "y_train.txt"
	9.3 Load test data file "X_train.txt"

10. Appropriately label the train data set with descriptive variable names.
	10.1 Change the name of columns using features in "features.txt" file

11. Add the subject column to test data

12. Add the activity column to test data

13. Put together both data sets (Test and Train) in one ("dataAll")

14. Extract the measurements on the mean and standard deviation for each measurement.

15. Put descriptive activity names to name the activities in the data set

16. From the data set obtaining in last step ("dataMeanStd"), create a second, independent tidy data set
	with the average of each variable for each activity and each subjec

17. Write the final summarizing table to a file "dataStep5.txt"

18. End of Script
