# README

The following is a block by block explanation of the **run_analysis.R** script. Set the working directory using **setwd()** to set the working directory to the path containing the **UCI HAR Dataset** folder before running the script.

**Line 1** Loads the **dplyr** package.
The code block from **Line 4 to Line 10** reads the text files using **read.table()** and assigns them to seperate data frames.
The code block from **Line 12 to Line 14** renames the training and test data frames with the appropriate column names.
The code block from **Line 16 to Line 25** replaces the activity numbers in the **test_set** data frame with the descriptive terms using **gsub()** and then renames the 1st two columns corresponding to **subject** and **activity**.
The code block from **Line 27 to Line 36** replaces the activity numbers in the **training_set** data frane with the descriptive terms using **gsub()** and then renames the 1st two columns corresponding to **subject** and **activity**.
**Line 38** merges the 2 data frames using **rbind()**.
**Line 40** removes the duplicated columns and stores it as a **'tibble'** to make it workable using the **dplyr** package.
The code block from **Line 42 to Line 45** finds the column names containing 'mean()' and 'std()' using **grep()**, extracts those columns including the 1st two, and then arranges them in ascending order according to the subject number.
The code block from **Line 47 to Line 49** groups the **data_set** data frame by **subject** and **activity** and summarizes all the variables according to their **mean**. This is assigned to a new independent data frame **grouped_mean** which is saved to the working directory using **write.table()**
