#!/bin/bash

IMG_PATH=$1

TMP_DIR=$(mktemp -d)
CROPPED_IMG="${TMP_DIR}/cropped_$(basename $IMG_PATH)"
TEXT_FILE="${TMP_DIR}/axis_ocr_$(basename $IMG_PATH)"

WIDTH=25
HEIGHT=15
TOP=85
LEFT=52

# crop image to get y axis max tick value
convert $IMG_PATH -crop "${WIDTH}x${HEIGHT}+${LEFT}+${TOP}" $CROPPED_IMG

# read axis value with OCR
tesseract -psm 8 $CROPPED_IMG $TEXT_FILE

# read ocr result
axis_value="$( cat ${TEXT_FILE}.txt )"

# delete tmp dir
rm -rf $TMP_DIR

echo $((axis_value))
