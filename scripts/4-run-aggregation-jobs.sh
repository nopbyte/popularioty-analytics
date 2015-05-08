#!/bin/bash


# This script 
## Exports:
# F_AGGREGATE_OUTPUT: output of the whole aggregation
#
## Uses:
# F_MR_FEEDBACK
# F_NORMALIZED_DATA: output of normalized data

F_MR_FEEDBACK=/home/dp/hadoop_workspace/popularioty-analytics/data/output_mr_feedback
F_NORMALIZED_DATA=/home/dp/hadoop_workspace/popularioty-analytics/data/normalized_data
DATA_DIR=/home/dp/hadoop_workspace/popularioty-analytics/data 
ROOT_DIR=/home/dp/hadoop_workspace/popularioty-analytics/


################################################################################
## 4. Aggregate data (Create final reputation values querying the previous ones...
# Running the aggregator MR job

export F_AGGREGATE_INPUT=$DATA_DIR/mr_aggregate/input/
export F_AGGREGATE_OUTPUT=$DATA_DIR/mr_aggregate/output/

## MERGE F_NORMALIZED_DATA WITH F_MR_FEEDBACK

TMP=$DATA_DIR/tmp
hadoop fs -rm -r $TMP
hadoop fs -mkdir $TMP

hadoop fs -rm -r $F_AGGREGATE_INPUT
hadoop fs -mkdir -p $F_AGGREGATE_INPUT

hadoop fs -rm -r $F_AGGREGATE_OUTPUT
#hadoop fs -mkdir -p $F_AGGREGATE_OUTPUT

hadoop fs -getmerge $F_MR_FEEDBACK $TMP/mr_feedback.txt
hadoop fs -getmerge $F_NORMALIZED_DATA/so_popularity_and_activity  $TMP/mr_so_popularity_and_activity_normalized.txt
hadoop fs -getmerge $F_NORMALIZED_DATA/stream_popularity_and_activity  $TMP/mr_stream_popularity_and_activity_normalized.txt
hadoop fs -getmerge $TMP  $F_AGGREGATE_INPUT/mr_normalized_combined.txt


hadoop jar $ROOT_DIR/popularioty-analytics-aggregator/target/popularioty-analytics-aggregator-1.0-SNAPSHOT-job.jar $F_AGGREGATE_INPUT/mr_normalized_combined.txt $F_AGGREGATE_OUTPUT


################################################################################
## 5. SEPARATE DATA ACCORDING TO COUCHBASE BUCKET

# Run the other pig script...

################################################################################
## 5. EXPORT DATA BACK




