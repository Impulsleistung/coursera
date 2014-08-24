#The "run_analysis.R"

##Line 1-8
The warnings are deactivated. This is because I use rbing, cbind and colnames with the data.table
Libs are loaded, needed for the fast data.table's
The DBG-Flags are for developmen reasons. The Debug-State-Machine controls by itself

##Line 10-16
If you run this in the first time, all Falgs of the State-Machine are set to TRUE
There are three sections in my code: downloading, chaching and merging of the data

##Line 18-19
Destination and target are declared, so that you can follow what's happening on your hard-disc-drive

##Line 21-28, DOWNLOAD
I use Linux, so downloading is done via "wget"
The data unzipps into the generated directory

##Line 29-40, CACHE
This is just about the two big data tables
Since the fread() does not work, I have to do a convert into a data.frame and then to a data.table
The data.frame is cleaned up, your memory matters to me ;-)

##Line 41-72, MERGE
1. For the test and train data set:
- import the persons, called subjects
- import the activity sets and the description of the activities
2. For the test and train data set:
- setting the column names for the big data tables
- binding the activity integer values to the big data dables
- merging the activity names into the big data tables
3. Cleaning in respect of your memory

##Line 74-76
The two sets (training and test) are binded into one. The columns are fully consistent, so this works fine.

The summary can now be done without any effort.
