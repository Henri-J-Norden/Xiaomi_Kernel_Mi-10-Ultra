#!/bin/bash

# --- Environment vars ---
PATH=${PWD}/.bin:$PATH # python -> python2
export ARCH=arm64
export SUBARCH=arm64
export DTC_EXT=dtc
export CROSS_COMPILE=${PWD}/modules/ASOP-gcc-aarch64-linux-android/bin/aarch64-linux-android-

