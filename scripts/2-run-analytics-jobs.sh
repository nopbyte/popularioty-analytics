#!/bin/bash

#######################
# This script Exports:
# F_MR_FEEDBACK                              
# F_MR_RUNTIME

# And uses
# F_FEEDBACK_DUMP
# F_RUNTIME_DUMP
# exported by 1-dump-raw-data.sh

################################################################################
## 2. RUNNING FIRST MR JOBS
# Running feedback analysis

export F_MR_FEEDBACK=$DATA_DIR/output_mr_feedback/
hadoop fs -rm -r $F_MR_FEEDBACK

hadoop jar $ROOT_DIR/popularioty-feedback-analytics/target/popularioty-analytics-feedback-1.0-SNAPSHOT-job.jar $F_FEEDBACK_DUMP/import_feedback.txt  $F_MR_FEEDBACK

# Running runtime analysis
export F_MR_RUNTIME=$DATA_DIR/output_mr_runtime/
hadoop fs -rm -r $F_MR_RUNTIME

hadoop jar $ROOT_DIR/popularioty-runtime-analytics/target/popularioty-analytics-runtime-1.0-SNAPSHOT-job.jar $F_RUNTIME_DUMP/import_runtime.txt  $F_MR_RUNTIME



