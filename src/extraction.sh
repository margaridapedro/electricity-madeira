#!/bin/bash

DIR="$( dirname $0 )"

# digitize plot
node $DIR/plot-digitizer/plotDigitizer.js \
    --json-reference-file=$DIR/plot-digitizer/wpd_config.json \
    --input=$DIR/../data/ --output=$DIR/../ \
    --y-max-override=140
