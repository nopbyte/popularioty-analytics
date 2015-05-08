#!/bin/bash



# This script Exports:
# F_DOC_AGGREGATIONS
# F_DOC_SUB_REPUTATION
# Uses:
# F_AGGREGATE_OUTPUT
# DATA_DIR
# ROOT_DIR
# F_AGGREGATE_OUTPUT
# F_DOC_AGGREGATIONS
# F_DOC_SUB_REPUTATION
# COUCHBASE_POP_IP
# COUCHBASE_POP_PORT
# CB_AGREGATIONS
# CB_SUB_REPUTATION


################################################################################
## 5. Split data according to buckets


TMP=$DATA_DIR/tmp

hadoop fs -rm -r $TMP
hadoop fs -mkdir $TMP

hadoop fs -getmerge $F_DOC_AGGREGATIONS $TMP/ready_to_export_aggregations.txt
hadoop fs -getmerge $F_DOC_SUB_REPUTATION $TMP/ready_to_export_subreputation.txt

$ROOT_DIR/popularioty-analytics-pig-sqoop/python/exportDocuments.py $TMP/ready_to_export_aggregations.txt $COUCHBASE_POP_IP:$COUCHBASE_POP_PORT  $CB_AGREGATIONS

$ROOT_DIR/popularioty-analytics-pig-sqoop/python/exportDocuments.py $TMP/ready_to_export_subreputation.txt  $COUCHBASE_POP_IP:$COUCHBASE_POP_PORT  $CB_SUB_REPUTATION



