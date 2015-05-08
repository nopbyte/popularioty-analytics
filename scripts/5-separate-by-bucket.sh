#!/bin/bash



# This script Exports:
# F_DOC_AGGREGATIONS
# F_DOC_SUB_REPUTATION
# Uses:
# F_AGGREGATE_OUTPUT

F_MR_FEEDBACK=/home/dp/hadoop_workspace/popularioty-analytics/data/output_mr_feedback
F_MR_RUNTIME=/home/dp/hadoop_workspace/popularioty-analytics/data/output_mr_runtime
DATA_DIR=/home/dp/hadoop_workspace/popularioty-analytics/data 
ROOT_DIR=/home/dp/hadoop_workspace/popularioty-analytics/
F_AGGREGATE_OUTPUT=/home/dp/hadoop_workspace/popularioty-analytics/data/mr_aggregate/output



################################################################################
## 5. Split data according to buckets

export F_DOC_AGGREGATIONS=$DATA_DIR/final_docs/aggregations/
export F_DOC_SUB_REPUTATION=$DATA_DIR/final_docs/subreputation/


TMP=$DATA_DIR/tmp

hadoop fs -rm -r $TMP
hadoop fs -mkdir $TMP

hadoop fs -rm -r $DATA_DIR/final_docs
hadoop fs -mkdir $DATA_DIR/final_docs

hadoop fs -rm  -r $F_DOC_AGGREGATIONS
#hadoop fs -mkdir $F_DOC_AGGREGATIONS

hadoop fs -rm  -r $F_DOC_SUB_REPUTATION
#haddop fs -mkdir $F_DOC_SUB_REPUTATION

hadoop fs -getmerge $F_AGGREGATE_OUTPUT $TMP/all_aggreations.txt

pig -param INPUTFILE=$TMP/all_aggreations.txt -param OUTFOLDER_AGG=$F_DOC_AGGREGATIONS -param OUTFOLDER_SUB=$F_DOC_SUB_REPUTATION  $ROOT_DIR/popularioty-analytics-pig-sqoop/pig/prepare_to_export.pig

