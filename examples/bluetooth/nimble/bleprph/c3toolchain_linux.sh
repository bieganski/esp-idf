#!/bin/bash

set -e 
set -u
source ~/.common.sh # log, error functions

SCRIPT_DIR=`cd $(dirname ${BASH_SOURCE[0]}); pwd`

log "Following script will install ESP-IDF for Linux. To install it for MacOS/Windows, please follow that guideline: https://docs.espressif.com/projects/esp-idf/en/latest/esp32c3/get-started/index.html"

echo "Espressif toolchain will be installed. Please specify it's location [default: $SCRIPT_DIR]"

read CMD

if [ "" == "$CMD" ]; then
	CMD=$SCRIPT_DIR
fi

if ! [ -d $CMD ]; then
	error "Given directory doesn't exist! ($CMD)"
fi

exit

if [ -d $SCRIPT_DIR/esp-idf ]; then
	log "esp-idf directory already exists, skip 'git clone'..."
else
	git clone --recursive https://github.com/espressif/esp-idf.git
fi


pushd esp-idf > /dev/null

./install.sh

popd > /dev/null


log "Nice, you have installed Espressif toolchain. To use it via 'idf.py' command, please \
add to .bashrc <source $SCRIPT_DIR/esp-idf/export.sh> line."

log "After exporting 'export.sh' script running command 'idf.py set-target' should list you all possible targets, among them should be ESP32 and ESP32-C3. You switch between targets before running 'idf.py build' using command <idf.py set-target esp32(c3)>'"

