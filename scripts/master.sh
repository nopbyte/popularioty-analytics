#!/bin/bash


source env.sh

echo 'using root dir for popularioty: ' $ROOT_DIR
################################################################################
## 1. DUMP RAW DATA
# Importing the raw data from the database... feedback and runtime information

# Exports:
# F_FEEDBACK_DUMP
# F_RUNTIME_DUMP

source 1-dump-raw-data.sh

################################################################################
## 2. RUNNING FIRST MR JOBS
# Running feedback analysis

# Exports:
# F_MR_FEEDBACK
# F_MR_RUNTIME
source 2-run-analytics-jobs.sh


################################################################################
## 3. NORMALIZE data

# Exports:
# F_NORMALIZED_DATA: output of normalized data
# F_MR_COMBINED: input of the normalization
source 3-normalize-data.sh 

################################################################################
## 4. Aggregate data (Create final reputation values querying the previous ones...
# Running the aggregator MR job

## MERGE F_NORMALIZED_DATA WITH F_MR_FEEDBACK



################################################################################
## 5. SEPARATE DATA ACCORDING TO COUCHBASE BUCKET

# Run the other pig script...

################################################################################
## 5. EXPORT DATA BACK




