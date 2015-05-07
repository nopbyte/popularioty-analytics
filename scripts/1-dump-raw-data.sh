#!/bin/bash


#######################
# This script Exports:
# F_FEEDBACK_DUMP
# F_RUNTIME_DUMP

# And uses:
# None

################################################################################
## 1. DUMP RAW DATA
# Importing the raw data from the database... feedback and runtime information

export F_FEEDBACK_DUMP=$DATA_DIR/feedback/
export F_RUNTIME_DUMP=$DATA_DIR/runtime/

hadoop fs -rm -r $F_FEEDBACK_DUMP
hadoop fs -mkdir $F_FEEDBACK_DUMP

hadoop fs -rm -r $F_RUNTIME_DUMP
hadoop fs -mkdir $F_RUNTIME_DUMP

source $ROOT_DIR/popularioty-analytics-pig-sqoop/sqoop/import_feedback.sh $F_FEEDBACK_DUMP
source $ROOT_DIR/popularioty-analytics-pig-sqoop/sqoop/import_runtime.sh  $F_RUNTIME_DUMP


hadoop fs -rm $F_RUNTIME_DUMP/*.txt.crc
hadoop fs -rm $F_FEEDBACK_DUMP/*.txt.crc
