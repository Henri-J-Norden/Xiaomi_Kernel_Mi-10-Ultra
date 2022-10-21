#!/bin/bash

rm -rd out
mkdir out
make O=out REAL_CC=${PWD}/modules/llvm-Snapdragon_LLVM_for_Android/prebuilt/linux-x86_64/bin/clang CLANG_TRIPLE=aarch64-linux-gnu- cas_user_defconfig
