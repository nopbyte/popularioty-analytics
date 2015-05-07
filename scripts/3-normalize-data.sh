#!/bin/bash



# This script Exports:
# F_NORMALIZED_DATA
# Uses:
# F_MR_FEEDBACK
# F_MR_RUNTIME


################################################################################
## 3. NORMALIZE data

#Merge the data... check script inside feedback_run...

# Running the pig normalization script
export F_NORMALIZED_DATA=$DATA_DIR/normalized_data/
export F_MR_COMBINED=$DATA_DIR/mr_combined/

hadoop fs -rm  -r $F_NORMALIZED_DATA
haddop fs -mkdir $F_NORMALIZED_DATA

hadoop fs -rm  -r $F_MR_COMBINED
haddop fs -mkdir $F_MR_COMBINED

hadoop fs -getmerge $F_MR_FEEDBACK $F_MR_RUNTIME/mr_feedback.txt
hadoop fs -getmerge $F_MR_RUNTIME  $F_MR_COMBINED/mr_both_combined.txt

hadoop fs -mv mr_both_combined.txt $F_MR_COMBINED/mr_both_combined.txt

pig -param INPUTFILE=$F_MR_COMBINED/mr_both_combined.txt -param OUTFOLDER=$F_NORMALIZED_DATA $ROOT_DIR/popularioty-analytics-pig-sqoop/pig/normalize_runtime_info.pig 

