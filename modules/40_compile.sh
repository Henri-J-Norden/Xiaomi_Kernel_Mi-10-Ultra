#!/bin/bash

make --trace -j$(nproc) O=out REAL_CC=${PWD}/modules/llvm-Snapdragon_LLVM_for_Android/prebuilt/linux-x86_64/bin/clang CLANG_TRIPLE=aarch64-linux-gnu- 2>&1 | tee out/kernel.log

