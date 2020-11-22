#!/bin/bash

INPUT_FILE=$1
INPUT_DIR="$(dirname $INPUT_FILE)"

SCRIPT_DIR="$( dirname $0 )"

# identify y max
y_max="$( ${SCRIPT_DIR}/axis-detection/axis.sh $INPUT_FILE )"

# digitize plot
node $SCRIPT_DIR/plot-digitizer/plotDigitizer.js \
    --json-reference-file=$SCRIPT_DIR/plot-digitizer/wpd_config.json \
    --input=$INPUT_DIR --output=./ \
    --y-max-override=$y_max
