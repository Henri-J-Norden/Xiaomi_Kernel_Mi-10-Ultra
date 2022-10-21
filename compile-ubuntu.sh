#!/bin/bash

# --- Dependencies ---
apt-get update
apt-get install -y git ccache automake flex lzop bison \
gperf build-essential zip curl zlib1g-dev \
g++-multilib python3-networkx libxml2-utils bzip2 libbz2-dev \
libbz2-1.0 libghc-bzlib-dev squashfs-tools pngcrush \
schedtool dpkg-dev liblz4-tool make optipng maven libssl-dev \
pwgen libswitch-perl policycoreutils minicom libxml-sax-base-perl \
libxml-simple-perl bc libc6-dev-i386 lib32ncurses5-dev \
x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev xsltproc unzip python2 libncurses5

# --- Environment vars ---
PATH=${PWD}/.bin:$PATH # python -> python2
export ARCH=arm64
export SUBARCH=arm64
#export DTC_EXT=dtc
export CROSS_COMPILE=${PWD}/modules/ASOP-gcc-aarch64-linux-android/bin/aarch64-linux-android-

# --- Configure ---
rm -rd out
mkdir out
make O=out REAL_CC=${PWD}/modules/llvm-Snapdragon_LLVM_for_Android/prebuilt/linux-x86_64/bin/clang CLANG_TRIPLE=aarch64-linux-gnu- cas_user_defconfig

# --- Compile ---
make -j$(nproc) O=out REAL_CC=${PWD}/modules/llvm-Snapdragon_LLVM_for_Android/prebuilt/linux-x86_64/bin/clang CLANG_TRIPLE=aarch64-linux-gnu- 2>&1 | tee out/kernel.log


